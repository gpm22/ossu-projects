#!/usr/bin/env python3
import subprocess
import matplotlib.pyplot as plt
import numpy as np
import os

def run_simulation(policy, cache_size, trace_file="transformed_pages_22.txt", clock_bits=2):
    """
    Run the paging policy simulation and return the hitrate
    """
    # Construct the command
    cmd = [
        "python3", "paging-policy.py",
        "-N",  # No trace
        "-c",  # Compute answers
        "-f", trace_file,
        "-p", policy,
        "-C", str(cache_size),
        "-b", str(clock_bits)
    ]
    
    # Run the command
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        output = result.stdout
        
        # Parse the output to extract hitrate
        for line in output.split('\n'):
            if "FINALSTATS" in line:
                # Extract hitrate from line like: "FINALSTATS hits 123   misses 456   hitrate 21.23"
                parts = line.split()
                for i, part in enumerate(parts):
                    if "hitrate" in part:
                        hitrate = float(parts[i + 1])
                        return hitrate
                # Alternative parsing
                hitrate_str = line.split("hitrate")[-1].strip()
                hitrate = float(hitrate_str)
                return hitrate
    except subprocess.CalledProcessError as e:
        print(f"Error running simulation for policy {policy}, cache size {cache_size}:")
        print(f"Command: {' '.join(cmd)}")
        print(f"Error: {e}")
        return 0
    
    return 0

def plot_results(results, cache_sizes, output_file="hitrate_vs_cache.png"):
    """
    Plot hitrate vs cache size for each policy
    """
    plt.figure(figsize=(12, 8))
    
    # Define colors and markers for each policy
    colors = {
        'FIFO': 'blue',
        'LRU': 'red',
        'OPT': 'green',
        'RAND': 'purple',
        'CLOCK': 'orange',
        'MRU': 'brown',
        'UNOPT': 'pink'
    }
    
    markers = {
        'FIFO': 'o',
        'LRU': 's',
        'OPT': '^',
        'RAND': 'D',
        'CLOCK': 'v',
        'MRU': '<',
        'UNOPT': '>'
    }
    
    # Plot each policy
    for policy in results:
        if policy in results and results[policy]:
            plt.plot(cache_sizes, results[policy], 
                    marker=markers.get(policy, 'o'),
                    color=colors.get(policy, 'black'),
                    linewidth=2,
                    markersize=8,
                    label=policy)
    
    plt.xlabel('Cache Size (pages)', fontsize=14)
    plt.ylabel('Hit Rate (%)', fontsize=14)
    plt.title('Hit Rate vs Cache Size for Different Paging Policies', fontsize=16, fontweight='bold')
    plt.grid(True, alpha=0.3)
    plt.legend(fontsize=12)
    plt.xticks(fontsize=12)
    plt.yticks(fontsize=12)
    
    # Set y-axis limits
    plt.ylim(0, 100)
    
    # Add some padding
    plt.tight_layout()
    
    # Save and show
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    print(f"\nPlot saved to {output_file}")
    plt.show()

def main():
    # Define the policies to test
    policies = ['FIFO', 'LRU', 'OPT', 'RAND', 'CLOCK']
    # policies = ['FIFO', 'LRU', 'OPT', 'RAND', 'CLOCK', 'MRU', 'UNOPT']
    
    # Define cache sizes to test (you can adjust this range)
    cache_sizes = list(range(1, 31))  # From 1 to 30 pages
    
    # Define the trace file path
    trace_file = "../../transformed_pages_22.txt"
    
    # Verify trace file exists
    if not os.path.exists(trace_file):
        # Try alternative path
        trace_file = "transformed_pages_22.txt"
        if not os.path.exists(trace_file):
            print(f"Error: Trace file not found at {trace_file}")
            print("Please update the trace_file path in the script.")
            return
    
    print(f"Using trace file: {trace_file}")
    print(f"Testing cache sizes from {cache_sizes[0]} to {cache_sizes[-1]} pages")
    print(f"Testing policies: {', '.join(policies)}")
    print("\nRunning simulations...")
    
    # Dictionary to store results: policy -> list of hitrates
    results = {policy: [] for policy in policies}
    
    # Run simulations for each policy and cache size
    total_simulations = len(policies) * len(cache_sizes)
    simulation_count = 0
    
    for policy in policies:
        print(f"\nTesting {policy} policy...")
        
        for cache_size in cache_sizes:
            simulation_count += 1
            progress = (simulation_count / total_simulations) * 100
            print(f"  Progress: {progress:.1f}% - Cache size: {cache_size}", end='\r')
            
            hitrate = run_simulation(policy, cache_size, trace_file)
            results[policy].append(hitrate)
    
    print("\n\nAll simulations completed!")
    
    # Print summary table
    print("\n" + "="*80)
    print("SUMMARY TABLE")
    print("="*80)
    print(f"{'Cache Size':<12}", end='')
    for policy in policies:
        print(f"{policy:<10}", end='')
    print()
    print("-"*80)
    
    for i, cache_size in enumerate(cache_sizes):
        print(f"{cache_size:<12}", end='')
        for policy in policies:
            if i < len(results[policy]):
                print(f"{results[policy][i]:<10.2f}", end='')
            else:
                print(f"{'N/A':<10}", end='')
        print()
    
    # Find best performing policy for each cache size
    print("\n" + "="*80)
    print("BEST POLICY FOR EACH CACHE SIZE")
    print("="*80)
    print(f"{'Cache Size':<12}{'Best Policy':<15}{'Hit Rate (%)':<15}")
    print("-"*45)
    
    for i, cache_size in enumerate(cache_sizes):
        best_policy = None
        best_hitrate = -1
        
        for policy in policies:
            if i < len(results[policy]):
                if results[policy][i] > best_hitrate:
                    best_hitrate = results[policy][i]
                    best_policy = policy
        
        if best_policy:
            print(f"{cache_size:<12}{best_policy:<15}{best_hitrate:<15.2f}")
    
    # Plot the results
    plot_results(results, cache_sizes)
    
    # Additional analysis: Calculate improvement from smallest to largest cache
    print("\n" + "="*80)
    print("IMPROVEMENT ANALYSIS (from smallest to largest cache)")
    print("="*80)
    print(f"{'Policy':<10}{'Min Hit Rate':<15}{'Max Hit Rate':<15}{'Improvement':<15}")
    print("-"*55)
    
    for policy in policies:
        if results[policy]:
            min_hit = min(results[policy])
            max_hit = max(results[policy])
            improvement = max_hit - min_hit
            print(f"{policy:<10}{min_hit:<15.2f}{max_hit:<15.2f}{improvement:<15.2f}")

if __name__ == "__main__":
    main()