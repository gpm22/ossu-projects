# 26 - Concurrency: An Introduction

## Homework (Simulation)

This program, [x86.py](./simulation-files/HW-ThreadsIntro/x86.py), allows you to see how different thread inter-leavings either cause or avoid race conditions. See the [`README`](./simulation-files/HW-ThreadsIntro/README.md) for details on how the program works, then answer the questions below.

### Questions

1. **Let’s examine a simple program, “[`loop.s`](./simulation-files/HW-ThreadsIntro/loop.s)”. First, just read and understand it. Then, run it with these arguments (`./x86.py -t 1 -p loop.s -i 100 -R dx`) This specifies a single thread, an interrupt every 100 instructions, and tracing of register `%dx`. What will `%dx` be during the run? Use the `-c` flag to check your answers; the answers, on the left, show the value of the register (or memory value) after the instruction on the right has run.**

   The program is small:

   ```assembly
   .main
   .top
   sub  $1,%dx
   test $0,%dx     
   jgte .top         
   halt
   ```

   It keeps subtracting 1 from register `%dx` until it is less than 0.

   Result of running `./x86.py -t 1 -p loop.s -i 100 -R dx`

   ```bash
      dx          Thread 0         
       ?   
       ?   1000 sub  $1,%dx
       ?   1001 test $0,%dx
       ?   1002 jgte .top
       ?   1003 halt
   ```

   As `%dx` is not initialized, its default value is 0, thus the runs only once. Therefore the values will be:

   ```bash
      dx          Thread 0         
        0   
       -1   1000 sub  $1,%dx
       -1   1001 test $0,%dx
       -1   1002 jgte .top
       -1   1003 halt
   ```

   Now we validate running the previous command with `-c`:

   ```bash
      dx          Thread 0         
       0   
      -1   1000 sub  $1,%dx
      -1   1001 test $0,%dx
      -1   1002 jgte .top
      -1   1003 halt
   ```

   

2. **Same code, different flags: (`./x86.py -p loop.s -t 2 -i 100 -a dx=3,dx=3 -R dx`) This specifies two threads, and initializes each `%dx` to 3. What values will `%dx` see? Run with -c to check. Does the presence of multiple threads affect your calculations? Is there a race in this code?**

   Result of running `./x86.py -p loop.s -t 2 -i 100 -a dx=3,dx=3 -R dx`:

   ```bash
      dx          Thread 0                Thread 1         
       ?   
       ?   1000 sub  $1,%dx
       ?   1001 test $0,%dx
       ?   1002 jgte .top
       ?   1000 sub  $1,%dx
       ?   1001 test $0,%dx
       ?   1002 jgte .top
       ?   1000 sub  $1,%dx
       ?   1001 test $0,%dx
       ?   1002 jgte .top
       ?   1000 sub  $1,%dx
       ?   1001 test $0,%dx
       ?   1002 jgte .top
       ?   1003 halt
       ?   ----- Halt;Switch -----  ----- Halt;Switch -----  
       ?                            1000 sub  $1,%dx
       ?                            1001 test $0,%dx
       ?                            1002 jgte .top
       ?                            1000 sub  $1,%dx
       ?                            1001 test $0,%dx
       ?                            1002 jgte .top
       ?                            1000 sub  $1,%dx
       ?                            1001 test $0,%dx
       ?                            1002 jgte .top
       ?                            1000 sub  $1,%dx
       ?                            1001 test $0,%dx
       ?                            1002 jgte .top
       ?                            1003 halt
   ```

   We can see that thread 0 runs all before thread 1 and that thread 1 run the full loop too. So we can see that even though they are using the same register, at the start of thread 1, the register is correctly set to 3 again. So the values of the register `%dx` will be:
   ```bash
      dx          Thread 0                Thread 1         
        3   
        2   1000 sub  $1,%dx
        2   1001 test $0,%dx
        2   1002 jgte .top
        1   1000 sub  $1,%dx
        1   1001 test $0,%dx
        1   1002 jgte .top
        0   1000 sub  $1,%dx
        0   1001 test $0,%dx
        0   1002 jgte .top
       -1   1000 sub  $1,%dx
       -1   1001 test $0,%dx
       -1   1002 jgte .top
       -1   1003 halt
        3   ----- Halt;Switch -----  ----- Halt;Switch -----  
        2                            1000 sub  $1,%dx
        2                            1001 test $0,%dx
        2                            1002 jgte .top
        1                            1000 sub  $1,%dx
        1                            1001 test $0,%dx
        1                            1002 jgte .top
        0                            1000 sub  $1,%dx
        0                            1001 test $0,%dx
        0                            1002 jgte .top
       -1                            1000 sub  $1,%dx
       -1                            1001 test $0,%dx
       -1                            1002 jgte .top
       -1                            1003 halt
   ```

   then we validate by running it with `-c`:

   ```bash
      dx          Thread 0                Thread 1         
       3   
       2   1000 sub  $1,%dx
       2   1001 test $0,%dx
       2   1002 jgte .top
       1   1000 sub  $1,%dx
       1   1001 test $0,%dx
       1   1002 jgte .top
       0   1000 sub  $1,%dx
       0   1001 test $0,%dx
       0   1002 jgte .top
      -1   1000 sub  $1,%dx
      -1   1001 test $0,%dx
      -1   1002 jgte .top
      -1   1003 halt
       3   ----- Halt;Switch -----  ----- Halt;Switch -----  
       2                            1000 sub  $1,%dx
       2                            1001 test $0,%dx
       2                            1002 jgte .top
       1                            1000 sub  $1,%dx
       1                            1001 test $0,%dx
       1                            1002 jgte .top
       0                            1000 sub  $1,%dx
       0                            1001 test $0,%dx
       0                            1002 jgte .top
      -1                            1000 sub  $1,%dx
      -1                            1001 test $0,%dx
      -1                            1002 jgte .top
      -1                            1003 halt
   ```

   So the presence of multiple threads did not affected the calculations, as it thread ran separately. Thus we did not see any race conditions in this code for the current configuration. Even though we have a critical section when modifying the same register, the interval is too big to affect the code. 

3. **Run this: `./x86.py -p loop.s -t 2 -i 3 -r -R dx -a dx=3,dx=3` This makes the interrupt interval small/random; use different seeds (`-s`) to see different inter-leavings. Does the interrupt frequency change anything?**

   Result for `./x86.py -p loop.s -t 2 -i 3 -r -R dx -a dx=3,dx=3`:

   ```bash
      dx          Thread 0                Thread 1         
       ?   
       ?   1000 sub  $1,%dx
       ?   1001 test $0,%dx
       ?   1002 jgte .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1000 sub  $1,%dx
       ?                            1001 test $0,%dx
       ?                            1002 jgte .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1000 sub  $1,%dx
       ?   1001 test $0,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1000 sub  $1,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1002 jgte .top
       ?   1000 sub  $1,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1001 test $0,%dx
       ?                            1002 jgte .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1001 test $0,%dx
       ?   1002 jgte .top
       ?   1000 sub  $1,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1000 sub  $1,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1001 test $0,%dx
       ?   1002 jgte .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1001 test $0,%dx
       ?                            1002 jgte .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1003 halt
       ?   ----- Halt;Switch -----  ----- Halt;Switch -----  
       ?                            1000 sub  $1,%dx
       ?                            1001 test $0,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1002 jgte .top
       ?                            1003 halt
   ```

   Result for `./x86.py -p loop.s -t 2 -i 3 -r -R dx -a dx=3,dx=3 -s 2`:

   ```bash
      dx          Thread 0                Thread 1         
       ?   
       ?   1000 sub  $1,%dx
       ?   1001 test $0,%dx
       ?   1002 jgte .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1000 sub  $1,%dx
       ?                            1001 test $0,%dx
       ?                            1002 jgte .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1000 sub  $1,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1000 sub  $1,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1001 test $0,%dx
       ?   1002 jgte .top
       ?   1000 sub  $1,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1001 test $0,%dx
       ?                            1002 jgte .top
       ?                            1000 sub  $1,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1001 test $0,%dx
       ?   1002 jgte .top
       ?   1000 sub  $1,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1001 test $0,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1001 test $0,%dx
       ?   1002 jgte .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1002 jgte .top
       ?                            1000 sub  $1,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1003 halt
       ?   ----- Halt;Switch -----  ----- Halt;Switch -----  
       ?                            1001 test $0,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1002 jgte .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1003 halt
   ```

   Result for `./x86.py -p loop.s -t 2 -i 3 -r -R dx -a dx=3,dx=3 -s 10`:

   ```bash
    dx          Thread 0                Thread 1         
       ?   
       ?   1000 sub  $1,%dx
       ?   1001 test $0,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1000 sub  $1,%dx
       ?                            1001 test $0,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1002 jgte .top
       ?   1000 sub  $1,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1002 jgte .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1001 test $0,%dx
       ?   1002 jgte .top
       ?   1000 sub  $1,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1000 sub  $1,%dx
       ?                            1001 test $0,%dx
       ?                            1002 jgte .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1001 test $0,%dx
       ?   1002 jgte .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1000 sub  $1,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1000 sub  $1,%dx
       ?   1001 test $0,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1001 test $0,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1002 jgte .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1002 jgte .top
       ?                            1000 sub  $1,%dx
       ?                            1001 test $0,%dx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1003 halt
       ?   ----- Halt;Switch -----  ----- Halt;Switch -----  
       ?                            1002 jgte .top
       ?                            1003 halt
   ```

   Now that they are intervening, the value of the register will be constantly be overwritten. We can notice that we have less than 8 total sub calls, which is the "correct" case.
   So now the interval is small enough to case a race condition.

4. **Now, a different program, [`looping-race-nolock.s`](./simulation-files/HW-ThreadsIntro/looping-race-nolock.s), which accesses a shared variable located at address 2000; we’ll call this variable `value`. Run it with a single thread to confirm your understanding: `./x86.py -p looping-race-nolock.s -t 1 -M 2000` What is value (i.e., at memory address 2000) throughout the run? Use `-c` to check.**

   The program increments ` value` in 1 by moving it to a register, updating the register, then moving it back to 2000.

    Result of running `./x86.py -p looping-race-nolock.s -t 1 -M 2000`

   ```bash
    2000          Thread 0         
       ?   
       ?   1000 mov 2000, %ax
       ?   1001 add $1, %ax
       ?   1002 mov %ax, 2000
       ?   1003 sub  $1, %bx
       ?   1004 test $0, %bx
       ?   1005 jgt .top
       ?   1006 halt
   ```

   as we do not set 2000 to any value, it starts with 0, thus the values are:

   ```bash
    2000          Thread 0         
       0   
       0   1000 mov 2000, %ax
       0   1001 add $1, %ax
       1   1002 mov %ax, 2000
       1   1003 sub  $1, %bx
       1   1004 test $0, %bx
       1   1005 jgt .top
       1   1006 halt
   ```

   We validate it running with `-c`:

   ```bash
    2000          Thread 0         
       0   
       0   1000 mov 2000, %ax
       0   1001 add $1, %ax
       1   1002 mov %ax, 2000
       1   1003 sub  $1, %bx
       1   1004 test $0, %bx
       1   1005 jgt .top
       1   1006 halt
   ```

   

5. **Run with multiple iterations/threads: `./x86.py -p looping-race-nolock.s -t 2 -a bx=3 -M 2000` Why does each thread loop three times? What is final value of value?**

   Result of `./x86.py -p looping-race-nolock.s -t 2 -a bx=3 -M 2000`:

   ```bash
   2000          Thread 0                Thread 1         
       ?   
       ?   1000 mov 2000, %ax
       ?   1001 add $1, %ax
       ?   1002 mov %ax, 2000
       ?   1003 sub  $1, %bx
       ?   1004 test $0, %bx
       ?   1005 jgt .top
       ?   1000 mov 2000, %ax
       ?   1001 add $1, %ax
       ?   1002 mov %ax, 2000
       ?   1003 sub  $1, %bx
       ?   1004 test $0, %bx
       ?   1005 jgt .top
       ?   1000 mov 2000, %ax
       ?   1001 add $1, %ax
       ?   1002 mov %ax, 2000
       ?   1003 sub  $1, %bx
       ?   1004 test $0, %bx
       ?   1005 jgt .top
       ?   1006 halt
       ?   ----- Halt;Switch -----  ----- Halt;Switch -----  
       ?                            1000 mov 2000, %ax
       ?                            1001 add $1, %ax
       ?                            1002 mov %ax, 2000
       ?                            1003 sub  $1, %bx
       ?                            1004 test $0, %bx
       ?                            1005 jgt .top
       ?                            1000 mov 2000, %ax
       ?                            1001 add $1, %ax
       ?                            1002 mov %ax, 2000
       ?                            1003 sub  $1, %bx
       ?                            1004 test $0, %bx
       ?                            1005 jgt .top
       ?                            1000 mov 2000, %ax
       ?                            1001 add $1, %ax
       ?                            1002 mov %ax, 2000
       ?                            1003 sub  $1, %bx
       ?                            1004 test $0, %bx
       ?                            1005 jgt .top
       ?                            1006 halt
   ```

   The loop is defined by the register `%bx`, as we set it to start as 3 in each thread, and the timing is big enough for them to run separated, we have 3 loops.

   As the threads can run to completion separatedly, `value` will start as 0 and end as `6`:

   ```bash
   2000          Thread 0                Thread 1         
       0   
       0   1000 mov 2000, %ax
       0   1001 add $1, %ax
       1   1002 mov %ax, 2000
       1   1003 sub  $1, %bx
       1   1004 test $0, %bx
       1   1005 jgt .top
       1   1000 mov 2000, %ax
       1   1001 add $1, %ax
       2   1002 mov %ax, 2000
       2   1003 sub  $1, %bx
       2   1004 test $0, %bx
       2   1005 jgt .top
       2   1000 mov 2000, %ax
       2   1001 add $1, %ax
       3   1002 mov %ax, 2000
       3   1003 sub  $1, %bx
       3   1004 test $0, %bx
       3   1005 jgt .top
       3   1006 halt
       3   ----- Halt;Switch -----  ----- Halt;Switch -----  
       3                            1000 mov 2000, %ax
       3                            1001 add $1, %ax
       4                            1002 mov %ax, 2000
       4                            1003 sub  $1, %bx
       4                            1004 test $0, %bx
       4                            1005 jgt .top
       4                            1000 mov 2000, %ax
       4                            1001 add $1, %ax
       5                            1002 mov %ax, 2000
       5                            1003 sub  $1, %bx
       5                            1004 test $0, %bx
       5                            1005 jgt .top
       5                            1000 mov 2000, %ax
       5                            1001 add $1, %ax
       6                            1002 mov %ax, 2000
       6                            1003 sub  $1, %bx
       6                            1004 test $0, %bx
       6                            1005 jgt .top
       6                            1006 halt
   ```

   We validated it with `-c`:

   ```bash
    2000          Thread 0                Thread 1         
       0   
       0   1000 mov 2000, %ax
       0   1001 add $1, %ax
       1   1002 mov %ax, 2000
       1   1003 sub  $1, %bx
       1   1004 test $0, %bx
       1   1005 jgt .top
       1   1000 mov 2000, %ax
       1   1001 add $1, %ax
       2   1002 mov %ax, 2000
       2   1003 sub  $1, %bx
       2   1004 test $0, %bx
       2   1005 jgt .top
       2   1000 mov 2000, %ax
       2   1001 add $1, %ax
       3   1002 mov %ax, 2000
       3   1003 sub  $1, %bx
       3   1004 test $0, %bx
       3   1005 jgt .top
       3   1006 halt
       3   ----- Halt;Switch -----  ----- Halt;Switch -----  
       3                            1000 mov 2000, %ax
       3                            1001 add $1, %ax
       4                            1002 mov %ax, 2000
       4                            1003 sub  $1, %bx
       4                            1004 test $0, %bx
       4                            1005 jgt .top
       4                            1000 mov 2000, %ax
       4                            1001 add $1, %ax
       5                            1002 mov %ax, 2000
       5                            1003 sub  $1, %bx
       5                            1004 test $0, %bx
       5                            1005 jgt .top
       5                            1000 mov 2000, %ax
       5                            1001 add $1, %ax
       6                            1002 mov %ax, 2000
       6                            1003 sub  $1, %bx
       6                            1004 test $0, %bx
       6                            1005 jgt .top
       6                            1006 halt
   ```

   

6. **Run with random interrupt intervals: `./x86.py -p looping-race-nolock.s -t 2 -M 2000 -i 4 -r -s 0` with different seeds (`-s 1`, `-s 2`, etc.) Can you tell by looking at the thread interleaving what the final value of value will be? Does the timing of the interrupt matter? Where can it safely occur? Where not? In other words, where is the critical section exactly?**

   Result of `./x86.py -p looping-race-nolock.s -t 2 -M 2000 -i 4 -r -s 0`

   ```bash
    2000          Thread 0                Thread 1         
       ?   
       ?   1000 mov 2000, %ax
       ?   1001 add $1, %ax
       ?   1002 mov %ax, 2000
       ?   1003 sub  $1, %bx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1000 mov 2000, %ax
       ?                            1001 add $1, %ax
       ?                            1002 mov %ax, 2000
       ?                            1003 sub  $1, %bx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1004 test $0, %bx
       ?   1005 jgt .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1004 test $0, %bx
       ?                            1005 jgt .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1006 halt
       ?   ----- Halt;Switch -----  ----- Halt;Switch -----  
       ?                            1006 halt
   ```

   Result of `./x86.py -p looping-race-nolock.s -t 2 -M 2000 -i 4 -r -s 1`

   ```bash
    2000          Thread 0                Thread 1         
       ?   
       ?   1000 mov 2000, %ax
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1000 mov 2000, %ax
       ?                            1001 add $1, %ax
       ?                            1002 mov %ax, 2000
       ?                            1003 sub  $1, %bx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1001 add $1, %ax
       ?   1002 mov %ax, 2000
       ?   1003 sub  $1, %bx
       ?   1004 test $0, %bx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1004 test $0, %bx
       ?                            1005 jgt .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1005 jgt .top
       ?   1006 halt
       ?   ----- Halt;Switch -----  ----- Halt;Switch -----  
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1006 halt
   ```

   Result of `./x86.py -p looping-race-nolock.s -t 2 -M 2000 -i 4 -r -s 2`

   ```bash
    2000          Thread 0                Thread 1         
       ?   
       ?   1000 mov 2000, %ax
       ?   1001 add $1, %ax
       ?   1002 mov %ax, 2000
       ?   1003 sub  $1, %bx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1000 mov 2000, %ax
       ?                            1001 add $1, %ax
       ?                            1002 mov %ax, 2000
       ?                            1003 sub  $1, %bx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1004 test $0, %bx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1004 test $0, %bx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1005 jgt .top
       ?   1006 halt
       ?   ----- Halt;Switch -----  ----- Halt;Switch -----  
       ?                            1005 jgt .top
       ?                            1006 halt
   ```

   We can tell for these cases the final value as the number of interactions are small, as we do not have a loop, so for seed 0 and 2 the value is 2 and for seed 1 the value is 1.

   The time of the interrupt does matter, as it can cause the race conditions, as in the case of seed 1.

   It can safely occur after moving the incremented value back to the address 2000 and before reading 2000 into the register. Any other place it is not safe, which is after reading 2000 into the register and putting it back.

   The critical section is then:
   ```assembly
   mov 2000, %ax  # get 'value' at address 2000
   add $1, %ax    # increment it
   mov %ax, 2000  # store it back
   ```

7.  **Now examine fixed interrupt intervals: `./x86.py -p looping-race-nolock.s -a bx=1 -t 2 -M 2000 -i 1` What will the final value of the shared variable value be? What about when you change `-i 2`, `-i 3`, etc.? For which interrupt intervals does the program give the “correct” answer?**

   Result for `./x86.py -p looping-race-nolock.s -a bx=1 -t 2 -M 2000 -i 1`

   ```bash
    2000          Thread 0                Thread 1         
       ?   
       ?   1000 mov 2000, %ax
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1000 mov 2000, %ax
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1001 add $1, %ax
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1001 add $1, %ax
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1002 mov %ax, 2000
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1002 mov %ax, 2000
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1003 sub  $1, %bx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1003 sub  $1, %bx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1004 test $0, %bx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1004 test $0, %bx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1005 jgt .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1005 jgt .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1006 halt
       ?   ----- Halt;Switch -----  ----- Halt;Switch -----  
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1006 halt
   ```

   For `-i 1` every step has an interruption, so the final value is 1, as both read them and update at the same time, overwritten `value`, as validated with `-c`:

   ```bash
    2000          Thread 0                Thread 1         
       0   
       0   1000 mov 2000, %ax
       0   ------ Interrupt ------  ------ Interrupt ------  
       0                            1000 mov 2000, %ax
       0   ------ Interrupt ------  ------ Interrupt ------  
       0   1001 add $1, %ax
       0   ------ Interrupt ------  ------ Interrupt ------  
       0                            1001 add $1, %ax
       0   ------ Interrupt ------  ------ Interrupt ------  
       1   1002 mov %ax, 2000
       1   ------ Interrupt ------  ------ Interrupt ------  
       1                            1002 mov %ax, 2000
       1   ------ Interrupt ------  ------ Interrupt ------  
       1   1003 sub  $1, %bx
       1   ------ Interrupt ------  ------ Interrupt ------  
       1                            1003 sub  $1, %bx
       1   ------ Interrupt ------  ------ Interrupt ------  
       1   1004 test $0, %bx
       1   ------ Interrupt ------  ------ Interrupt ------  
       1                            1004 test $0, %bx
       1   ------ Interrupt ------  ------ Interrupt ------  
       1   1005 jgt .top
       1   ------ Interrupt ------  ------ Interrupt ------  
       1                            1005 jgt .top
       1   ------ Interrupt ------  ------ Interrupt ------  
       1   1006 halt
       1   ----- Halt;Switch -----  ----- Halt;Switch -----  
       1   ------ Interrupt ------  ------ Interrupt ------  
       1                            1006 halt
   ```

   Result for `./x86.py -p looping-race-nolock.s -a bx=1 -t 2 -M 2000 -i 2`

   ```bash
    2000          Thread 0                Thread 1         
       ?   
       ?   1000 mov 2000, %ax
       ?   1001 add $1, %ax
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1000 mov 2000, %ax
       ?                            1001 add $1, %ax
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1002 mov %ax, 2000
       ?   1003 sub  $1, %bx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1002 mov %ax, 2000
       ?                            1003 sub  $1, %bx
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1004 test $0, %bx
       ?   1005 jgt .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1004 test $0, %bx
       ?                            1005 jgt .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1006 halt
       ?   ----- Halt;Switch -----  ----- Halt;Switch -----  
       ?                            1006 halt
   ```

   For `-i 2`, it will also be 1, as both still updates value at the same time. Validated with `-c`:

   ```bash
    2000          Thread 0                Thread 1         
       0   
       0   1000 mov 2000, %ax
       0   1001 add $1, %ax
       0   ------ Interrupt ------  ------ Interrupt ------  
       0                            1000 mov 2000, %ax
       0                            1001 add $1, %ax
       0   ------ Interrupt ------  ------ Interrupt ------  
       1   1002 mov %ax, 2000
       1   1003 sub  $1, %bx
       1   ------ Interrupt ------  ------ Interrupt ------  
       1                            1002 mov %ax, 2000
       1                            1003 sub  $1, %bx
       1   ------ Interrupt ------  ------ Interrupt ------  
       1   1004 test $0, %bx
       1   1005 jgt .top
       1   ------ Interrupt ------  ------ Interrupt ------  
       1                            1004 test $0, %bx
       1                            1005 jgt .top
       1   ------ Interrupt ------  ------ Interrupt ------  
       1   1006 halt
       1   ----- Halt;Switch -----  ----- Halt;Switch -----  
       1                            1006 halt
   ```

   Result for `./x86.py -p looping-race-nolock.s -a bx=1 -t 2 -M 2000 -i 3`

   ```bash
    2000          Thread 0                Thread 1         
       ?   
       ?   1000 mov 2000, %ax
       ?   1001 add $1, %ax
       ?   1002 mov %ax, 2000
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1000 mov 2000, %ax
       ?                            1001 add $1, %ax
       ?                            1002 mov %ax, 2000
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1003 sub  $1, %bx
       ?   1004 test $0, %bx
       ?   1005 jgt .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?                            1003 sub  $1, %bx
       ?                            1004 test $0, %bx
       ?                            1005 jgt .top
       ?   ------ Interrupt ------  ------ Interrupt ------  
       ?   1006 halt
       ?   ----- Halt;Switch -----  ----- Halt;Switch -----  
       ?                            1006 halt
   ```

   For `-i 3` (and beyond), it will be 2, as now each update of value happens one after other. Validated with `-c`:

   ```bash
    2000          Thread 0                Thread 1         
       0   
       0   1000 mov 2000, %ax
       0   1001 add $1, %ax
       1   1002 mov %ax, 2000
       1   ------ Interrupt ------  ------ Interrupt ------  
       1                            1000 mov 2000, %ax
       1                            1001 add $1, %ax
       2                            1002 mov %ax, 2000
       2   ------ Interrupt ------  ------ Interrupt ------  
       2   1003 sub  $1, %bx
       2   1004 test $0, %bx
       2   1005 jgt .top
       2   ------ Interrupt ------  ------ Interrupt ------  
       2                            1003 sub  $1, %bx
       2                            1004 test $0, %bx
       2                            1005 jgt .top
       2   ------ Interrupt ------  ------ Interrupt ------  
       2   1006 halt
       2   ----- Halt;Switch -----  ----- Halt;Switch -----  
       2                            1006 halt
   ```

   For any interval $\geq 3$ it will have the correct value, for 2 threads with one loop iteration.

8. **Run the same for more loops (e.g., set `-a bx=100`). What interrupt intervals (`-i`) lead to a correct outcome? Which intervals are surprising?**

   Final result for `-a bx=100 =i 1` is 100, so it is wrong, as the correct one must be 200.

   The correct one value of `-i` must be one that let's the critical section happen between it interval. Which is 3 lines. So I believe that any interval multiple of 3 will result in 200.

   To validate that let's test with `-i` in the range 3-99, with step 3.
   The result is in the table:

   I’ll run the simulation for each requested interrupt interval and extract the first value from its final line.

   Ran terminal command: cd 'simulation-files/HW-ThreadsIntro' && python3 ./x86.py -p looping-race-nolock.s -a bx=100 -t 2 -M 2000 -i 3 -c | tail -n 5

   Ran terminal command: cd 'simulation-files/HW-ThreadsIntro' || exit 1
   set -o pipefail
   printf '| -i | final value |\n|---:|---:|\n'
   for n in $(seq 3 3 99); do
     last=$(python3 ./x86.py -p looping-race-nolock.s -a bx=100 -t 2 -M 2000 -i "$n" -c | tail -n 1) || exit 1
     printf '%s\n' "$last" | awk -v n="$n" 'NF && $1 ~ /^[0-9]+$/ { printf "| %d | %s |\n", n, $1; found=1 } END { if (!found) { print "Invalid final line for interval " n > "/dev/stderr"; exit 1 } }' || exit 1
   done

   |   -i | final value |
   | ---: | ----------: |
   |    3 |         200 |
   |    6 |         200 |
   |    9 |         200 |
   |   12 |         200 |
   |   15 |         200 |
   |   18 |         200 |
   |   21 |         200 |
   |   24 |         200 |
   |   27 |         200 |
   |   30 |         200 |
   |   33 |         200 |
   |   36 |         200 |
   |   39 |         200 |
   |   42 |         200 |
   |   45 |         200 |
   |   48 |         200 |
   |   51 |         200 |
   |   54 |         200 |
   |   57 |         200 |
   |   60 |         200 |
   |   63 |         200 |
   |   66 |         200 |
   |   69 |         200 |
   |   72 |         200 |
   |   75 |         200 |
   |   78 |         200 |
   |   81 |         200 |
   |   84 |         200 |
   |   87 |         200 |
   |   90 |         200 |
   |   93 |         200 |
   |   96 |         200 |
   |   99 |         200 |

   Which proves my point.

   Any value that is not multiple of 3 will result in a wrong result. 

9. **One last program: [`wait-for-me.s`](./simulation-files/HW-ThreadsIntro/wait-for-me.s). Run: `./x86.py -p wait-for-me.s -a ax=1,ax=0 -R ax -M 2000` This sets the `%ax` register to 1 for thread 0, and 0 for thread 1, and watches `%ax` and memory location 2000. How should the code behave? How is the value at location 2000 being used by the threads? What will its final value be?**

   What this program does:

   1. If `%ax` is 1, sets address 2000 as 1 and halts
   2. Otherwise loops waiting until address 2000 to be 1, then set 2000 to 1 and halts.

   Based on that, thread 0 will set address 2000 to 1 and halts, then thread 1 will go the loop to iterate only once.
   We verify by running `./x86.py -p wait-for-me.s -a ax=1,ax=0 -R ax -M 2000`:

   ```bash
    2000      ax          Thread 0                Thread 1         
       ?       ?   
       ?       ?   1000 test $1, %ax
       ?       ?   1001 je .signaller
       ?       ?   1006 mov  $1, 2000
       ?       ?   1007 halt
       ?       ?   ----- Halt;Switch -----  ----- Halt;Switch -----  
       ?       ?                            1000 test $1, %ax
       ?       ?                            1001 je .signaller
       ?       ?                            1002 mov  2000, %cx
       ?       ?                            1003 test $1, %cx
       ?       ?                            1004 jne .waiter
       ?       ?                            1005 halt
   ```

   The location 2000 is used to verify if the loops iterate or not.

   The final value will be 1:

   ```bash
    2000      ax          Thread 0                Thread 1         
       0       1   
       0       1   1000 test $1, %ax
       0       1   1001 je .signaller
       1       1   1006 mov  $1, 2000
       1       1   1007 halt
       1       0   ----- Halt;Switch -----  ----- Halt;Switch -----  
       1       0                            1000 test $1, %ax
       1       0                            1001 je .signaller
       1       0                            1002 mov  2000, %cx
       1       0                            1003 test $1, %cx
       1       0                            1004 jne .waiter
       1       0                            1005 halt
   ```

   We validate that with `-c`:

   ```bash
    2000      ax          Thread 0                Thread 1         
       0       1   
       0       1   1000 test $1, %ax
       0       1   1001 je .signaller
       1       1   1006 mov  $1, 2000
       1       1   1007 halt
       1       0   ----- Halt;Switch -----  ----- Halt;Switch -----  
       1       0                            1000 test $1, %ax
       1       0                            1001 je .signaller
       1       0                            1002 mov  2000, %cx
       1       0                            1003 test $1, %cx
       1       0                            1004 jne .waiter
       1       0                            1005 halt
   ```

   

10. **Now switch the inputs: `./x86.py -p wait-for-me.s -a ax=0,ax=1 -R ax -M 2000` How do the threads behave? What is thread 0 doing? How would changing the interrupt interval (e.g., `-i 1000`, or perhaps to use random intervals) change the trace outcome? Is the program efficiently using the CPU?**
    Now thread 0 will be waiting for an interval so thread 1 can run and change the address 2000 value to 1.
    Result for `./x86.py -p wait-for-me.s -a ax=0,ax=1 -R ax -M 2000`

    ```bash
     2000      ax          Thread 0                Thread 1         
        ?       ?   
        ?       ?   1000 test $1, %ax
        ?       ?   1001 je .signaller
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   ------ Interrupt ------  ------ Interrupt ------  
        ?       ?                            1000 test $1, %ax
        ?       ?                            1001 je .signaller
        ?       ?                            1006 mov  $1, 2000
        ?       ?                            1007 halt
        ?       ?   ----- Halt;Switch -----  ----- Halt;Switch -----  
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1005 halt
    ```

    Result for `./x86.py -p wait-for-me.s -a ax=0,ax=1 -R ax -M 2000 -i 10`:

    ```bash
     2000      ax          Thread 0                Thread 1         
        ?       ?   
        ?       ?   1000 test $1, %ax
        ?       ?   1001 je .signaller
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   ------ Interrupt ------  ------ Interrupt ------  
        ?       ?                            1000 test $1, %ax
        ?       ?                            1001 je .signaller
        ?       ?                            1006 mov  $1, 2000
        ?       ?                            1007 halt
        ?       ?   ----- Halt;Switch -----  ----- Halt;Switch -----  
        ?       ?   1004 jne .waiter
        ?       ?   1002 mov  2000, %cx
        ?       ?   1003 test $1, %cx
        ?       ?   1004 jne .waiter
        ?       ?   1005 halt
    ```

    Thus larger the interval, more thread 0 will wait for thread 1.

    This program only use CPU efficiently if the interval is small enough.













