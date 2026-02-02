from trace_utils import generate_locality_trace, trace_to_arg_string, run_paging_policy
import matplotlib.pyplot as plt
from statistics import mean


# ────────────────────────────────────────────────
# Main experiment: test CLOCK with different bit counts
# ────────────────────────────────────────────────
def run_clock_bits_experiment(
    n_runs=30,
    trace_length=400,
    cache_size=10,
    max_page=120,
    clock_bits_values=[1, 2, 3, 4, 8, 16]
):
    policies_of_interest = ["FIFO", "LRU", "OPT"]  # baselines
    results = {f"CLOCK-{bits}": [] for bits in clock_bits_values}
    baseline_results = {p: [] for p in policies_of_interest}

    for run in range(n_runs):
        trace = generate_locality_trace(length=trace_length, seed=1000 + run)
        print(f"Run {run+1}/{n_runs} ...", end="\r")

        # Baselines (once per trace)
        for pol in policies_of_interest:
            hits = run_paging_policy(
                trace, pol, cache_size=cache_size, maxpage=max_page
            )
            baseline_results[pol].append(hits)

        # CLOCK with different bit counts
        for bits in clock_bits_values:
            hits = run_paging_policy(
                trace, "CLOCK", cache_size=cache_size,
                clockbits=bits, maxpage=max_page
            )
            results[f"CLOCK-{bits}"].append(hits)

    print("\nDone.")

    # Compute statistics
    stats = {}
    total_accesses = trace_length

    for label, hit_list in {**results, **baseline_results}.items():
        if not hit_list:
            continue
        avg_hits = mean(hit_list)
        avg_hit_rate = (avg_hits / total_accesses) * 100
        stats[label] = {
            "avg_hit_rate": round(avg_hit_rate, 2),
            "avg_hits": round(avg_hits, 1),
            "n": len(hit_list)
        }

    return stats, total_accesses, cache_size, n_runs, clock_bits_values

def plot_clock_bits_results(stats, trace_length, cache_size, n_runs, clock_bits_values):
    clock_labels = [f"CLOCK-{b}" for b in clock_bits_values]
    clock_rates = [stats.get(lab, {"avg_hit_rate": 0})["avg_hit_rate"] for lab in clock_labels]

    baseline_labels = [p for p in ["FIFO", "LRU", "OPT"] if p in stats]
    baseline_rates = [stats[p]["avg_hit_rate"] for p in baseline_labels]

    # Positions
    clock_positions = list(range(len(clock_labels)))
    gap_position = len(clock_labels) + 1
    baseline_positions = [gap_position + i for i in range(len(baseline_labels))]

    # All positions and labels in order
    all_positions = clock_positions + [gap_position] + baseline_positions
    all_labels = clock_labels + [""] + baseline_labels

    plt.figure(figsize=(11, 6))

    # CLOCK bars
    plt.bar(clock_positions, clock_rates,
            color='cornflowerblue', edgecolor='navy', alpha=0.85,
            label='CLOCK (varying bits)')

    # Baseline bars
    plt.bar(baseline_positions, baseline_rates,
            color='lightcoral', edgecolor='darkred', alpha=0.85,
            label='Baselines')

    plt.ylabel('Average Hit Rate (%)')
    plt.title(f'CLOCK Performance vs. Number of Clock Bits\n'
              f'(avg over {n_runs} locality traces, length={trace_length}, cache={cache_size})')

    plt.xticks(all_positions, all_labels, rotation=45, ha='right')

    plt.ylim(0, 100)
    plt.grid(axis='y', linestyle='--', alpha=0.35)
    plt.legend()

    # Value labels
    for pos, rate in zip(clock_positions, clock_rates):
        plt.text(pos, rate + 1.5, f'{rate:.1f}%', ha='center', fontsize=9)
    for pos, rate in zip(baseline_positions, baseline_rates):
        plt.text(pos, rate + 1.5, f'{rate:.1f}%', ha='center', fontsize=9)

    plt.tight_layout()
    plt.show()


# ────────────────────────────────────────────────
# Run everything
# ────────────────────────────────────────────────
if __name__ == "__main__":
    # ← Tune these parameters
    N_RUNS         = 40
    TRACE_LENGTH   = 400
    CACHE_SIZE     = 10
    MAX_PAGE       = 120

    print(f"Testing CLOCK with different clock bits "
          f"({N_RUNS} traces, length={TRACE_LENGTH}, cache={CACHE_SIZE})")

    stats, tl, cs, nr, cbv = run_clock_bits_experiment(
        n_runs=N_RUNS,
        trace_length=TRACE_LENGTH,
        cache_size=CACHE_SIZE,
        max_page=MAX_PAGE,
        clock_bits_values=[1, 2, 3, 4, 8, 16]   # ← change here if needed
    )

    print("\nResults:")
    for label, data in sorted(stats.items(), key=lambda x: x[0]):
        print(f"{label:12} : {data['avg_hit_rate']:5.2f}%   (avg hits = {data['avg_hits']:.1f})")

    plot_clock_bits_results(stats, tl, cs, nr, cbv)
