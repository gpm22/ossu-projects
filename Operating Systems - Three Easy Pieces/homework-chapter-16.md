# 16 - Segmentation

## Homework (Simulation)
The `segmentation.py ` program allows you to see how address translations are performed in a system with segmentation. See the README for details.

### Questions

1. **First let’s use a tiny address space to translate some addresses. Here’s a simple set of parameters with a few different random seeds; can you translate the addresses?**

   - **`segmentation.py -a 128 -p 512 -b 0 -l 20 -B 512 -L 20 -s 0`**

     ```bash
     Segment register information:
     
       Segment 0 base  (grows positive) : 0x00000000 (decimal 0)
       Segment 0 limit                  : 20
     
       Segment 1 base  (grows negative) : 0x00000200 (decimal 512)
       Segment 1 limit                  : 20
     
     Virtual Address Trace
       VA  0: 0x0000006c (decimal:  108) --> PA or segmentation violation?
       VA  1: 0x00000061 (decimal:   97) --> PA or segmentation violation?
       VA  2: 0x00000035 (decimal:   53) --> PA or segmentation violation?
       VA  3: 0x00000021 (decimal:   33) --> PA or segmentation violation?
       VA  4: 0x00000041 (decimal:   65) --> PA or segmentation violation?
     
     ```

     - VA 0: 0x000001ec seg 1
       - (01101100)2 -> segment 1
       - 128 - 108 = 20 <= 20 -> valid
       - final is 492
     - VA 1: segmentation violation (seg 1)
       - (01100001)2 -> segment 1
     - VA 2: segmentation violation (seg 0)
       - (00110101)2 -> segment 0
     - VA 3: segmentation violation (seg 0)
       - (00100001)2 -> segment 0
     - VA 4: segmentation violation (seg 1)
       - (01000001)2 -> segment 1
   - **`segmentation.py -a 128 -p 512 -b 0 -l 20 -B 512 -L 20 -s 1`**

     ```bash
       Segment 0 base  (grows positive) : 0x00000000 (decimal 0)
       Segment 0 limit                  : 20
     
       Segment 1 base  (grows negative) : 0x00000200 (decimal 512)
       Segment 1 limit                  : 20
     
     Virtual Address Trace
       VA  0: 0x00000011 (decimal:   17) --> PA or segmentation violation?
       VA  1: 0x0000006c (decimal:  108) --> PA or segmentation violation?
       VA  2: 0x00000061 (decimal:   97) --> PA or segmentation violation?
       VA  3: 0x00000020 (decimal:   32) --> PA or segmentation violation?
       VA  4: 0x0000003f (decimal:   63) --> PA or segmentation violation?
     
     ```

     - VA 0: 0x00000011 seg 0
       - (00010001)2 -> segment 0
     - VA 1: 0x000001ec seg 1
       - (01101100)2 -> segment 1
     - VA 2: segment violation (seg 1)
       - (01100001)2 -> segment 1
     - VA 3: segment violation (seg 0)
       - (00100000)2 -> segment 0
     - VA 4: segment violation (seg 0)
       - (00111111)2 -> segment 0
   - **`segmentation.py -a 128 -p 512 -b 0 -l 20 -B 512 -L 20 -s 2`**

     ```bash
     Segment register information:
     
       Segment 0 base  (grows positive) : 0x00000000 (decimal 0)
       Segment 0 limit                  : 20
     
       Segment 1 base  (grows negative) : 0x00000200 (decimal 512)
       Segment 1 limit                  : 20
     
     Virtual Address Trace
       VA  0: 0x0000007a (decimal:  122) --> PA or segmentation violation?
       VA  1: 0x00000079 (decimal:  121) --> PA or segmentation violation?
       VA  2: 0x00000007 (decimal:    7) --> PA or segmentation violation?
       VA  3: 0x0000000a (decimal:   10) --> PA or segmentation violation?
       VA  4: 0x0000006a (decimal:  106) --> PA or segmentation violation?
     
     ```

     - VA 0: 0x000001fa seg 1
     - VA 1: 0x000001f9 seg 1
     - VA 2: 0x00000007 seg 0
     - VA 3: 0x0000000a seg 0
     - VA 4: segment violation (seg 1)

2. **Now, let’s see if we understand this tiny address space we’ve constructed (using the parameters from the question above). **
  **What is the highest legal virtual address in segment `0`?**

  `0x00000013`, as the base is `0x00000000` and the limit is 20.
  **What about the lowest legal virtual address in segment `1`?**

  `0x0000006c`, as the space address is 128 and the limit is 20.
  **What are the lowest and highest illegal addresses in this entire address space?**

  `0x00000014` and `0x0000006b`.
  **Finally, how would you run `segmentation.py` with the -A flag to test if you are right?**

  ```bash
  prompt> python3 segmentation.py -a 128 -p 512 -b 0 -l 20 -B 512 -L 20 -A 19,20,107,108 -c
  ARG seed 0
  ARG address space size 128
  ARG phys mem size 512
  
  Segment register information:
  
    Segment 0 base  (grows positive) : 0x00000000 (decimal 0)
    Segment 0 limit                  : 20
  
    Segment 1 base  (grows negative) : 0x00000200 (decimal 512)
    Segment 1 limit                  : 20
  
  Virtual Address Trace
    VA  0: 0x00000013 (decimal:   19) --> VALID in SEG0: 0x00000013 (decimal:   19)  
    VA  1: 0x00000014 (decimal:   20) --> SEGMENTATION VIOLATION (SEG0)
    VA  2: 0x0000006b (decimal:  107) --> SEGMENTATION VIOLATION (SEG1)
    VA  3: 0x0000006c (decimal:  108) --> VALID in SEG1: 0x000001ec (decimal:  492)
  
  ```

3. **Let’s say we have a tiny 16-byte address space in a 128-byte physical memory. What base and bounds would you set up so as to get the simulator to generate the following translation results for the specified address stream: valid, valid, violation, ..., violation, valid, valid? Assume the following parameters:**

   ```bash
   segmentation.py -a 16 -p 128 -A 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 --b0 ? --l0 ? --b1 ? --l1 ?
   ```

   Segment 0 has base at 0 and limit 2, while segment 1 has base at 16 and limit 2:
   ```bash
   prompt> python3 segmentation.py -a 16 -p 128 -A 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 --b0 0 --l0 2 --b1 16 --l1 2 -c
   ARG seed 0
   ARG address space size 16
   ARG phys mem size 128
   
   Segment register information:
   
     Segment 0 base  (grows positive) : 0x00000000 (decimal 0)
     Segment 0 limit                  : 2
   
     Segment 1 base  (grows negative) : 0x00000010 (decimal 16)
     Segment 1 limit                  : 2
   
   Virtual Address Trace
     VA  0: 0x00000000 (decimal:    0) --> VALID in SEG0: 0x00000000 (decimal:    0)
     VA  1: 0x00000001 (decimal:    1) --> VALID in SEG0: 0x00000001 (decimal:    1)
     VA  2: 0x00000002 (decimal:    2) --> SEGMENTATION VIOLATION (SEG0)
     VA  3: 0x00000003 (decimal:    3) --> SEGMENTATION VIOLATION (SEG0)
     VA  4: 0x00000004 (decimal:    4) --> SEGMENTATION VIOLATION (SEG0)
     VA  5: 0x00000005 (decimal:    5) --> SEGMENTATION VIOLATION (SEG0)
     VA  6: 0x00000006 (decimal:    6) --> SEGMENTATION VIOLATION (SEG0)
     VA  7: 0x00000007 (decimal:    7) --> SEGMENTATION VIOLATION (SEG0)
     VA  8: 0x00000008 (decimal:    8) --> SEGMENTATION VIOLATION (SEG1)
     VA  9: 0x00000009 (decimal:    9) --> SEGMENTATION VIOLATION (SEG1)
     VA 10: 0x0000000a (decimal:   10) --> SEGMENTATION VIOLATION (SEG1)
     VA 11: 0x0000000b (decimal:   11) --> SEGMENTATION VIOLATION (SEG1)
     VA 12: 0x0000000c (decimal:   12) --> SEGMENTATION VIOLATION (SEG1)
     VA 13: 0x0000000d (decimal:   13) --> SEGMENTATION VIOLATION (SEG1)
     VA 14: 0x0000000e (decimal:   14) --> VALID in SEG1: 0x0000000e (decimal:   14)
     VA 15: 0x0000000f (decimal:   15) --> VALID in SEG1: 0x0000000f (decimal:   15)
   ```

   

4. **Assume we want to generate a problem where roughly 90% of the randomly-generated virtual addresses are valid (not segmentation violations). How should you configure the simulator to do so? Which parameters are important to getting this outcome?**
   If we set the limits to use the whole address space, we need the address space to be 90% of the whole physical space.

   ```bash
   prompt> python3 segmentation.py -p 32 -a 29 -n 32 --b0=0 --l0=14 --b1=29 --l1=14 -c -s 1
   ARG seed 1
   ARG address space size 29
   ARG phys mem size 32
   
   Segment register information:
   
     Segment 0 base  (grows positive) : 0x00000000 (decimal 0)
     Segment 0 limit                  : 14
   
     Segment 1 base  (grows negative) : 0x0000001d (decimal 29)
     Segment 1 limit                  : 14
   
   Virtual Address Trace
     VA  0: 0x00000003 (decimal:    3) --> VALID in SEG0: 0x00000003 (decimal:    3)
     VA  1: 0x00000018 (decimal:   24) --> VALID in SEG1: 0x00000018 (decimal:   24)
     VA  2: 0x00000016 (decimal:   22) --> VALID in SEG1: 0x00000016 (decimal:   22)
     VA  3: 0x00000007 (decimal:    7) --> VALID in SEG0: 0x00000007 (decimal:    7)
     VA  4: 0x0000000e (decimal:   14) --> SEGMENTATION VIOLATION (SEG1)
     VA  5: 0x0000000d (decimal:   13) --> VALID in SEG0: 0x0000000d (decimal:   13)
     VA  6: 0x00000012 (decimal:   18) --> VALID in SEG1: 0x00000012 (decimal:   18)
     VA  7: 0x00000016 (decimal:   22) --> VALID in SEG1: 0x00000016 (decimal:   22)
     VA  8: 0x00000002 (decimal:    2) --> VALID in SEG0: 0x00000002 (decimal:    2)
     VA  9: 0x00000000 (decimal:    0) --> VALID in SEG0: 0x00000000 (decimal:    0)
     VA 10: 0x00000018 (decimal:   24) --> VALID in SEG1: 0x00000018 (decimal:   24)
     VA 11: 0x0000000c (decimal:   12) --> VALID in SEG0: 0x0000000c (decimal:   12)
     VA 12: 0x00000016 (decimal:   22) --> VALID in SEG1: 0x00000016 (decimal:   22)
     VA 13: 0x00000000 (decimal:    0) --> VALID in SEG0: 0x00000000 (decimal:    0)
     VA 14: 0x0000000c (decimal:   12) --> VALID in SEG0: 0x0000000c (decimal:   12)
     VA 15: 0x00000014 (decimal:   20) --> VALID in SEG1: 0x00000014 (decimal:   20)
     VA 16: 0x00000006 (decimal:    6) --> VALID in SEG0: 0x00000006 (decimal:    6)
     VA 17: 0x0000001b (decimal:   27) --> VALID in SEG1: 0x0000001b (decimal:   27)
     VA 18: 0x0000001a (decimal:   26) --> VALID in SEG1: 0x0000001a (decimal:   26)
     VA 19: 0x00000000 (decimal:    0) --> VALID in SEG0: 0x00000000 (decimal:    0)
     VA 20: 0x00000000 (decimal:    0) --> VALID in SEG0: 0x00000000 (decimal:    0)
     VA 21: 0x0000000f (decimal:   15) --> VALID in SEG1: 0x0000000f (decimal:   15)
     VA 22: 0x0000001b (decimal:   27) --> VALID in SEG1: 0x0000001b (decimal:   27)
     VA 23: 0x0000000b (decimal:   11) --> VALID in SEG0: 0x0000000b (decimal:   11)
     VA 24: 0x00000006 (decimal:    6) --> VALID in SEG0: 0x00000006 (decimal:    6)
     VA 25: 0x0000000c (decimal:   12) --> VALID in SEG0: 0x0000000c (decimal:   12)
     VA 26: 0x00000000 (decimal:    0) --> VALID in SEG0: 0x00000000 (decimal:    0)
     VA 27: 0x00000006 (decimal:    6) --> VALID in SEG0: 0x00000006 (decimal:    6)
     VA 28: 0x0000000c (decimal:   12) --> VALID in SEG0: 0x0000000c (decimal:   12)
     VA 29: 0x0000000e (decimal:   14) --> SEGMENTATION VIOLATION (SEG1)
     VA 30: 0x00000006 (decimal:    6) --> VALID in SEG0: 0x00000006 (decimal:    6)
     VA 31: 0x00000006 (decimal:    6) --> VALID in SEG0: 0x00000006 (decimal:    6)
   
   ```

   We can also set the address space to be 100%-1 byte of the physical space and set the limits to be 45% each of the whole space.

   ```bash
   prompt> python3 segmentation.py -p 32 -a 31 -n 32 --b0=0 --l0=14 --b1=31 --l1=14 -c -s 1
   ARG seed 1
   ARG address space size 31
   ARG phys mem size 32
   
   Segment register information:
   
     Segment 0 base  (grows positive) : 0x00000000 (decimal 0)
     Segment 0 limit                  : 14
   
     Segment 1 base  (grows negative) : 0x0000001f (decimal 31)
     Segment 1 limit                  : 14
   
   Virtual Address Trace
     VA  0: 0x00000004 (decimal:    4) --> VALID in SEG0: 0x00000004 (decimal:    4)
     VA  1: 0x0000001a (decimal:   26) --> VALID in SEG1: 0x0000001a (decimal:   26)
     VA  2: 0x00000017 (decimal:   23) --> VALID in SEG1: 0x00000017 (decimal:   23)
     VA  3: 0x00000007 (decimal:    7) --> VALID in SEG0: 0x00000007 (decimal:    7)
     VA  4: 0x0000000f (decimal:   15) --> SEGMENTATION VIOLATION (SEG1)
     VA  5: 0x0000000d (decimal:   13) --> VALID in SEG0: 0x0000000d (decimal:   13)
     VA  6: 0x00000014 (decimal:   20) --> VALID in SEG1: 0x00000014 (decimal:   20)
     VA  7: 0x00000018 (decimal:   24) --> VALID in SEG1: 0x00000018 (decimal:   24)
     VA  8: 0x00000002 (decimal:    2) --> VALID in SEG0: 0x00000002 (decimal:    2)
     VA  9: 0x00000000 (decimal:    0) --> VALID in SEG0: 0x00000000 (decimal:    0)
     VA 10: 0x00000019 (decimal:   25) --> VALID in SEG1: 0x00000019 (decimal:   25)
     VA 11: 0x0000000d (decimal:   13) --> VALID in SEG0: 0x0000000d (decimal:   13)
     VA 12: 0x00000017 (decimal:   23) --> VALID in SEG1: 0x00000017 (decimal:   23)
     VA 13: 0x00000000 (decimal:    0) --> VALID in SEG0: 0x00000000 (decimal:    0)
     VA 14: 0x0000000d (decimal:   13) --> VALID in SEG0: 0x0000000d (decimal:   13)
     VA 15: 0x00000016 (decimal:   22) --> VALID in SEG1: 0x00000016 (decimal:   22)
     VA 16: 0x00000007 (decimal:    7) --> VALID in SEG0: 0x00000007 (decimal:    7)
     VA 17: 0x0000001d (decimal:   29) --> VALID in SEG1: 0x0000001d (decimal:   29)
     VA 18: 0x0000001b (decimal:   27) --> VALID in SEG1: 0x0000001b (decimal:   27)
     VA 19: 0x00000000 (decimal:    0) --> VALID in SEG0: 0x00000000 (decimal:    0)
     VA 20: 0x00000000 (decimal:    0) --> VALID in SEG0: 0x00000000 (decimal:    0)
     VA 21: 0x00000010 (decimal:   16) --> SEGMENTATION VIOLATION (SEG1)
     VA 22: 0x0000001d (decimal:   29) --> VALID in SEG1: 0x0000001d (decimal:   29)
     VA 23: 0x0000000b (decimal:   11) --> VALID in SEG0: 0x0000000b (decimal:   11)
     VA 24: 0x00000006 (decimal:    6) --> VALID in SEG0: 0x00000006 (decimal:    6)
     VA 25: 0x0000000d (decimal:   13) --> VALID in SEG0: 0x0000000d (decimal:   13)
     VA 26: 0x00000000 (decimal:    0) --> VALID in SEG0: 0x00000000 (decimal:    0)
     VA 27: 0x00000006 (decimal:    6) --> VALID in SEG0: 0x00000006 (decimal:    6)
     VA 28: 0x0000000d (decimal:   13) --> VALID in SEG0: 0x0000000d (decimal:   13)
     VA 29: 0x0000000f (decimal:   15) --> SEGMENTATION VIOLATION (SEG1)
     VA 30: 0x00000007 (decimal:    7) --> VALID in SEG0: 0x00000007 (decimal:    7)
     VA 31: 0x00000007 (decimal:    7) --> VALID in SEG0: 0x00000007 (decimal:    7)
   ```

   So what matter the most are the limits and the address sapce size.

5. **Can you run the simulator such that no virtual addresses are valid? How?**
   Setting the limits to 0.

   ```bash
   prompt> python3 segmentation.py -p 16 -a 15 --b0=0 --l0=0 --b1=15 --l1=0 -c -A 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14
   ARG seed 0
   ARG address space size 15
   ARG phys mem size 16
   
   Segment register information:
   
     Segment 0 base  (grows positive) : 0x00000000 (decimal 0)
     Segment 0 limit                  : 0
   
     Segment 1 base  (grows negative) : 0x0000000f (decimal 15)
     Segment 1 limit                  : 0
   
   Virtual Address Trace
     VA  0: 0x00000000 (decimal:    0) --> SEGMENTATION VIOLATION (SEG0)
     VA  1: 0x00000001 (decimal:    1) --> SEGMENTATION VIOLATION (SEG0)
     VA  2: 0x00000002 (decimal:    2) --> SEGMENTATION VIOLATION (SEG0)
     VA  3: 0x00000003 (decimal:    3) --> SEGMENTATION VIOLATION (SEG0)
     VA  4: 0x00000004 (decimal:    4) --> SEGMENTATION VIOLATION (SEG0)
     VA  5: 0x00000005 (decimal:    5) --> SEGMENTATION VIOLATION (SEG0)
     VA  6: 0x00000006 (decimal:    6) --> SEGMENTATION VIOLATION (SEG0)
     VA  7: 0x00000007 (decimal:    7) --> SEGMENTATION VIOLATION (SEG1)
     VA  8: 0x00000008 (decimal:    8) --> SEGMENTATION VIOLATION (SEG1)
     VA  9: 0x00000009 (decimal:    9) --> SEGMENTATION VIOLATION (SEG1)
     VA 10: 0x0000000a (decimal:   10) --> SEGMENTATION VIOLATION (SEG1)
     VA 11: 0x0000000b (decimal:   11) --> SEGMENTATION VIOLATION (SEG1)
     VA 12: 0x0000000c (decimal:   12) --> SEGMENTATION VIOLATION (SEG1)
     VA 13: 0x0000000d (decimal:   13) --> SEGMENTATION VIOLATION (SEG1)
     VA 14: 0x0000000e (decimal:   14) --> SEGMENTATION VIOLATION (SEG1)
   ```

   

