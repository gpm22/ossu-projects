# `relocation.py`

This program, `relocation.py`, allows you to see how address translations are performed in a system with base and bounds registers.

## Address Space Layout

In this homework, the address space is organized as follows:

```
  -------------- 0KB
  |    Code    |
  -------------- 2KB
  |   Stack    |
  -------------- 4KB
  |    Heap    |
  |     |      |
  |     v      |
  -------------- 7KB
  |   (free)   |
  |     ...    |
```

The bounds register is set to 7KB, representing the end of the address space. Any reference within the bounds is legal; references above this value cause a segmentation violation.

## How to Use

There are two steps to running the program:

1. **Run without the `-c` flag**: This generates a set of virtual addresses for you to translate manually.
2. **Run with the `-c` flag**: This shows the correct translations so you can check your answers.

### Example: Generating a Problem

```bash
prompt> python3 ./relocation.py
...
Base-and-Bounds register information:

  Base   : 0x00003082 (decimal 12418)
  Limit  : 472

Virtual Address Trace
  VA  0: 0x01ae (decimal:430) -> PA or violation?
  VA  1: 0x0109 (decimal:265) -> PA or violation?
  VA  2: 0x020b (decimal:523) -> PA or violation?
  VA  3: 0x019e (decimal:414) -> PA or violation?
  VA  4: 0x0322 (decimal:802) -> PA or violation?
```

For each virtual address, determine if it is in bounds (less than the limit). If so, add it to the base to get the physical address. If not, it is a segmentation violation.

### Example: Checking Your Answers

```bash
prompt> python3 ./relocation.py -c
...
Virtual Address Trace
  VA  0: 0x01ae (decimal:430) -> VALID: 0x00003230 (dec:12848)
  VA  1: 0x0109 (decimal:265) -> VALID: 0x0000318b (dec:12683)
  VA  2: 0x020b (decimal:523) -> SEGMENTATION VIOLATION
  VA  3: 0x019e (decimal:414) -> VALID: 0x00003220 (dec:12832)
  VA  4: 0x0322 (decimal:802) -> SEGMENTATION VIOLATION
```

For example, with a base address of 12418 and a limit of 472, address 430 is valid and translates to 12418 + 430 = 12848. Addresses above the limit (e.g., 523, 802) are segmentation violations.

## Command-Line Options

You can control the simulation with the following flags:

```bash
prompt> python3 ./relocation.py -h
Usage: relocation.py [options]

Options:
  -h, --help            show this help message and exit
  -s SEED, --seed=SEED  the random seed
  -a ASIZE, --asize=ASIZE address space size (e.g., 16, 64k, 32m)
  -p PSIZE, --physmem=PSIZE physical memory size (e.g., 16, 64k)
  -n NUM, --addresses=NUM # of virtual addresses to generate
  -b BASE, --b=BASE     value of base register
  -l LIMIT, --l=LIMIT   value of limit register
  -c, --compute         compute answers for me
```

- `-a`: Set the virtual address-space size
- `-p`: Set the physical memory size
- `-n`: Set the number of virtual addresses to generate
- `-b`: Set the base register value
- `-l`: Set the limit register value
- `-c`: Compute and display the answers

Use these options to generate different problems and test your understanding of base and bounds address translation.