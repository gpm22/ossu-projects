import random
import subprocess
import re
import matplotlib.pyplot as plt
import numpy as np
from statistics import mean, stdev

# ────────────────────────────────────────────────
# Locality trace generator (based on Combining Patterns)
# ────────────────────────────────────────────────
def generate_locality_trace(length=400, seed=None):
    if seed is not None:
        random.seed(seed)
    
    trace = []
    
    # Phase 1: tight inner loop

    for _ in range(25):
        trace.extend(list(range(9)) + [random.randint(100, 115)])
    
    # Phase 2: larger working set with some repetition
    ws =  list(range(50, 100))
    for _ in range(60):
        trace.append(random.choice(ws))
        if random.random() < 0.2:
            trace.append(random.randint(20, 35))  # occasional jump
    
    # Phase 3: return to earlier pages + noise
    trace.extend([4,5,6] * 15 + [random.randint(0,40) for _ in range(20)])
    
    # Final tight hotspot
    trace.extend([1,2,1,3,1,2] * 20)
    
    return trace[:length]
# ────────────────────────────────────────────────
# Format trace as comma-separated string for -a argument
# ────────────────────────────────────────────────
def trace_to_arg_string(trace):
    return ",".join(map(str, trace))

# ────────────────────────────────────────────────
# Call paging-policy.py and extract final hit count
# ────────────────────────────────────────────────
def run_paging_policy(trace, policy, cache_size=5, maxpage=50, notrace=True):
    """
    Calls: python3 paging-policy.py -a <trace> -p <policy> -C <cache_size> ...
    Returns number of hits (from FINALSTATS line)
    """
    trace_str = trace_to_arg_string(trace)
    notrace_flag = "-c" if notrace else ""   # -c usually means concise/no detailed trace

    cmd = [
        "python3", "paging-policy.py",
        "-a", trace_str,
        "-p", policy,
        "-C", str(cache_size),
        "--maxpage", str(maxpage),
        notrace_flag
    ]

    try:
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        output = result.stdout

        # Look for line like: FINALSTATS hits 42   misses 18   hitrate 70.00
        match = re.search(r"FINALSTATS\s+hits\s+(\d+)\s+misses\s+\d+\s+hitrate", output)
        if match:
            hits = int(match.group(1))
            return hits
        else:
            print(f"Warning: could not parse hits from output for {policy}")
            print("Output was:")
            print(output)
            return 0

    except subprocess.CalledProcessError as e:
        print(f"Error running paging-policy.py for {policy}:")
        print(e.stderr)
        return 0
    except FileNotFoundError:
        print("Error: paging-policy.py not found in current directory.")
        return 0


# ────────────────────────────────────────────────
# Run N experiments, average results
# ────────────────────────────────────────────────
def run_experiments(n_runs=50, trace_length=400, cache_size=5, max_page=50):
    policies = ["FIFO", "LRU", "OPT", "CLOCK", "RAND"]
    # Add "UNOPT" if your paging-policy.py supports it
    # policies.append("UNOPT")

    results = {p: [] for p in policies}

    for run in range(n_runs):
        # Fresh locality trace every run (with different seed for randomness)
        trace = generate_locality_trace(
            length=trace_length,
            seed=run   # different seed → variations in random parts
        )

        print(f"Run {run+1}/{n_runs}  (trace length={trace_length})", end="\r")

        for policy in policies:
            hits = run_paging_policy(
                trace=trace,
                policy=policy,
                cache_size=cache_size,
                maxpage=max_page,
                notrace=True   # change to False for debugging
            )
            results[policy].append(hits)

    print("\nDone.")

    # Compute stats
    stats = {}
    for policy, hit_list in results.items():
        avg_hits = mean(hit_list)
        std_hits = stdev(hit_list) if len(hit_list) > 1 else 0
        avg_hit_rate = (avg_hits / trace_length) * 100
        stats[policy] = {
            "avg_hits": round(avg_hits, 2),
            "std_hits": round(std_hits, 2),
            "avg_hit_rate": round(avg_hit_rate, 2)
        }

    return stats, trace_length, cache_size, n_runs


# ────────────────────────────────────────────────
# Plot average hit rates with error bars
# ────────────────────────────────────────────────
def plot_results(stats, trace_length, cache_size, n_runs):
    policies = list(stats.keys())
    avg_hit_rates = [stats[p]["avg_hit_rate"] for p in policies]
    std_hit_rates = [stats[p]["std_hits"] / trace_length * 100 for p in policies]

    plt.figure(figsize=(10, 6))
    bars = plt.bar(policies, avg_hit_rates, yerr=std_hit_rates, capsize=6,
                   color='lightgreen', edgecolor='black', alpha=0.85)

    plt.ylabel('Average Hit Rate (%)')
    plt.title(f'Page Replacement Policies — Average over {n_runs} Locality Traces\n'
              f'(trace length = {trace_length}, cache size = {cache_size})')
    plt.ylim(0, 100)
    plt.grid(axis='y', linestyle='--', alpha=0.4)

    # Labels on bars
    for bar, rate in zip(bars, avg_hit_rates):
        plt.text(bar.get_x() + bar.get_width()/2., bar.get_height() + 1.5,
                 f'{rate:.1f}%', ha='center', va='bottom', fontsize=10)

    plt.tight_layout()
    plt.show()


# ────────────────────────────────────────────────
# Main
# ────────────────────────────────────────────────
if __name__ == "__main__":
    # ← Customize these
    N_RUNS         = 100
    TRACE_LENGTH   = 300
    CACHE_SIZE     = 10
    MAX_PAGE       = 40     # adjust based on trace gen (pages up to ~35+)

    print(f"Running {N_RUNS} experiments "
          f"(trace length={TRACE_LENGTH}, cache={CACHE_SIZE}, max_page={MAX_PAGE})")

    stats, tl, cs, nr = run_experiments(
        n_runs=N_RUNS,
        trace_length=TRACE_LENGTH,
        cache_size=CACHE_SIZE,
        max_page=MAX_PAGE
    )

    print("\nAverage results:")
    for p, data in stats.items():
        print(f"{p:6} : {data['avg_hit_rate']:5.2f}%  "
              f"(±{data['std_hits']/tl*100:4.2f}%)   avg hits = {data['avg_hits']:.1f}")

    plot_results(stats, tl, cs, nr)