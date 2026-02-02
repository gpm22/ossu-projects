import random
import re

def generate_random_trace(length=30, max_page=9, seed=None):
    if seed is not None:
        random.seed(seed)
    return [random.randint(0, max_page) for _ in range(length)]

def generate_locality_trace(length=400, seed=None):
    if seed is not None:
        random.seed(seed)
    trace = []
    for _ in range(25):
        trace.extend(list(range(9)) + [random.randint(100, 115)])
    ws = list(range(50, 100))
    for _ in range(60):
        trace.append(random.choice(ws))
        if random.random() < 0.2:
            trace.append(random.randint(20, 35))
    trace.extend([4, 5, 6] * 15 + [random.randint(0, 40) for _ in range(20)])
    trace.extend([1, 2, 1, 3, 1, 2] * 20)
    return trace[:length]

def trace_to_arg_string(trace):
    return ",".join(map(str, trace))

# ────────────────────────────────────────────────
# Common utility: run paging-policy.py and extract hits
# ────────────────────────────────────────────────
import subprocess
import matplotlib.pyplot as plt  # may be unused in this file, but imported in others
from statistics import mean, stdev

def run_paging_policy(trace, policy, cache_size=5, maxpage=50, notrace=True, clockbits=None):
    """
    Calls: python3 paging-policy.py -a <trace> -p <policy> -C <cache_size> ...
    Returns number of hits (from FINALSTATS line)
    """
    trace_str = trace_to_arg_string(trace)
    notrace_flag = "-c" if notrace else ""

    cmd = [
        "python3", "paging-policy.py",
        "-a", trace_str,
        "-p", policy,
        "-C", str(cache_size),
        "--maxpage", str(maxpage),
        notrace_flag
    ]
    if clockbits is not None and policy.upper() == "CLOCK":
        cmd.extend(["--clockbits", str(clockbits)])

    try:
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        output = result.stdout
        import re
        # More robust regex: allow any whitespace and tolerate extra spaces
        match = re.search(r"FINALSTATS\s+hits\s+(\d+)\s+misses\s+(\d+)\s+hitrate\s+([0-9.]+)", output, re.IGNORECASE)
        if match:
            return int(match.group(1))
        else:
            # Try a fallback: print the output for debugging
            print(f"[WARN] Could not parse hits for {policy} (clockbits={clockbits})")
            print(output[:300])
            return 0
    except subprocess.CalledProcessError as e:
        print(f"Error running paging-policy.py for {policy}:")
        print(e.stderr[:400])
        return 0
    except FileNotFoundError:
        print("paging-policy.py not found in current directory.")
        return 0
