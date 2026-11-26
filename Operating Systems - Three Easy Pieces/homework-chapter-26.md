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

3.  Run this: `./x86.py -p loop.s -t 2 -i 3 -r -R dx -a dx=3,dx=3` This makes the interrupt interval small/random; use different seeds (`-s`) to see different inter-leavings. Does the interrupt frequency change anything?

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

4. a