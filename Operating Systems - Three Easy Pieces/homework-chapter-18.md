# 18 - Paging: Introduction

## Homework (Simulation)

In this homework, you will use a simple program, which is known as `paging-linear-translate.py`, to see if you understand how simple virtual-to-physical address translation works with linear page tables. See the `README` for details.

### Questions

1. **Before doing any translations, let’s use the simulator to study how linear page tables change size given different parameters. Compute the size of linear page tables as different parameters change. Some suggested inputs are below; by using the `-v` flag, you can see how many page-table entries are filled. First, to understand how linear page table size changes as the address space grows, run with these flags:**

  ```bash
  -P 1k -a 1m -p 512m -v -n 0
  -P 1k -a 2m -p 512m -v -n 0
  -P 1k -a 4m -p 512m -v -n 0
  ```

  **Then, to understand how linear page table size changes as page size grows:**

  ```bash
  -P 1k -a 1m -p 512m -v -n 0
  -P 2k -a 1m -p 512m -v -n 0
  -P 4k -a 1m -p 512m -v -n 0
  ```

  **Before running any of these, try to think about the expected trends.**
  **How should page-table size change as the address space grows?**

  `-P 1k -a 1m -p 512m -v -n 0` returns a 1024 size page table.

  `-P 1k -a 2m -p 512m -v -n 0` returns a 2048 size page table.

  `-P 1k -a 4m -p 512m -v -n 0` returns a 4096 size page table.

  So we can see that the page-table is linearly proportional to the address space size.
  **As the page size grows?**

  `-P 1k -a 1m -p 512m -v -n 0` returns a 1024 size page table.

  `-P 2k -a 1m -p 512m -v -n 0` returns a 512 size page table.

  `-P 4k -a 1m -p 512m -v -n 0` returns a 256 size page table.
  So we can see that the page-table size is inversely proportional to the page size.
  Thus the page-table size is
  $$
  \text{page-table size} = \frac {\text{address space size}} {\text{page size}}
  $$
  **Why not use big pages in general?**

  Internal fragmentation and less memory available.
2. **Now let’s do some translations. Start with some small examples, and change the number of pages that are allocated to the address space with the -u flag. For example:**

  ```bash
  -P 1k -a 16k -p 32k -v -u 0
  -P 1k -a 16k -p 32k -v -u 25
  -P 1k -a 16k -p 32k -v -u 50
  -P 1k -a 16k -p 32k -v -u 75
  -P 1k -a 16k -p 32k -v -u 100
  ```

  The offset is $\log_2(1024) = 10$

  #### `-P 1k -a 16k -p 32k -v -u 0`

  ```bash
  Page Table (from entry 0 down to the max size)
    [       0]  0x00000000
    [       1]  0x00000000
    [       2]  0x00000000
    [       3]  0x00000000
    [       4]  0x00000000
    [       5]  0x00000000
    [       6]  0x00000000
    [       7]  0x00000000
    [       8]  0x00000000
    [       9]  0x00000000
    [      10]  0x00000000
    [      11]  0x00000000
    [      12]  0x00000000
    [      13]  0x00000000
    [      14]  0x00000000
    [      15]  0x00000000
  
  Virtual Address Trace
    VA 0x00003a39 (decimal:    14905) --> invalid address
    VA 0x00003ee5 (decimal:    16101) --> invalid address
    VA 0x000033da (decimal:    13274) --> invalid address
    VA 0x000039bd (decimal:    14781) --> invalid address
    VA 0x000013d9 (decimal:     5081) --> invalid address
  ```

  All invalid.

  #### `-P 1k -a 16k -p 32k -v -u 25`

  ```bash
  Page Table (from entry 0 down to the max size)
    [       0]  0x80000018 # maps to 0x18
    [       1]  0x00000000
    [       2]  0x00000000
    [       3]  0x00000000
    [       4]  0x00000000
    [       5]  0x80000009 # maps to 0x9
    [       6]  0x00000000
    [       7]  0x00000000
    [       8]  0x80000010 # maps to 0x10
    [       9]  0x00000000
    [      10]  0x80000013 # maps to 0x13
    [      11]  0x00000000
    [      12]  0x8000001f # maps to 0x1f
    [      13]  0x8000001c # maps to 0x1c
    [      14]  0x00000000
    [      15]  0x00000000
  
  Virtual Address Trace
    VA 0x00003986 (decimal:    14726) --> PA or invalid address?
        1110 0110000110 -> page 14, thus invalid
    VA 0x00002bc6 (decimal:    11206) --> PA or invalid address?
        1010 1111000110 -> page 10, thus 100111111000110 -> 4fC6
    VA 0x00001e37 (decimal:     7735) --> PA or invalid address?
        0111 1000110111 -> page 07, thus invalid
    VA 0x00000671 (decimal:     1649) --> PA or invalid address?
        0001 1001110001 -> page 01, thus invalid
    VA 0x00001bc9 (decimal:     7113) --> PA or invalid address?
        0110 1111001001 -> page 06, thus invalid
  ```

  1 valid

  #### `-P 1k -a 16k -p 32k -v -u 50`

  ```bash
  Page Table (from entry 0 down to the max size)
    [       0]  0x80000018
    [       1]  0x00000000
    [       2]  0x00000000
    [       3]  0x8000000c
    [       4]  0x80000009
    [       5]  0x00000000
    [       6]  0x8000001d
    [       7]  0x80000013
    [       8]  0x00000000
    [       9]  0x8000001f
    [      10]  0x8000001c
    [      11]  0x00000000
    [      12]  0x8000000f
    [      13]  0x00000000
    [      14]  0x00000000
    [      15]  0x80000008
  
  Virtual Address Trace
    VA 0x00003385 (decimal:    13189) --> PA or invalid address?
        1100 1110000101 -> page 12 -> 11111110000101 -> 3f85
    VA 0x0000231d (decimal:     8989) --> PA or invalid address?
        1000 1100011101 -> page 8 -> invalid
    VA 0x000000e6 (decimal:      230) --> PA or invalid address?
        0000 0011100110 -> page 0 -> 110000011100110 -> 60e6
    VA 0x00002e0f (decimal:    11791) --> PA or invalid address?
        1011 1000001111 -> page 11 -> invalid
    VA 0x00001986 (decimal:     6534) --> PA or invalid address?
        0110 0110000110 -> page 6 -> 111010110000110 -> 7586
  ```

  3 valid

  #### `-P 1k -a 16k -p 32k -v -u 75`

  ```bash
  Page Table (from entry 0 down to the max size)
    [       0]  0x80000018
    [       1]  0x80000008
    [       2]  0x8000000c
    [       3]  0x80000009
    [       4]  0x80000012
    [       5]  0x80000010
    [       6]  0x8000001f
    [       7]  0x8000001c
    [       8]  0x80000017
    [       9]  0x80000015
    [      10]  0x80000003
    [      11]  0x80000013
    [      12]  0x8000001e
    [      13]  0x8000001b
    [      14]  0x80000019
    [      15]  0x80000000
  
  Virtual Address Trace
    VA 0x00002e0f (decimal:    11791) --> PA or invalid address?
        1011 1000001111 -> page 11 -> 100111000001111 -> 40EF
    VA 0x00001986 (decimal:     6534) --> PA or invalid address?
        0110 0110000110 -> page 06 -> 111110110000110 -> 7D86
    VA 0x000034ca (decimal:    13514) --> PA or invalid address?
        1101 0011001010 -> page 13 -> 110110011001010 -> 6cca
    VA 0x00002ac3 (decimal:    10947) --> PA or invalid address?
        1010 1011000011 -> page 10 -> 000111011000011 -> 0ec3
    VA 0x00000012 (decimal:       18) --> PA or invalid address?
        0000 0000010010 -> page 00 -> 110000000010010 -> 6012
  ```

  all valid

  #### `-P 1k -a 16k -p 32k -v -u 100`

  ```bash
  Page Table (from entry 0 down to the max size)
    [       0]  0x80000018
    [       1]  0x80000008
    [       2]  0x8000000c
    [       3]  0x80000009
    [       4]  0x80000012
    [       5]  0x80000010
    [       6]  0x8000001f
    [       7]  0x8000001c
    [       8]  0x80000017
    [       9]  0x80000015
    [      10]  0x80000003
    [      11]  0x80000013
    [      12]  0x8000001e
    [      13]  0x8000001b
    [      14]  0x80000019
    [      15]  0x80000000
  
  Virtual Address Trace
    VA 0x00002e0f (decimal:    11791) --> 00004e0f (decimal    19983) [VPN 11]
    VA 0x00001986 (decimal:     6534) --> 00007d86 (decimal    32134) [VPN 6]
    VA 0x000034ca (decimal:    13514) --> 00006cca (decimal    27850) [VPN 13]
    VA 0x00002ac3 (decimal:    10947) --> 00000ec3 (decimal     3779) [VPN 10]
    VA 0x00000012 (decimal:       18) --> 00006012 (decimal    24594) [VPN 0]
  
  ```

  All valid

  **What happens as you increase the percentage of pages that are allocated in each address space?**

  The percentage of random virtual address trace increases.
3. **Now let’s try some different random seeds, and some different (and sometimes quite crazy) address-space parameters, for variety:**

  ```bash
  -P 8 -a 32 -p 1024 -v -s 1 # table of size 4, virtual address of 5 bits, offset of 3
  -P 8k -a 32k -p 1m -v -s 2 # table of size 4, virtual address of 15 bits, offset of 13
  -P 1m -a 256m -p 512m -v -s 3 # table of size 256, virtual address of 28 bits, offset of 20
  ```

  **Which of these parameter combinations are unrealistic? Why?**

  The first, because it is too small, and the second, because its page size is too big for its address space.

4. **Use the program to try out some other problems. Can you find the limits of where the program doesn’t work anymore? For example, what happens if the address-space size is bigger than physical memory**

  Does not work when:

  - Address space larger than physical memory
  - Page size larger than Address Space.
