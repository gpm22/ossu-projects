import matplotlib.pyplot as plt
import numpy as np
from statistics import mean, stdev
from trace_utils import generate_locality_trace, trace_to_arg_string, run_paging_policy

# ────────────────────────────────────────────────
# Call paging-policy.py and extract final hit count
# ────────────────────────────────────────────────


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
                notrace=True,
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
