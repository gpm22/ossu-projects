import random
import subprocess
import re
import matplotlib.pyplot as plt
import numpy as np
from statistics import mean, stdev

# ────────────────────────────────────────────────
# Generate one random trace (list of integers)
# ────────────────────────────────────────────────
def generate_random_trace(length=30, max_page=9, seed=None):
    if seed is not None:
        random.seed(seed)
    return [random.randint(0, max_page) for _ in range(length)]

# ────────────────────────────────────────────────
# Format trace as comma-separated string for -a argument
# ────────────────────────────────────────────────
def trace_to_arg_string(trace):
    return ",".join(map(str, trace))

# ────────────────────────────────────────────────
# Call paging-policy.py and extract final hit count
# ────────────────────────────────────────────────
def run_paging_policy(trace, policy, cache_size=5, maxpage=10, notrace=True):
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
def run_experiments(n_runs=50, trace_length=40, cache_size=5, max_page=9):
    policies = ["FIFO", "LRU", "OPT", "CLOCK", "RAND"]
    # Add "UNOPT" or "MRU" only if your version of paging-policy.py supports it
    # policies = ["FIFO", "LRU", "OPT", "CLOCK", "RAND", "UNOPT"]

    results = {p: [] for p in policies}

    for run in range(n_runs):
        # Fresh random trace every run
        trace = generate_random_trace(
            length=trace_length,
            max_page=max_page,
            seed=run   # different seed → different trace
        )

        print(f"Run {run+1}/{n_runs}  (trace length={trace_length})", end="\r")

        for policy in policies:
            hits = run_paging_policy(
                trace=trace,
                policy=policy,
                cache_size=cache_size,
                maxpage=max_page,
                notrace=True   # change to False if you want to see trace for debugging
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
                   color='skyblue', edgecolor='black', alpha=0.85)

    plt.ylabel('Average Hit Rate (%)')
    plt.title(f'Page Replacement Policies — Average over {n_runs} random traces\n'
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
    TRACE_LENGTH   = 60
    CACHE_SIZE     = 5
    MAX_PAGE       = 12     # pages numbered 0..12

    print(f"Running {N_RUNS} experiments "
          f"(trace length={TRACE_LENGTH}, cache={CACHE_SIZE}, pages=0..{MAX_PAGE})")

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