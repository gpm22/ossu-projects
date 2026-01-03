#!/usr/bin/env python3
"""
TLB Size Measurement Runner
Runs the compiled tlb program with varying page counts and analyzes results.
"""

import subprocess
import argparse
import sys
import time
import json
import statistics
import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path
from typing import List, Tuple, Optional

def run_tlb(pages: int, trials: int, program: str = "./tlb") -> Optional[float]:
    """
    Run the tlb program and extract the average access time.
    Returns: access time in nanoseconds or None if failed.
    """
    try:
        # Run the program
        result = subprocess.run(
            [program, str(pages), str(trials)],
            capture_output=True,
            text=True,
            timeout=120  # Timeout after 120 seconds
        )
        
        if result.returncode != 0:
            print(f"  Error (return code {result.returncode}): {result.stderr[:100]}")
            return None
        
        # Parse output to find access time
        for line in result.stdout.split('\n'):
            if "Average time per page access:" in line:
                time_str = line.split(':')[1].strip().split()[0]
                return float(time_str)
            elif "Average TLB access time:" in line:
                time_str = line.split(':')[1].strip().split()[0]
                return float(time_str)
            elif "access_time_ns" in line and "Average" not in line:
                # Might be simple numeric output
                try:
                    return float(line.strip())
                except ValueError:
                    continue
        
        # If we get here, try to find any floating point number in output
        for word in result.stdout.split():
            try:
                return float(word)
            except ValueError:
                continue
        
        print(f"  Could not parse output: {result.stdout[:100]}")
        return None
        
    except subprocess.TimeoutExpired:
        print(f"  Timeout after 10 seconds")
        return None
    except FileNotFoundError:
        print(f"  Program not found: {program}")
        return None
    except Exception as e:
        print(f"  Unexpected error: {e}")
        return None

def generate_page_sequence(max_pages: int, step_type: str = "power2") -> List[int]:
    """
    Generate a sequence of page counts to test.
    
    Args:
        max_pages: Maximum number of pages to test
        step_type: "power2" for powers of two, "mixed" for denser sampling
    
    Returns:
        List of page counts to test
    """
    pages = set()
    
    if step_type == "power2":
        # Pure powers of two: 1, 2, 4, 8, 16, ...
        p = 1
        while p <= max_pages:
            pages.add(p)
            p *= 2
    
    elif step_type == "detailed":
        # More detailed sampling, especially around common TLB sizes
        # Small values
        for p in range(1, 33):
            pages.add(p)
        
        # Powers of two
        p = 1
        while p <= max_pages:
            pages.add(p)
            p *= 2
        
        # Common TLB sizes and surrounding values
        common_areas = [8, 12, 16, 24, 32, 48, 64, 96, 128, 192, 256, 
                       384, 512, 768, 1024, 1536, 2048, 3072, 4096]
        for p in common_areas:
            if p <= max_pages:
                pages.add(p)
    
    else:  # "mixed" - default
        # Powers of two with some intermediate values
        p = 1
        while p <= max_pages:
            pages.add(p)
            
            # Add values around powers of two for better detection
            if p >= 8:
                pages.add(int(p * 0.75))
                pages.add(int(p * 1.5))
            
            p *= 2
        
        # Ensure max_pages is included
        pages.add(max_pages)
    
    return sorted(pages)

def run_experiment(max_pages: int = 2048, 
                   trials: int = 1000000,
                   step_type: str = "mixed",
                   program: str = "./tlb",
                   num_runs: int = 3) -> List[Tuple[int, float]]:
    """
    Run the experiment with varying page counts.
    
    Returns:
        List of (pages, average_access_time_ns) tuples
    """
    print(f"=== TLB Size Measurement Experiment ===")
    print(f"Program: {program}")
    print(f"Max pages: {max_pages}")
    print(f"Base trials: {trials}")
    print(f"Step type: {step_type}")
    print(f"Runs per measurement: {num_runs}")
    print("=" * 50)
    
    # Generate page sequence
    page_sequence = generate_page_sequence(max_pages, step_type)
    print(f"Testing {len(page_sequence)} page counts: {page_sequence[:10]}..." 
          if len(page_sequence) > 10 else f"Testing page counts: {page_sequence}")
    print()
    
    results = []
    
    for idx, pages in enumerate(page_sequence):
        # Adjust trials for large page counts to avoid very long runs
        adjusted_trials = trials
        if pages > 1024:
            adjusted_trials = trials // 8
        elif pages > 256:
            adjusted_trials = trials // 4
        elif pages > 64:
            adjusted_trials = trials // 2
        
        print(f"[{idx+1:3d}/{len(page_sequence):3d}] Pages: {pages:4d}, Trials: {adjusted_trials:8d}...", 
              end="", flush=True)
        
        # Run multiple times for better accuracy
        run_times = []
        for run in range(num_runs):
            access_time = run_tlb(pages, adjusted_trials, program)
            if access_time is not None:
                run_times.append(access_time)
        
        if run_times:
            avg_time = statistics.mean(run_times)
            if len(run_times) > 1:
                std_dev = statistics.stdev(run_times)
                print(f" {avg_time:7.2f} ns (±{std_dev:.2f})")
            else:
                print(f" {avg_time:7.2f} ns")
            
            results.append((pages, avg_time))
        else:
            print(" FAILED")
    
    print(f"\nExperiment complete! Successfully measured {len(results)}/{len(page_sequence)} points")
    return results

def analyze_results(results: List[Tuple[int, float]], 
                    threshold_percent: float = 25.0) -> dict:
    """
    Analyze results to detect TLB size based on access time jumps.
    
    Args:
        results: List of (pages, access_time_ns) tuples
        threshold_percent: Minimum percentage increase to consider significant
    
    Returns:
        Dictionary with analysis results
    """
    if len(results) < 2:
        return {"error": "Not enough data points for analysis"}
    
    # Sort by page count
    results.sort(key=lambda x: x[0])
    pages = [r[0] for r in results]
    times = [r[1] for r in results]
    
    # Find significant jumps
    jumps = []
    for i in range(1, len(times)):
        percent_increase = ((times[i] - times[i-1]) / times[i-1]) * 100
        
        if percent_increase > threshold_percent:
            jump_info = {
                "from_pages": pages[i-1],
                "to_pages": pages[i],
                "percent_increase": percent_increase,
                "time_before_ns": times[i-1],
                "time_after_ns": times[i],
                "estimated_tlb_size": pages[i-1]  # Size before jump
            }
            jumps.append(jump_info)
    
    # Analyze for multiple TLB levels
    tlb_levels = []
    if jumps:
        # Sort jumps by page count
        jumps.sort(key=lambda x: x["from_pages"])
        
        for i, jump in enumerate(jumps):
            level = i + 1
            level_name = f"L{level} TLB" if level <= 2 else f"Level {level} TLB"
            
            tlb_levels.append({
                "name": level_name,
                "estimated_entries": jump["estimated_tlb_size"],
                "hit_time_ns": jump["time_before_ns"],
                "miss_penalty_ns": jump["time_after_ns"] - jump["time_before_ns"],
                "detected_at_pages": jump["from_pages"]
            })
    
    # Calculate overall statistics
    stats = {
        "min_time_ns": min(times),
        "max_time_ns": max(times),
        "avg_time_ns": statistics.mean(times),
        "median_time_ns": statistics.median(times),
        "time_range_ns": max(times) - min(times)
    }
    
    return {
        "total_measurements": len(results),
        "page_range": f"{min(pages)} to {max(pages)}",
        "statistics": stats,
        "significant_jumps": jumps,
        "tlb_levels": tlb_levels,
        "data_points": [{"pages": p, "time_ns": t} for p, t in zip(pages, times)]
    }

def print_analysis(analysis: dict):
    """Print analysis results in a readable format"""
    print("\n" + "="*60)
    print("TLB ANALYSIS RESULTS")
    print("="*60)
    
    print(f"\nMeasurements: {analysis['total_measurements']} data points")
    print(f"Page range: {analysis['page_range']} pages")
    
    stats = analysis['statistics']
    print(f"\nAccess Time Statistics:")
    print(f"  Minimum: {stats['min_time_ns']:.2f} ns")
    print(f"  Maximum: {stats['max_time_ns']:.2f} ns")
    print(f"  Average: {stats['avg_time_ns']:.2f} ns")
    print(f"  Median:  {stats['median_time_ns']:.2f} ns")
    print(f"  Range:   {stats['time_range_ns']:.2f} ns")
    
    jumps = analysis['significant_jumps']
    if jumps:
        print(f"\n{'='*60}")
        print("DETECTED TLB CHARACTERISTICS")
        print("="*60)
        
        for i, jump in enumerate(jumps):
            print(f"\nJump {i+1}:")
            print(f"  Detected at: {jump['from_pages']} → {jump['to_pages']} pages")
            print(f"  Increase: {jump['percent_increase']:.1f}%")
            print(f"  Estimated TLB size: {jump['estimated_tlb_size']} entries")
            print(f"  Hit time: {jump['time_before_ns']:.2f} ns")
            print(f"  Miss penalty: {jump['time_after_ns'] - jump['time_before_ns']:.2f} ns")
    
    levels = analysis['tlb_levels']
    if levels:
        print(f"\n{'='*60}")
        print("INFERRED TLB HIERARCHY")
        print("="*60)
        
        for level in levels:
            print(f"\n{level['name']}:")
            print(f"  Size: {level['estimated_entries']} entries")
            print(f"  Hit time: {level['hit_time_ns']:.2f} ns")
            print(f"  Miss penalty: {level['miss_penalty_ns']:.2f} ns")
    
    if not jumps:
        print(f"\nNo significant TLB size jumps detected.")
        print("Possible reasons:")
        print("  1. TLB is larger than tested range")
        print("  2. TLB has high associativity")
        print("  3. Hardware prefetching is masking misses")
        print("  4. Try increasing max_pages or using more detailed step_type")

def plot_results(results: List[Tuple[int, float]], 
                 analysis: dict,
                 save_plot: bool = True,
                 show_plot: bool = True):
    """Create visualization of the results"""
    if not results:
        print("No results to plot")
        return
    
    # Sort by page count
    results.sort(key=lambda x: x[0])
    pages = [r[0] for r in results]
    times = [r[1] for r in results]
    
    # Create figure with subplots
    fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(12, 10))
    
    # Plot 1: Access time vs pages (log scale)
    ax1.plot(pages, times, 'bo-', linewidth=2, markersize=6)
    ax1.set_xlabel('Number of Pages', fontsize=12)
    ax1.set_ylabel('Access Time per Page (ns)', fontsize=12)
    ax1.set_title('TLB Access Time vs Number of Pages', fontsize=14, fontweight='bold')
    ax1.set_xscale('log', base=2)
    ax1.grid(True, alpha=0.3)
    
    # Mark detected TLB sizes
    jumps = analysis.get('significant_jumps', [])
    for jump in jumps:
        ax1.axvline(x=jump['from_pages'], color='red', linestyle='--', alpha=0.7, linewidth=1)
        ax1.annotate(f'TLB~{jump["estimated_tlb_size"]}', 
                    xy=(jump['from_pages'], ax1.get_ylim()[1]*0.9),
                    xytext=(5, 0), textcoords='offset points',
                    rotation=90, verticalalignment='top',
                    fontsize=10, color='red')
    
    # Plot 2: Access time vs pages (linear scale for small values)
    # Show only up to 256 pages for clarity
    idx_limit = next((i for i, p in enumerate(pages) if p > 256), len(pages))
    ax2.plot(pages[:idx_limit], times[:idx_limit], 'ro-', linewidth=2, markersize=6)
    ax2.set_xlabel('Number of Pages', fontsize=12)
    ax2.set_ylabel('Access Time per Page (ns)', fontsize=12)
    ax2.set_title('First 256 Pages (Linear Scale)', fontsize=14, fontweight='bold')
    ax2.grid(True, alpha=0.3)
    
    # Add text box with summary
    stats_text = f"Measurements: {len(results)}\n"
    stats_text += f"Min time: {min(times):.1f} ns\n"
    stats_text += f"Max time: {max(times):.1f} ns\n"
    
    if jumps:
        stats_text += f"\nDetected TLB sizes:\n"
        for i, jump in enumerate(jumps[:3]):  # Show first 3
            stats_text += f"  {jump['estimated_tlb_size']} entries\n"
    
    ax2.text(0.02, 0.98, stats_text, transform=ax2.transAxes,
            fontsize=10, verticalalignment='top',
            bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.8))
    
    plt.tight_layout()
    
    if save_plot:
        plot_file = "tlb_analysis.png"
        plt.savefig(plot_file, dpi=150, bbox_inches='tight')
        print(f"\nPlot saved to {plot_file}")
    
    if show_plot:
        plt.show()
    
    return fig

def save_results(results: List[Tuple[int, float]], 
                 analysis: dict,
                 filename: str = "tlb_results.json"):
    """Save results to JSON file"""
    data = {
        "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
        "results": [{"pages": p, "time_ns": t} for p, t in results],
        "analysis": analysis
    }
    
    with open(filename, 'w') as f:
        json.dump(data, f, indent=2)
    
    print(f"Results saved to {filename}")
    
    # Also save CSV for easy processing
    csv_file = filename.replace('.json', '.csv')
    import csv
    with open(csv_file, 'w', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(['pages', 'access_time_ns'])
        for pages, time_ns in results:
            writer.writerow([pages, time_ns])
    
    print(f"CSV data saved to {csv_file}")

def main():
    parser = argparse.ArgumentParser(
        description="Run TLB size measurement experiments",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s                        # Run with default settings
  %(prog)s -m 4096 -t 500000      # Test up to 4096 pages with 500k trials
  %(prog)s -s power2              # Use pure powers of two stepping
  %(prog)s -p ./my_tlb -r 5       # Use custom program with 5 runs per point
  %(prog)s -q                     # Quiet mode (no plots)
        """
    )
    
    parser.add_argument("-p", "--program", default="./tlb",
                       help="Path to tlb executable (default: ./tlb)")
    parser.add_argument("-m", "--max-pages", type=int, default=2048,
                       help="Maximum number of pages to test (default: 2048)")
    parser.add_argument("-t", "--trials", type=int, default=1000000,
                       help="Number of trials per measurement (default: 1000000)")
    parser.add_argument("-s", "--step-type", default="mixed",
                       choices=["power2", "mixed", "detailed"],
                       help="Page stepping strategy (default: mixed)")
    parser.add_argument("-r", "--runs", type=int, default=3,
                       help="Number of runs per measurement (default: 3)")
    parser.add_argument("-q", "--quiet", action="store_true",
                       help="Quiet mode - don't show plots")
    parser.add_argument("-o", "--output", default="tlb_results.json",
                       help="Output JSON file (default: tlb_results.json)")
    parser.add_argument("--threshold", type=float, default=25.0,
                       help="Threshold for significant time jump (default: 25%%)")
    
    args = parser.parse_args()
    
    # Check if program exists
    if not Path(args.program).exists():
        print(f"Error: Program '{args.program}' not found")
        print("Make sure tlb.c is compiled: gcc -O2 -o tlb tlb.c -lm")
        sys.exit(1)
    
    # Run experiment
    results = run_experiment(
        max_pages=args.max_pages,
        trials=args.trials,
        step_type=args.step_type,
        program=args.program,
        num_runs=args.runs
    )
    
    if not results:
        print("No results collected. Exiting.")
        sys.exit(1)
    
    # Analyze results
    analysis = analyze_results(results, args.threshold)
    
    # Print analysis
    print_analysis(analysis)
    
    # Save results
    save_results(results, analysis, args.output)
    
    # Plot results (unless quiet mode)
    if not args.quiet:
        plot_results(results, analysis, show_plot=True)

if __name__ == "__main__":
    main()
