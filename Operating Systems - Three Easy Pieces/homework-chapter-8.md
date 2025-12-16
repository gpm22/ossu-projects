# 8 - Scheduling: The Multi-Level Feedback Queue

## Homework (Simulation)

This program, `mlfq.py`, allows you to see how the MLFQ scheduler presented in this chapter behaves.
See the README for details.

## Questions

1. **Run a few randomly-generated problems with just two jobs and two queues; compute the MLFQ execution trace for each. Make your life easier by limiting the length of each job and turning off I/Os.**

  - First Run

    ```bash
    python3 mlfq.py -j 2 -n 2 -m 10 -M 0 -c
    Here is the list of inputs:
    OPTIONS jobs 2
    OPTIONS queues 2
    OPTIONS allotments for queue  1 is   1
    OPTIONS quantum length for queue  1 is  10
    OPTIONS allotments for queue  0 is   1
    OPTIONS quantum length for queue  0 is  10
    OPTIONS boost 0
    OPTIONS ioTime 5
    OPTIONS stayAfterIO False
    OPTIONS iobump False
    
    
    For each job, three defining characteristics are given:
      startTime : at what time does the job enter the system
      runTime   : the total CPU time needed by the job to finish
      ioFreq    : every ioFreq time units, the job issues an I/O
                  (the I/O takes ioTime units to complete)
    
    Job List:
      Job  0: startTime   0 - runTime   8 - ioFreq   0
      Job  1: startTime   0 - runTime   4 - ioFreq   0
    
    
    Execution Trace:
    
    [ time 0 ] JOB BEGINS by JOB 0
    [ time 0 ] JOB BEGINS by JOB 1
    [ time 0 ] Run JOB 0 at PRIORITY 1 [ TICKS 9 ALLOT 1 TIME 7 (of 8) ]
    [ time 1 ] Run JOB 0 at PRIORITY 1 [ TICKS 8 ALLOT 1 TIME 6 (of 8) ]
    [ time 2 ] Run JOB 0 at PRIORITY 1 [ TICKS 7 ALLOT 1 TIME 5 (of 8) ]
    [ time 3 ] Run JOB 0 at PRIORITY 1 [ TICKS 6 ALLOT 1 TIME 4 (of 8) ]
    [ time 4 ] Run JOB 0 at PRIORITY 1 [ TICKS 5 ALLOT 1 TIME 3 (of 8) ]
    [ time 5 ] Run JOB 0 at PRIORITY 1 [ TICKS 4 ALLOT 1 TIME 2 (of 8) ]
    [ time 6 ] Run JOB 0 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 1 (of 8) ]
    [ time 7 ] Run JOB 0 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 0 (of 8) ]
    [ time 8 ] FINISHED JOB 0
    [ time 8 ] Run JOB 1 at PRIORITY 1 [ TICKS 9 ALLOT 1 TIME 3 (of 4) ]
    [ time 9 ] Run JOB 1 at PRIORITY 1 [ TICKS 8 ALLOT 1 TIME 2 (of 4) ]
    [ time 10 ] Run JOB 1 at PRIORITY 1 [ TICKS 7 ALLOT 1 TIME 1 (of 4) ]
    [ time 11 ] Run JOB 1 at PRIORITY 1 [ TICKS 6 ALLOT 1 TIME 0 (of 4) ]
    [ time 12 ] FINISHED JOB 1
    
    Final statistics:
      Job  0: startTime   0 - response   0 - turnaround   8
      Job  1: startTime   0 - response   8 - turnaround  12
    
      Avg  1: startTime n/a - response 4.00 - turnaround 10.00
    
    ```

  - Second Run

    ```bash
    python3 mlfq.py -j 2 -n 2 -m 10 -M 0 -c
    Here is the list of inputs:
    OPTIONS jobs 2
    OPTIONS queues 2
    OPTIONS allotments for queue  1 is   1
    OPTIONS quantum length for queue  1 is  10
    OPTIONS allotments for queue  0 is   1
    OPTIONS quantum length for queue  0 is  10
    OPTIONS boost 0
    OPTIONS ioTime 5
    OPTIONS stayAfterIO False
    OPTIONS iobump False
    
    
    For each job, three defining characteristics are given:
      startTime : at what time does the job enter the system
      runTime   : the total CPU time needed by the job to finish
      ioFreq    : every ioFreq time units, the job issues an I/O
                  (the I/O takes ioTime units to complete)
    
    Job List:
      Job  0: startTime   0 - runTime   8 - ioFreq   0
      Job  1: startTime   0 - runTime   4 - ioFreq   0
    
    
    Execution Trace:
    
    [ time 0 ] JOB BEGINS by JOB 0
    [ time 0 ] JOB BEGINS by JOB 1
    [ time 0 ] Run JOB 0 at PRIORITY 1 [ TICKS 9 ALLOT 1 TIME 7 (of 8) ]
    [ time 1 ] Run JOB 0 at PRIORITY 1 [ TICKS 8 ALLOT 1 TIME 6 (of 8) ]
    [ time 2 ] Run JOB 0 at PRIORITY 1 [ TICKS 7 ALLOT 1 TIME 5 (of 8) ]
    [ time 3 ] Run JOB 0 at PRIORITY 1 [ TICKS 6 ALLOT 1 TIME 4 (of 8) ]
    [ time 4 ] Run JOB 0 at PRIORITY 1 [ TICKS 5 ALLOT 1 TIME 3 (of 8) ]
    [ time 5 ] Run JOB 0 at PRIORITY 1 [ TICKS 4 ALLOT 1 TIME 2 (of 8) ]
    [ time 6 ] Run JOB 0 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 1 (of 8) ]
    [ time 7 ] Run JOB 0 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 0 (of 8) ]
    [ time 8 ] FINISHED JOB 0
    [ time 8 ] Run JOB 1 at PRIORITY 1 [ TICKS 9 ALLOT 1 TIME 3 (of 4) ]
    [ time 9 ] Run JOB 1 at PRIORITY 1 [ TICKS 8 ALLOT 1 TIME 2 (of 4) ]
    [ time 10 ] Run JOB 1 at PRIORITY 1 [ TICKS 7 ALLOT 1 TIME 1 (of 4) ]
    [ time 11 ] Run JOB 1 at PRIORITY 1 [ TICKS 6 ALLOT 1 TIME 0 (of 4) ]
    [ time 12 ] FINISHED JOB 1
    
    Final statistics:
      Job  0: startTime   0 - response   0 - turnaround   8
      Job  1: startTime   0 - response   8 - turnaround  12
    
      Avg  1: startTime n/a - response 4.00 - turnaround 10.00
    
    ```

    

  - Third Run

    ```bash
    python3 mlfq.py -j 2 -n 2 -m 10 -M 0 -c
    Here is the list of inputs:
    OPTIONS jobs 2
    OPTIONS queues 2
    OPTIONS allotments for queue  1 is   1
    OPTIONS quantum length for queue  1 is  10
    OPTIONS allotments for queue  0 is   1
    OPTIONS quantum length for queue  0 is  10
    OPTIONS boost 0
    OPTIONS ioTime 5
    OPTIONS stayAfterIO False
    OPTIONS iobump False
    
    
    For each job, three defining characteristics are given:
      startTime : at what time does the job enter the system
      runTime   : the total CPU time needed by the job to finish
      ioFreq    : every ioFreq time units, the job issues an I/O
                  (the I/O takes ioTime units to complete)
    
    Job List:
      Job  0: startTime   0 - runTime   8 - ioFreq   0
      Job  1: startTime   0 - runTime   4 - ioFreq   0
    
    
    Execution Trace:
    
    [ time 0 ] JOB BEGINS by JOB 0
    [ time 0 ] JOB BEGINS by JOB 1
    [ time 0 ] Run JOB 0 at PRIORITY 1 [ TICKS 9 ALLOT 1 TIME 7 (of 8) ]
    [ time 1 ] Run JOB 0 at PRIORITY 1 [ TICKS 8 ALLOT 1 TIME 6 (of 8) ]
    [ time 2 ] Run JOB 0 at PRIORITY 1 [ TICKS 7 ALLOT 1 TIME 5 (of 8) ]
    [ time 3 ] Run JOB 0 at PRIORITY 1 [ TICKS 6 ALLOT 1 TIME 4 (of 8) ]
    [ time 4 ] Run JOB 0 at PRIORITY 1 [ TICKS 5 ALLOT 1 TIME 3 (of 8) ]
    [ time 5 ] Run JOB 0 at PRIORITY 1 [ TICKS 4 ALLOT 1 TIME 2 (of 8) ]
    [ time 6 ] Run JOB 0 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 1 (of 8) ]
    [ time 7 ] Run JOB 0 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 0 (of 8) ]
    [ time 8 ] FINISHED JOB 0
    [ time 8 ] Run JOB 1 at PRIORITY 1 [ TICKS 9 ALLOT 1 TIME 3 (of 4) ]
    [ time 9 ] Run JOB 1 at PRIORITY 1 [ TICKS 8 ALLOT 1 TIME 2 (of 4) ]
    [ time 10 ] Run JOB 1 at PRIORITY 1 [ TICKS 7 ALLOT 1 TIME 1 (of 4) ]
    [ time 11 ] Run JOB 1 at PRIORITY 1 [ TICKS 6 ALLOT 1 TIME 0 (of 4) ]
    [ time 12 ] FINISHED JOB 1
    
    Final statistics:
      Job  0: startTime   0 - response   0 - turnaround   8
      Job  1: startTime   0 - response   8 - turnaround  12
    
      Avg  1: startTime n/a - response 4.00 - turnaround 10.00
    
    ```

  - Discussion

    - The execution was the same in the 3 runs because the jobs were the same.
    - The first job was run first than the second one.


2. **How would you run the scheduler to reproduce each of the examples in the chapter?**

  - Figure 8.1 - 2  High priority jobs, 1 medium, and 1 low.

    ```bash
     python3 mlfq.py -l 0,50,0:20,30,2:35,10,1:35,10,1 -c -B 0 -S -Q 2,2,3,3,3
    Here is the list of inputs:
    OPTIONS jobs 4
    OPTIONS queues 5
    OPTIONS allotments for queue  4 is   1
    OPTIONS quantum length for queue  4 is   2
    OPTIONS allotments for queue  3 is   1
    OPTIONS quantum length for queue  3 is   2
    OPTIONS allotments for queue  2 is   1
    OPTIONS quantum length for queue  2 is   3
    OPTIONS allotments for queue  1 is   1
    OPTIONS quantum length for queue  1 is   3
    OPTIONS allotments for queue  0 is   1
    OPTIONS quantum length for queue  0 is   3
    OPTIONS boost 0
    OPTIONS ioTime 5
    OPTIONS stayAfterIO True
    OPTIONS iobump False
    
    
    For each job, three defining characteristics are given:
      startTime : at what time does the job enter the system
      runTime   : the total CPU time needed by the job to finish
      ioFreq    : every ioFreq time units, the job issues an I/O
                  (the I/O takes ioTime units to complete)
    
    Job List:
      Job  0: startTime   0 - runTime  50 - ioFreq   0
      Job  1: startTime  20 - runTime  30 - ioFreq   2
      Job  2: startTime  35 - runTime  10 - ioFreq   1
      Job  3: startTime  35 - runTime  10 - ioFreq   1
    
    
    Execution Trace:
    
    [ time 0 ] JOB BEGINS by JOB 0
    [ time 0 ] Run JOB 0 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 49 (of 50) ]
    [ time 1 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 48 (of 50) ]
    [ time 2 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 47 (of 50) ]
    [ time 3 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 46 (of 50) ]
    [ time 4 ] Run JOB 0 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 45 (of 50) ]
    [ time 5 ] Run JOB 0 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 44 (of 50) ]
    [ time 6 ] Run JOB 0 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 43 (of 50) ]
    [ time 7 ] Run JOB 0 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 42 (of 50) ]
    [ time 8 ] Run JOB 0 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 41 (of 50) ]
    [ time 9 ] Run JOB 0 at PRIORITY 1 [ TICKS 0 ALLOT 1 TIME 40 (of 50) ]
    [ time 10 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 39 (of 50) ]
    [ time 11 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 38 (of 50) ]
    [ time 12 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 37 (of 50) ]
    [ time 13 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 36 (of 50) ]
    [ time 14 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 35 (of 50) ]
    [ time 15 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 34 (of 50) ]
    [ time 16 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 33 (of 50) ]
    [ time 17 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 32 (of 50) ]
    [ time 18 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 31 (of 50) ]
    [ time 19 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 30 (of 50) ]
    [ time 20 ] JOB BEGINS by JOB 1
    [ time 20 ] Run JOB 1 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 29 (of 30) ]
    [ time 21 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 28 (of 30) ]
    [ time 22 ] IO_START by JOB 1
    IO DONE
    [ time 22 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 29 (of 50) ]
    [ time 23 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 28 (of 50) ]
    [ time 24 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 27 (of 50) ]
    [ time 25 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 26 (of 50) ]
    [ time 26 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 25 (of 50) ]
    [ time 27 ] IO_DONE by JOB 1
    [ time 27 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 27 (of 30) ]
    [ time 28 ] Run JOB 1 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 26 (of 30) ]
    [ time 29 ] IO_START by JOB 1
    IO DONE
    [ time 29 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 24 (of 50) ]
    [ time 30 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 23 (of 50) ]
    [ time 31 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 22 (of 50) ]
    [ time 32 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 21 (of 50) ]
    [ time 33 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 20 (of 50) ]
    [ time 34 ] IO_DONE by JOB 1
    [ time 34 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 25 (of 30) ]
    [ time 35 ] JOB BEGINS by JOB 2
    [ time 35 ] JOB BEGINS by JOB 3
    [ time 35 ] Run JOB 2 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 9 (of 10) ]
    [ time 36 ] IO_START by JOB 2
    IO DONE
    [ time 36 ] Run JOB 3 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 9 (of 10) ]
    [ time 37 ] IO_START by JOB 3
    IO DONE
    [ time 37 ] Run JOB 1 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 24 (of 30) ]
    [ time 38 ] IO_START by JOB 1
    IO DONE
    [ time 38 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 19 (of 50) ]
    [ time 39 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 18 (of 50) ]
    [ time 40 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 17 (of 50) ]
    [ time 41 ] IO_DONE by JOB 2
    [ time 41 ] Run JOB 2 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 8 (of 10) ]
    [ time 42 ] IO_START by JOB 2
    IO DONE
    [ time 42 ] IO_DONE by JOB 3
    [ time 42 ] Run JOB 3 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 8 (of 10) ]
    [ time 43 ] IO_START by JOB 3
    IO DONE
    [ time 43 ] IO_DONE by JOB 1
    [ time 43 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 23 (of 30) ]
    [ time 44 ] Run JOB 1 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 22 (of 30) ]
    [ time 45 ] IO_START by JOB 1
    IO DONE
    [ time 45 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 16 (of 50) ]
    [ time 46 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 15 (of 50) ]
    [ time 47 ] IO_DONE by JOB 2
    [ time 47 ] Run JOB 2 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 7 (of 10) ]
    [ time 48 ] IO_START by JOB 2
    IO DONE
    [ time 48 ] IO_DONE by JOB 3
    [ time 48 ] Run JOB 3 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 7 (of 10) ]
    [ time 49 ] IO_START by JOB 3
    IO DONE
    [ time 49 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 14 (of 50) ]
    [ time 50 ] IO_DONE by JOB 1
    [ time 50 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 21 (of 30) ]
    [ time 51 ] Run JOB 1 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 20 (of 30) ]
    [ time 52 ] IO_START by JOB 1
    IO DONE
    [ time 52 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 13 (of 50) ]
    [ time 53 ] IO_DONE by JOB 2
    [ time 53 ] Run JOB 2 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 6 (of 10) ]
    [ time 54 ] IO_START by JOB 2
    IO DONE
    [ time 54 ] IO_DONE by JOB 3
    [ time 54 ] Run JOB 3 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 6 (of 10) ]
    [ time 55 ] IO_START by JOB 3
    IO DONE
    [ time 55 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 12 (of 50) ]
    [ time 56 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 11 (of 50) ]
    [ time 57 ] IO_DONE by JOB 1
    [ time 57 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 19 (of 30) ]
    [ time 58 ] Run JOB 1 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 18 (of 30) ]
    [ time 59 ] IO_START by JOB 1
    IO DONE
    [ time 59 ] IO_DONE by JOB 2
    [ time 59 ] Run JOB 2 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 5 (of 10) ]
    [ time 60 ] IO_START by JOB 2
    IO DONE
    [ time 60 ] IO_DONE by JOB 3
    [ time 60 ] Run JOB 3 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 5 (of 10) ]
    [ time 61 ] IO_START by JOB 3
    IO DONE
    [ time 61 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 10 (of 50) ]
    [ time 62 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 9 (of 50) ]
    [ time 63 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 8 (of 50) ]
    [ time 64 ] IO_DONE by JOB 1
    [ time 64 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 17 (of 30) ]
    [ time 65 ] IO_DONE by JOB 2
    [ time 65 ] Run JOB 2 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 4 (of 10) ]
    [ time 66 ] IO_START by JOB 2
    IO DONE
    [ time 66 ] IO_DONE by JOB 3
    [ time 66 ] Run JOB 3 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 4 (of 10) ]
    [ time 67 ] IO_START by JOB 3
    IO DONE
    [ time 67 ] Run JOB 1 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 16 (of 30) ]
    [ time 68 ] IO_START by JOB 1
    IO DONE
    [ time 68 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 7 (of 50) ]
    [ time 69 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 6 (of 50) ]
    [ time 70 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 5 (of 50) ]
    [ time 71 ] IO_DONE by JOB 2
    [ time 71 ] Run JOB 2 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 3 (of 10) ]
    [ time 72 ] IO_START by JOB 2
    IO DONE
    [ time 72 ] IO_DONE by JOB 3
    [ time 72 ] Run JOB 3 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 3 (of 10) ]
    [ time 73 ] IO_START by JOB 3
    IO DONE
    [ time 73 ] IO_DONE by JOB 1
    [ time 73 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 15 (of 30) ]
    [ time 74 ] Run JOB 1 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 14 (of 30) ]
    [ time 75 ] IO_START by JOB 1
    IO DONE
    [ time 75 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 4 (of 50) ]
    [ time 76 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 3 (of 50) ]
    [ time 77 ] IO_DONE by JOB 2
    [ time 77 ] Run JOB 2 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 2 (of 10) ]
    [ time 78 ] IO_START by JOB 2
    IO DONE
    [ time 78 ] IO_DONE by JOB 3
    [ time 78 ] Run JOB 3 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 2 (of 10) ]
    [ time 79 ] IO_START by JOB 3
    IO DONE
    [ time 79 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 2 (of 50) ]
    [ time 80 ] IO_DONE by JOB 1
    [ time 80 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 13 (of 30) ]
    [ time 81 ] Run JOB 1 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 12 (of 30) ]
    [ time 82 ] IO_START by JOB 1
    IO DONE
    [ time 82 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 1 (of 50) ]
    [ time 83 ] IO_DONE by JOB 2
    [ time 83 ] Run JOB 2 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 1 (of 10) ]
    [ time 84 ] IO_START by JOB 2
    IO DONE
    [ time 84 ] IO_DONE by JOB 3
    [ time 84 ] Run JOB 3 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 1 (of 10) ]
    [ time 85 ] IO_START by JOB 3
    IO DONE
    [ time 85 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 0 (of 50) ]
    [ time 86 ] FINISHED JOB 0
    [ time 86 ] IDLE
    [ time 87 ] IO_DONE by JOB 1
    [ time 87 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 11 (of 30) ]
    [ time 88 ] Run JOB 1 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 10 (of 30) ]
    [ time 89 ] IO_START by JOB 1
    IO DONE
    [ time 89 ] IO_DONE by JOB 2
    [ time 89 ] Run JOB 2 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 0 (of 10) ]
    [ time 90 ] FINISHED JOB 2
    [ time 90 ] IO_DONE by JOB 3
    [ time 90 ] Run JOB 3 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 0 (of 10) ]
    [ time 91 ] FINISHED JOB 3
    [ time 91 ] IDLE
    [ time 92 ] IDLE
    [ time 93 ] IDLE
    [ time 94 ] IO_DONE by JOB 1
    [ time 94 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 9 (of 30) ]
    [ time 95 ] Run JOB 1 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 8 (of 30) ]
    [ time 96 ] IO_START by JOB 1
    IO DONE
    [ time 96 ] IDLE
    [ time 97 ] IDLE
    [ time 98 ] IDLE
    [ time 99 ] IDLE
    [ time 100 ] IDLE
    [ time 101 ] IO_DONE by JOB 1
    [ time 101 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 7 (of 30) ]
    [ time 102 ] Run JOB 1 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 6 (of 30) ]
    [ time 103 ] IO_START by JOB 1
    IO DONE
    [ time 103 ] IDLE
    [ time 104 ] IDLE
    [ time 105 ] IDLE
    [ time 106 ] IDLE
    [ time 107 ] IDLE
    [ time 108 ] IO_DONE by JOB 1
    [ time 108 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 5 (of 30) ]
    [ time 109 ] Run JOB 1 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 4 (of 30) ]
    [ time 110 ] IO_START by JOB 1
    IO DONE
    [ time 110 ] IDLE
    [ time 111 ] IDLE
    [ time 112 ] IDLE
    [ time 113 ] IDLE
    [ time 114 ] IDLE
    [ time 115 ] IO_DONE by JOB 1
    [ time 115 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 3 (of 30) ]
    [ time 116 ] Run JOB 1 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 2 (of 30) ]
    [ time 117 ] IO_START by JOB 1
    IO DONE
    [ time 117 ] IDLE
    [ time 118 ] IDLE
    [ time 119 ] IDLE
    [ time 120 ] IDLE
    [ time 121 ] IDLE
    [ time 122 ] IO_DONE by JOB 1
    [ time 122 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 1 (of 30) ]
    [ time 123 ] Run JOB 1 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 0 (of 30) ]
    [ time 124 ] FINISHED JOB 1
    
    Final statistics:
      Job  0: startTime   0 - response   0 - turnaround  86
      Job  1: startTime  20 - response   0 - turnaround 104
      Job  2: startTime  35 - response   0 - turnaround  55
      Job  3: startTime  35 - response   1 - turnaround  56
    
      Avg  3: startTime n/a - response 0.25 - turnaround 75.25
    ```

    - Job 0 is most of the time at queue 0
    - Job 1 is most of the time at queue 2
    - Jobs 2 and 3 is only at queue 4.

  - Figure 8.2 - 1 Long job running over time.

    ```bash
    python3 mlfq.py -l 0,50,0 -c -B 0 -S -Q 2,2,3,3,3
    Here is the list of inputs:
    OPTIONS jobs 1
    OPTIONS queues 5
    OPTIONS allotments for queue  4 is   1
    OPTIONS quantum length for queue  4 is   2
    OPTIONS allotments for queue  3 is   1
    OPTIONS quantum length for queue  3 is   2
    OPTIONS allotments for queue  2 is   1
    OPTIONS quantum length for queue  2 is   3
    OPTIONS allotments for queue  1 is   1
    OPTIONS quantum length for queue  1 is   3
    OPTIONS allotments for queue  0 is   1
    OPTIONS quantum length for queue  0 is   3
    OPTIONS boost 0
    OPTIONS ioTime 5
    OPTIONS stayAfterIO True
    OPTIONS iobump False
    
    
    For each job, three defining characteristics are given:
      startTime : at what time does the job enter the system
      runTime   : the total CPU time needed by the job to finish
      ioFreq    : every ioFreq time units, the job issues an I/O
                  (the I/O takes ioTime units to complete)
    
    Job List:
      Job  0: startTime   0 - runTime  50 - ioFreq   0
    
    
    Execution Trace:
    
    [ time 0 ] JOB BEGINS by JOB 0
    [ time 0 ] Run JOB 0 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 49 (of 50) ]
    [ time 1 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 48 (of 50) ]
    [ time 2 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 47 (of 50) ]
    [ time 3 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 46 (of 50) ]
    [ time 4 ] Run JOB 0 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 45 (of 50) ]
    [ time 5 ] Run JOB 0 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 44 (of 50) ]
    [ time 6 ] Run JOB 0 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 43 (of 50) ]
    [ time 7 ] Run JOB 0 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 42 (of 50) ]
    [ time 8 ] Run JOB 0 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 41 (of 50) ]
    [ time 9 ] Run JOB 0 at PRIORITY 1 [ TICKS 0 ALLOT 1 TIME 40 (of 50) ]
    [ time 10 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 39 (of 50) ]
    [ time 11 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 38 (of 50) ]
    [ time 12 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 37 (of 50) ]
    [ time 13 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 36 (of 50) ]
    [ time 14 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 35 (of 50) ]
    [ time 15 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 34 (of 50) ]
    [ time 16 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 33 (of 50) ]
    [ time 17 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 32 (of 50) ]
    [ time 18 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 31 (of 50) ]
    [ time 19 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 30 (of 50) ]
    [ time 20 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 29 (of 50) ]
    [ time 21 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 28 (of 50) ]
    [ time 22 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 27 (of 50) ]
    [ time 23 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 26 (of 50) ]
    [ time 24 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 25 (of 50) ]
    [ time 25 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 24 (of 50) ]
    [ time 26 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 23 (of 50) ]
    [ time 27 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 22 (of 50) ]
    [ time 28 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 21 (of 50) ]
    [ time 29 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 20 (of 50) ]
    [ time 30 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 19 (of 50) ]
    [ time 31 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 18 (of 50) ]
    [ time 32 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 17 (of 50) ]
    [ time 33 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 16 (of 50) ]
    [ time 34 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 15 (of 50) ]
    [ time 35 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 14 (of 50) ]
    [ time 36 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 13 (of 50) ]
    [ time 37 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 12 (of 50) ]
    [ time 38 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 11 (of 50) ]
    [ time 39 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 10 (of 50) ]
    [ time 40 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 9 (of 50) ]
    [ time 41 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 8 (of 50) ]
    [ time 42 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 7 (of 50) ]
    [ time 43 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 6 (of 50) ]
    [ time 44 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 5 (of 50) ]
    [ time 45 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 4 (of 50) ]
    [ time 46 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 3 (of 50) ]
    [ time 47 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 2 (of 50) ]
    [ time 48 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 1 (of 50) ]
    [ time 49 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 0 (of 50) ]
    [ time 50 ] FINISHED JOB 0
    
    Final statistics:
      Job  0: startTime   0 - response   0 - turnaround  50
    
      Avg  0: startTime n/a - response 0.00 - turnaround 50.00
    ```

  - Figure 8.3

    - 1 Long job running continually first then a smaller one running continually

      ```bash
       python3 mlfq.py -l 0,50,0:20,5,0 -c -B 0 -S -Q 2,2,3,3,3
      Here is the list of inputs:
      OPTIONS jobs 2
      OPTIONS queues 5
      OPTIONS allotments for queue  4 is   1
      OPTIONS quantum length for queue  4 is   2
      OPTIONS allotments for queue  3 is   1
      OPTIONS quantum length for queue  3 is   2
      OPTIONS allotments for queue  2 is   1
      OPTIONS quantum length for queue  2 is   3
      OPTIONS allotments for queue  1 is   1
      OPTIONS quantum length for queue  1 is   3
      OPTIONS allotments for queue  0 is   1
      OPTIONS quantum length for queue  0 is   3
      OPTIONS boost 0
      OPTIONS ioTime 5
      OPTIONS stayAfterIO True
      OPTIONS iobump False
      
      
      For each job, three defining characteristics are given:
        startTime : at what time does the job enter the system
        runTime   : the total CPU time needed by the job to finish
        ioFreq    : every ioFreq time units, the job issues an I/O
                    (the I/O takes ioTime units to complete)
      
      Job List:
        Job  0: startTime   0 - runTime  50 - ioFreq   0
        Job  1: startTime  20 - runTime   5 - ioFreq   0
      
      
      Execution Trace:
      
      [ time 0 ] JOB BEGINS by JOB 0
      [ time 0 ] Run JOB 0 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 49 (of 50) ]
      [ time 1 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 48 (of 50) ]
      [ time 2 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 47 (of 50) ]
      [ time 3 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 46 (of 50) ]
      [ time 4 ] Run JOB 0 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 45 (of 50) ]
      [ time 5 ] Run JOB 0 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 44 (of 50) ]
      [ time 6 ] Run JOB 0 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 43 (of 50) ]
      [ time 7 ] Run JOB 0 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 42 (of 50) ]
      [ time 8 ] Run JOB 0 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 41 (of 50) ]
      [ time 9 ] Run JOB 0 at PRIORITY 1 [ TICKS 0 ALLOT 1 TIME 40 (of 50) ]
      [ time 10 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 39 (of 50) ]
      [ time 11 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 38 (of 50) ]
      [ time 12 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 37 (of 50) ]
      [ time 13 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 36 (of 50) ]
      [ time 14 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 35 (of 50) ]
      [ time 15 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 34 (of 50) ]
      [ time 16 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 33 (of 50) ]
      [ time 17 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 32 (of 50) ]
      [ time 18 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 31 (of 50) ]
      [ time 19 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 30 (of 50) ]
      [ time 20 ] JOB BEGINS by JOB 1
      [ time 20 ] Run JOB 1 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 4 (of 5) ]
      [ time 21 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 3 (of 5) ]
      [ time 22 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 2 (of 5) ]
      [ time 23 ] Run JOB 1 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 1 (of 5) ]
      [ time 24 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 0 (of 5) ]
      [ time 25 ] FINISHED JOB 1
      [ time 25 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 29 (of 50) ]
      [ time 26 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 28 (of 50) ]
      [ time 27 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 27 (of 50) ]
      [ time 28 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 26 (of 50) ]
      [ time 29 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 25 (of 50) ]
      [ time 30 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 24 (of 50) ]
      [ time 31 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 23 (of 50) ]
      [ time 32 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 22 (of 50) ]
      [ time 33 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 21 (of 50) ]
      [ time 34 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 20 (of 50) ]
      [ time 35 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 19 (of 50) ]
      [ time 36 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 18 (of 50) ]
      [ time 37 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 17 (of 50) ]
      [ time 38 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 16 (of 50) ]
      [ time 39 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 15 (of 50) ]
      [ time 40 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 14 (of 50) ]
      [ time 41 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 13 (of 50) ]
      [ time 42 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 12 (of 50) ]
      [ time 43 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 11 (of 50) ]
      [ time 44 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 10 (of 50) ]
      [ time 45 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 9 (of 50) ]
      [ time 46 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 8 (of 50) ]
      [ time 47 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 7 (of 50) ]
      [ time 48 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 6 (of 50) ]
      [ time 49 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 5 (of 50) ]
      [ time 50 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 4 (of 50) ]
      [ time 51 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 3 (of 50) ]
      [ time 52 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 2 (of 50) ]
      [ time 53 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 1 (of 50) ]
      [ time 54 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 0 (of 50) ]
      [ time 55 ] FINISHED JOB 0
      
      Final statistics:
        Job  0: startTime   0 - response   0 - turnaround  55
        Job  1: startTime  20 - response   0 - turnaround   5
      
        Avg  1: startTime n/a - response 0.00 - turnaround 30.00
      ```

    - 1 Long job running first and then one intermittently.

      ```bash
       python3 mlfq.py -l 0,50,0:20,5,1 -c -B 0 -S -Q 2,2,3,3,3
      Here is the list of inputs:
      OPTIONS jobs 2
      OPTIONS queues 5
      OPTIONS allotments for queue  4 is   1
      OPTIONS quantum length for queue  4 is   2
      OPTIONS allotments for queue  3 is   1
      OPTIONS quantum length for queue  3 is   2
      OPTIONS allotments for queue  2 is   1
      OPTIONS quantum length for queue  2 is   3
      OPTIONS allotments for queue  1 is   1
      OPTIONS quantum length for queue  1 is   3
      OPTIONS allotments for queue  0 is   1
      OPTIONS quantum length for queue  0 is   3
      OPTIONS boost 0
      OPTIONS ioTime 5
      OPTIONS stayAfterIO True
      OPTIONS iobump False
      
      
      For each job, three defining characteristics are given:
        startTime : at what time does the job enter the system
        runTime   : the total CPU time needed by the job to finish
        ioFreq    : every ioFreq time units, the job issues an I/O
                    (the I/O takes ioTime units to complete)
      
      Job List:
        Job  0: startTime   0 - runTime  50 - ioFreq   0
        Job  1: startTime  20 - runTime   5 - ioFreq   1
      
      
      Execution Trace:
      
      [ time 0 ] JOB BEGINS by JOB 0
      [ time 0 ] Run JOB 0 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 49 (of 50) ]
      [ time 1 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 48 (of 50) ]
      [ time 2 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 47 (of 50) ]
      [ time 3 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 46 (of 50) ]
      [ time 4 ] Run JOB 0 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 45 (of 50) ]
      [ time 5 ] Run JOB 0 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 44 (of 50) ]
      [ time 6 ] Run JOB 0 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 43 (of 50) ]
      [ time 7 ] Run JOB 0 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 42 (of 50) ]
      [ time 8 ] Run JOB 0 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 41 (of 50) ]
      [ time 9 ] Run JOB 0 at PRIORITY 1 [ TICKS 0 ALLOT 1 TIME 40 (of 50) ]
      [ time 10 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 39 (of 50) ]
      [ time 11 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 38 (of 50) ]
      [ time 12 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 37 (of 50) ]
      [ time 13 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 36 (of 50) ]
      [ time 14 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 35 (of 50) ]
      [ time 15 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 34 (of 50) ]
      [ time 16 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 33 (of 50) ]
      [ time 17 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 32 (of 50) ]
      [ time 18 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 31 (of 50) ]
      [ time 19 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 30 (of 50) ]
      [ time 20 ] JOB BEGINS by JOB 1
      [ time 20 ] Run JOB 1 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 4 (of 5) ]
      [ time 21 ] IO_START by JOB 1
      IO DONE
      [ time 21 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 29 (of 50) ]
      [ time 22 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 28 (of 50) ]
      [ time 23 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 27 (of 50) ]
      [ time 24 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 26 (of 50) ]
      [ time 25 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 25 (of 50) ]
      [ time 26 ] IO_DONE by JOB 1
      [ time 26 ] Run JOB 1 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 3 (of 5) ]
      [ time 27 ] IO_START by JOB 1
      IO DONE
      [ time 27 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 24 (of 50) ]
      [ time 28 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 23 (of 50) ]
      [ time 29 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 22 (of 50) ]
      [ time 30 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 21 (of 50) ]
      [ time 31 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 20 (of 50) ]
      [ time 32 ] IO_DONE by JOB 1
      [ time 32 ] Run JOB 1 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 2 (of 5) ]
      [ time 33 ] IO_START by JOB 1
      IO DONE
      [ time 33 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 19 (of 50) ]
      [ time 34 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 18 (of 50) ]
      [ time 35 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 17 (of 50) ]
      [ time 36 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 16 (of 50) ]
      [ time 37 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 15 (of 50) ]
      [ time 38 ] IO_DONE by JOB 1
      [ time 38 ] Run JOB 1 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 1 (of 5) ]
      [ time 39 ] IO_START by JOB 1
      IO DONE
      [ time 39 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 14 (of 50) ]
      [ time 40 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 13 (of 50) ]
      [ time 41 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 12 (of 50) ]
      [ time 42 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 11 (of 50) ]
      [ time 43 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 10 (of 50) ]
      [ time 44 ] IO_DONE by JOB 1
      [ time 44 ] Run JOB 1 at PRIORITY 4 [ TICKS 1 ALLOT 1 TIME 0 (of 5) ]
      [ time 45 ] FINISHED JOB 1
      [ time 45 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 9 (of 50) ]
      [ time 46 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 8 (of 50) ]
      [ time 47 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 7 (of 50) ]
      [ time 48 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 6 (of 50) ]
      [ time 49 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 5 (of 50) ]
      [ time 50 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 4 (of 50) ]
      [ time 51 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 3 (of 50) ]
      [ time 52 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 2 (of 50) ]
      [ time 53 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 1 (of 50) ]
      [ time 54 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 0 (of 50) ]
      [ time 55 ] FINISHED JOB 0
      
      Final statistics:
        Job  0: startTime   0 - response   0 - turnaround  55
        Job  1: startTime  20 - response   0 - turnaround  25
      
        Avg  1: startTime n/a - response 0.00 - turnaround 40.00
      ```

  - Figure 8.4 - Long Job x Intermittently Job with and without boost.

    - Without boost

      ```bash
       python3 mlfq.py -l 0,50,0:20,50,4 -c -B 0 -S  -Q 1,2,3,4,5 -i 1
      Here is the list of inputs:
      OPTIONS jobs 2
      OPTIONS queues 5
      OPTIONS allotments for queue  4 is   1
      OPTIONS quantum length for queue  4 is   1
      OPTIONS allotments for queue  3 is   1
      OPTIONS quantum length for queue  3 is   2
      OPTIONS allotments for queue  2 is   1
      OPTIONS quantum length for queue  2 is   3
      OPTIONS allotments for queue  1 is   1
      OPTIONS quantum length for queue  1 is   4
      OPTIONS allotments for queue  0 is   1
      OPTIONS quantum length for queue  0 is   5
      OPTIONS boost 0
      OPTIONS ioTime 1
      OPTIONS stayAfterIO True
      OPTIONS iobump False
      
      
      For each job, three defining characteristics are given:
        startTime : at what time does the job enter the system
        runTime   : the total CPU time needed by the job to finish
        ioFreq    : every ioFreq time units, the job issues an I/O
                    (the I/O takes ioTime units to complete)
      
      Job List:
        Job  0: startTime   0 - runTime  50 - ioFreq   0
        Job  1: startTime  20 - runTime  50 - ioFreq   4
      
      
      Execution Trace:
      
      [ time 0 ] JOB BEGINS by JOB 0
      [ time 0 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 49 (of 50) ]
      [ time 1 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 48 (of 50) ]
      [ time 2 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 47 (of 50) ]
      [ time 3 ] Run JOB 0 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 46 (of 50) ]
      [ time 4 ] Run JOB 0 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 45 (of 50) ]
      [ time 5 ] Run JOB 0 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 44 (of 50) ]
      [ time 6 ] Run JOB 0 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 43 (of 50) ]
      [ time 7 ] Run JOB 0 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 42 (of 50) ]
      [ time 8 ] Run JOB 0 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 41 (of 50) ]
      [ time 9 ] Run JOB 0 at PRIORITY 1 [ TICKS 0 ALLOT 1 TIME 40 (of 50) ]
      [ time 10 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 39 (of 50) ]
      [ time 11 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 38 (of 50) ]
      [ time 12 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 37 (of 50) ]
      [ time 13 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 36 (of 50) ]
      [ time 14 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 35 (of 50) ]
      [ time 15 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 34 (of 50) ]
      [ time 16 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 33 (of 50) ]
      [ time 17 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 32 (of 50) ]
      [ time 18 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 31 (of 50) ]
      [ time 19 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 30 (of 50) ]
      [ time 20 ] JOB BEGINS by JOB 1
      [ time 20 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 49 (of 50) ]
      [ time 21 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 48 (of 50) ]
      [ time 22 ] Run JOB 1 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 47 (of 50) ]
      [ time 23 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 46 (of 50) ]
      [ time 24 ] IO_START by JOB 1
      IO DONE
      [ time 24 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 29 (of 50) ]
      [ time 25 ] IO_DONE by JOB 1
      [ time 25 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 45 (of 50) ]
      [ time 26 ] Run JOB 1 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 44 (of 50) ]
      [ time 27 ] Run JOB 1 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 43 (of 50) ]
      [ time 28 ] Run JOB 1 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 42 (of 50) ]
      [ time 29 ] IO_START by JOB 1
      IO DONE
      [ time 29 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 28 (of 50) ]
      [ time 30 ] IO_DONE by JOB 1
      [ time 30 ] Run JOB 1 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 41 (of 50) ]
      [ time 31 ] Run JOB 1 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 40 (of 50) ]
      [ time 32 ] Run JOB 1 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 39 (of 50) ]
      [ time 33 ] Run JOB 1 at PRIORITY 1 [ TICKS 0 ALLOT 1 TIME 38 (of 50) ]
      [ time 34 ] IO_START by JOB 1
      IO DONE
      [ time 34 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 27 (of 50) ]
      [ time 35 ] IO_DONE by JOB 1
      [ time 35 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 26 (of 50) ]
      [ time 36 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 25 (of 50) ]
      [ time 37 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 37 (of 50) ]
      [ time 38 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 36 (of 50) ]
      [ time 39 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 35 (of 50) ]
      [ time 40 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 34 (of 50) ]
      [ time 41 ] IO_START by JOB 1
      IO DONE
      [ time 41 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 24 (of 50) ]
      [ time 42 ] IO_DONE by JOB 1
      [ time 42 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 23 (of 50) ]
      [ time 43 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 22 (of 50) ]
      [ time 44 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 21 (of 50) ]
      [ time 45 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 20 (of 50) ]
      [ time 46 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 33 (of 50) ]
      [ time 47 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 32 (of 50) ]
      [ time 48 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 31 (of 50) ]
      [ time 49 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 30 (of 50) ]
      [ time 50 ] IO_START by JOB 1
      IO DONE
      [ time 50 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 19 (of 50) ]
      [ time 51 ] IO_DONE by JOB 1
      [ time 51 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 18 (of 50) ]
      [ time 52 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 17 (of 50) ]
      [ time 53 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 16 (of 50) ]
      [ time 54 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 15 (of 50) ]
      [ time 55 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 29 (of 50) ]
      [ time 56 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 28 (of 50) ]
      [ time 57 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 27 (of 50) ]
      [ time 58 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 26 (of 50) ]
      [ time 59 ] IO_START by JOB 1
      IO DONE
      [ time 59 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 14 (of 50) ]
      [ time 60 ] IO_DONE by JOB 1
      [ time 60 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 13 (of 50) ]
      [ time 61 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 12 (of 50) ]
      [ time 62 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 11 (of 50) ]
      [ time 63 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 10 (of 50) ]
      [ time 64 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 25 (of 50) ]
      [ time 65 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 24 (of 50) ]
      [ time 66 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 23 (of 50) ]
      [ time 67 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 22 (of 50) ]
      [ time 68 ] IO_START by JOB 1
      IO DONE
      [ time 68 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 9 (of 50) ]
      [ time 69 ] IO_DONE by JOB 1
      [ time 69 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 8 (of 50) ]
      [ time 70 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 7 (of 50) ]
      [ time 71 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 6 (of 50) ]
      [ time 72 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 5 (of 50) ]
      [ time 73 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 21 (of 50) ]
      [ time 74 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 20 (of 50) ]
      [ time 75 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 19 (of 50) ]
      [ time 76 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 18 (of 50) ]
      [ time 77 ] IO_START by JOB 1
      IO DONE
      [ time 77 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 4 (of 50) ]
      [ time 78 ] IO_DONE by JOB 1
      [ time 78 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 3 (of 50) ]
      [ time 79 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 2 (of 50) ]
      [ time 80 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 1 (of 50) ]
      [ time 81 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 0 (of 50) ]
      [ time 82 ] FINISHED JOB 0
      [ time 82 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 17 (of 50) ]
      [ time 83 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 16 (of 50) ]
      [ time 84 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 15 (of 50) ]
      [ time 85 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 14 (of 50) ]
      [ time 86 ] IO_START by JOB 1
      IO DONE
      [ time 86 ] IDLE
      [ time 87 ] IO_DONE by JOB 1
      [ time 87 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 13 (of 50) ]
      [ time 88 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 12 (of 50) ]
      [ time 89 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 11 (of 50) ]
      [ time 90 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 10 (of 50) ]
      [ time 91 ] IO_START by JOB 1
      IO DONE
      [ time 91 ] IDLE
      [ time 92 ] IO_DONE by JOB 1
      [ time 92 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 9 (of 50) ]
      [ time 93 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 8 (of 50) ]
      [ time 94 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 7 (of 50) ]
      [ time 95 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 6 (of 50) ]
      [ time 96 ] IO_START by JOB 1
      IO DONE
      [ time 96 ] IDLE
      [ time 97 ] IO_DONE by JOB 1
      [ time 97 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 5 (of 50) ]
      [ time 98 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 4 (of 50) ]
      [ time 99 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 3 (of 50) ]
      [ time 100 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 2 (of 50) ]
      [ time 101 ] IO_START by JOB 1
      IO DONE
      [ time 101 ] IDLE
      [ time 102 ] IO_DONE by JOB 1
      [ time 102 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 1 (of 50) ]
      [ time 103 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 0 (of 50) ]
      [ time 104 ] FINISHED JOB 1
      
      Final statistics:
        Job  0: startTime   0 - response   0 - turnaround  82
        Job  1: startTime  20 - response   0 - turnaround  84
      
        Avg  1: startTime n/a - response 0.00 - turnaround 83.00
      ```

    - With boost

      ```bash
      python3 mlfq.py -l 0,50,0:20,50,4 -c -B 5 -S  -Q 1,2,3,4,5 -i 1
      Here is the list of inputs:
      OPTIONS jobs 2
      OPTIONS queues 5
      OPTIONS allotments for queue  4 is   1
      OPTIONS quantum length for queue  4 is   1
      OPTIONS allotments for queue  3 is   1
      OPTIONS quantum length for queue  3 is   2
      OPTIONS allotments for queue  2 is   1
      OPTIONS quantum length for queue  2 is   3
      OPTIONS allotments for queue  1 is   1
      OPTIONS quantum length for queue  1 is   4
      OPTIONS allotments for queue  0 is   1
      OPTIONS quantum length for queue  0 is   5
      OPTIONS boost 5
      OPTIONS ioTime 1
      OPTIONS stayAfterIO True
      OPTIONS iobump False
      
      
      For each job, three defining characteristics are given:
        startTime : at what time does the job enter the system
        runTime   : the total CPU time needed by the job to finish
        ioFreq    : every ioFreq time units, the job issues an I/O
                    (the I/O takes ioTime units to complete)
      
      Job List:
        Job  0: startTime   0 - runTime  50 - ioFreq   0
        Job  1: startTime  20 - runTime  50 - ioFreq   4
      
      
      Execution Trace:
      
      [ time 0 ] JOB BEGINS by JOB 0
      [ time 0 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 49 (of 50) ]
      [ time 1 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 48 (of 50) ]
      [ time 2 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 47 (of 50) ]
      [ time 3 ] Run JOB 0 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 46 (of 50) ]
      [ time 4 ] Run JOB 0 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 45 (of 50) ]
      [ time 5 ] BOOST ( every 5 )
      [ time 5 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 44 (of 50) ]
      [ time 6 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 43 (of 50) ]
      [ time 7 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 42 (of 50) ]
      [ time 8 ] Run JOB 0 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 41 (of 50) ]
      [ time 9 ] Run JOB 0 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 40 (of 50) ]
      [ time 10 ] BOOST ( every 5 )
      [ time 10 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 39 (of 50) ]
      [ time 11 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 38 (of 50) ]
      [ time 12 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 37 (of 50) ]
      [ time 13 ] Run JOB 0 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 36 (of 50) ]
      [ time 14 ] Run JOB 0 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 35 (of 50) ]
      [ time 15 ] BOOST ( every 5 )
      [ time 15 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 34 (of 50) ]
      [ time 16 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 33 (of 50) ]
      [ time 17 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 32 (of 50) ]
      [ time 18 ] Run JOB 0 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 31 (of 50) ]
      [ time 19 ] Run JOB 0 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 30 (of 50) ]
      [ time 20 ] BOOST ( every 5 )
      [ time 20 ] JOB BEGINS by JOB 1
      [ time 20 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 29 (of 50) ]
      [ time 21 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 49 (of 50) ]
      [ time 22 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 28 (of 50) ]
      [ time 23 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 27 (of 50) ]
      [ time 24 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 48 (of 50) ]
      [ time 25 ] BOOST ( every 5 )
      [ time 25 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 26 (of 50) ]
      [ time 26 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 47 (of 50) ]
      [ time 27 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 25 (of 50) ]
      [ time 28 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 24 (of 50) ]
      [ time 29 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 46 (of 50) ]
      [ time 30 ] IO_START by JOB 1
      IO DONE
      [ time 30 ] BOOST ( every 5 )
      [ time 30 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 23 (of 50) ]
      [ time 31 ] IO_DONE by JOB 1
      [ time 31 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 45 (of 50) ]
      [ time 32 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 22 (of 50) ]
      [ time 33 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 21 (of 50) ]
      [ time 34 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 44 (of 50) ]
      [ time 35 ] BOOST ( every 5 )
      [ time 35 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 20 (of 50) ]
      [ time 36 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 43 (of 50) ]
      [ time 37 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 19 (of 50) ]
      [ time 38 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 18 (of 50) ]
      [ time 39 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 42 (of 50) ]
      [ time 40 ] IO_START by JOB 1
      IO DONE
      [ time 40 ] BOOST ( every 5 )
      [ time 40 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 17 (of 50) ]
      [ time 41 ] IO_DONE by JOB 1
      [ time 41 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 41 (of 50) ]
      [ time 42 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 16 (of 50) ]
      [ time 43 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 15 (of 50) ]
      [ time 44 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 40 (of 50) ]
      [ time 45 ] BOOST ( every 5 )
      [ time 45 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 14 (of 50) ]
      [ time 46 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 39 (of 50) ]
      [ time 47 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 13 (of 50) ]
      [ time 48 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 12 (of 50) ]
      [ time 49 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 38 (of 50) ]
      [ time 50 ] IO_START by JOB 1
      IO DONE
      [ time 50 ] BOOST ( every 5 )
      [ time 50 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 11 (of 50) ]
      [ time 51 ] IO_DONE by JOB 1
      [ time 51 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 37 (of 50) ]
      [ time 52 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 10 (of 50) ]
      [ time 53 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 9 (of 50) ]
      [ time 54 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 36 (of 50) ]
      [ time 55 ] BOOST ( every 5 )
      [ time 55 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 8 (of 50) ]
      [ time 56 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 35 (of 50) ]
      [ time 57 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 7 (of 50) ]
      [ time 58 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 6 (of 50) ]
      [ time 59 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 34 (of 50) ]
      [ time 60 ] IO_START by JOB 1
      IO DONE
      [ time 60 ] BOOST ( every 5 )
      [ time 60 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 5 (of 50) ]
      [ time 61 ] IO_DONE by JOB 1
      [ time 61 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 33 (of 50) ]
      [ time 62 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 4 (of 50) ]
      [ time 63 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 3 (of 50) ]
      [ time 64 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 32 (of 50) ]
      [ time 65 ] BOOST ( every 5 )
      [ time 65 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 2 (of 50) ]
      [ time 66 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 31 (of 50) ]
      [ time 67 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 1 (of 50) ]
      [ time 68 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 0 (of 50) ]
      [ time 69 ] FINISHED JOB 0
      [ time 69 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 30 (of 50) ]
      [ time 70 ] IO_START by JOB 1
      IO DONE
      [ time 70 ] BOOST ( every 5 )
      [ time 70 ] IDLE
      [ time 71 ] IO_DONE by JOB 1
      [ time 71 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 29 (of 50) ]
      [ time 72 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 28 (of 50) ]
      [ time 73 ] Run JOB 1 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 27 (of 50) ]
      [ time 74 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 26 (of 50) ]
      [ time 75 ] IO_START by JOB 1
      IO DONE
      [ time 75 ] BOOST ( every 5 )
      [ time 75 ] IDLE
      [ time 76 ] IO_DONE by JOB 1
      [ time 76 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 25 (of 50) ]
      [ time 77 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 24 (of 50) ]
      [ time 78 ] Run JOB 1 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 23 (of 50) ]
      [ time 79 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 22 (of 50) ]
      [ time 80 ] IO_START by JOB 1
      IO DONE
      [ time 80 ] BOOST ( every 5 )
      [ time 80 ] IDLE
      [ time 81 ] IO_DONE by JOB 1
      [ time 81 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 21 (of 50) ]
      [ time 82 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 20 (of 50) ]
      [ time 83 ] Run JOB 1 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 19 (of 50) ]
      [ time 84 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 18 (of 50) ]
      [ time 85 ] IO_START by JOB 1
      IO DONE
      [ time 85 ] BOOST ( every 5 )
      [ time 85 ] IDLE
      [ time 86 ] IO_DONE by JOB 1
      [ time 86 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 17 (of 50) ]
      [ time 87 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 16 (of 50) ]
      [ time 88 ] Run JOB 1 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 15 (of 50) ]
      [ time 89 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 14 (of 50) ]
      [ time 90 ] IO_START by JOB 1
      IO DONE
      [ time 90 ] BOOST ( every 5 )
      [ time 90 ] IDLE
      [ time 91 ] IO_DONE by JOB 1
      [ time 91 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 13 (of 50) ]
      [ time 92 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 12 (of 50) ]
      [ time 93 ] Run JOB 1 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 11 (of 50) ]
      [ time 94 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 10 (of 50) ]
      [ time 95 ] IO_START by JOB 1
      IO DONE
      [ time 95 ] BOOST ( every 5 )
      [ time 95 ] IDLE
      [ time 96 ] IO_DONE by JOB 1
      [ time 96 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 9 (of 50) ]
      [ time 97 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 8 (of 50) ]
      [ time 98 ] Run JOB 1 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 7 (of 50) ]
      [ time 99 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 6 (of 50) ]
      [ time 100 ] IO_START by JOB 1
      IO DONE
      [ time 100 ] BOOST ( every 5 )
      [ time 100 ] IDLE
      [ time 101 ] IO_DONE by JOB 1
      [ time 101 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 5 (of 50) ]
      [ time 102 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 4 (of 50) ]
      [ time 103 ] Run JOB 1 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 3 (of 50) ]
      [ time 104 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 2 (of 50) ]
      [ time 105 ] IO_START by JOB 1
      IO DONE
      [ time 105 ] BOOST ( every 5 )
      [ time 105 ] IDLE
      [ time 106 ] IO_DONE by JOB 1
      [ time 106 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 1 (of 50) ]
      [ time 107 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 0 (of 50) ]
      [ time 108 ] FINISHED JOB 1
      
      Final statistics:
        Job  0: startTime   0 - response   0 - turnaround  69
        Job  1: startTime  20 - response   1 - turnaround  88
      
        Avg  1: startTime n/a - response 0.50 - turnaround 78.50
      
      ```

    - Comparison:

      ```bash
      Before Boost
      Final statistics:
        Job  0: startTime   0 - response   0 - turnaround  82
        Job  1: startTime  20 - response   0 - turnaround  84
      
        Avg  1: startTime n/a - response 0.00 - turnaround 83.00
      
      With Boost
      Final statistics:
        Job  0: startTime   0 - response   0 - turnaround  69
        Job  1: startTime  20 - response   1 - turnaround  88
      
        Avg  1: startTime n/a - response 0.50 - turnaround 78.50
      ```

    

  - Figure 8.5 - Long Job x Intermittently Job with and without Gaming Tolerance

    - Without tolerance

      ```bash
      python3 mlfq.py -l 0,50,0:20,50,1:20,50,2:20,50,3  -c -B 0 -Q 1,2,3,4,5 -i 1 -S
      Here is the list of inputs:
      OPTIONS jobs 4
      OPTIONS queues 5
      OPTIONS allotments for queue  4 is   1
      OPTIONS quantum length for queue  4 is   1
      OPTIONS allotments for queue  3 is   1
      OPTIONS quantum length for queue  3 is   2
      OPTIONS allotments for queue  2 is   1
      OPTIONS quantum length for queue  2 is   3
      OPTIONS allotments for queue  1 is   1
      OPTIONS quantum length for queue  1 is   4
      OPTIONS allotments for queue  0 is   1
      OPTIONS quantum length for queue  0 is   5
      OPTIONS boost 0
      OPTIONS ioTime 1
      OPTIONS stayAfterIO True
      OPTIONS iobump False
      
      
      For each job, three defining characteristics are given:
        startTime : at what time does the job enter the system
        runTime   : the total CPU time needed by the job to finish
        ioFreq    : every ioFreq time units, the job issues an I/O
                    (the I/O takes ioTime units to complete)
      
      Job List:
        Job  0: startTime   0 - runTime  50 - ioFreq   0
        Job  1: startTime  20 - runTime  50 - ioFreq   1
        Job  2: startTime  20 - runTime  50 - ioFreq   2
        Job  3: startTime  20 - runTime  50 - ioFreq   3
      
      
      Execution Trace:
      
      [ time 0 ] JOB BEGINS by JOB 0
      [ time 0 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 49 (of 50) ]
      [ time 1 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 48 (of 50) ]
      [ time 2 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 47 (of 50) ]
      [ time 3 ] Run JOB 0 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 46 (of 50) ]
      [ time 4 ] Run JOB 0 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 45 (of 50) ]
      [ time 5 ] Run JOB 0 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 44 (of 50) ]
      [ time 6 ] Run JOB 0 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 43 (of 50) ]
      [ time 7 ] Run JOB 0 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 42 (of 50) ]
      [ time 8 ] Run JOB 0 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 41 (of 50) ]
      [ time 9 ] Run JOB 0 at PRIORITY 1 [ TICKS 0 ALLOT 1 TIME 40 (of 50) ]
      [ time 10 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 39 (of 50) ]
      [ time 11 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 38 (of 50) ]
      [ time 12 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 37 (of 50) ]
      [ time 13 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 36 (of 50) ]
      [ time 14 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 35 (of 50) ]
      [ time 15 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 34 (of 50) ]
      [ time 16 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 33 (of 50) ]
      [ time 17 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 32 (of 50) ]
      [ time 18 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 31 (of 50) ]
      [ time 19 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 30 (of 50) ]
      [ time 20 ] JOB BEGINS by JOB 1
      [ time 20 ] JOB BEGINS by JOB 2
      [ time 20 ] JOB BEGINS by JOB 3
      [ time 20 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 49 (of 50) ]
      [ time 21 ] IO_START by JOB 1
      IO DONE
      [ time 21 ] Run JOB 2 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 49 (of 50) ]
      [ time 22 ] IO_DONE by JOB 1
      [ time 22 ] Run JOB 3 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 49 (of 50) ]
      [ time 23 ] Run JOB 2 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 48 (of 50) ]
      [ time 24 ] IO_START by JOB 2
      IO DONE
      [ time 24 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 48 (of 50) ]
      [ time 25 ] IO_START by JOB 1
      IO DONE
      [ time 25 ] IO_DONE by JOB 2
      [ time 25 ] Run JOB 3 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 48 (of 50) ]
      [ time 26 ] IO_DONE by JOB 1
      [ time 26 ] Run JOB 3 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 47 (of 50) ]
      [ time 27 ] IO_START by JOB 3
      IO DONE
      [ time 27 ] Run JOB 2 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 47 (of 50) ]
      [ time 28 ] IO_DONE by JOB 3
      [ time 28 ] Run JOB 2 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 46 (of 50) ]
      [ time 29 ] IO_START by JOB 2
      IO DONE
      [ time 29 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 47 (of 50) ]
      [ time 30 ] IO_START by JOB 1
      IO DONE
      [ time 30 ] IO_DONE by JOB 2
      [ time 30 ] Run JOB 3 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 46 (of 50) ]
      [ time 31 ] IO_DONE by JOB 1
      [ time 31 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 46 (of 50) ]
      [ time 32 ] IO_START by JOB 1
      IO DONE
      [ time 32 ] Run JOB 3 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 45 (of 50) ]
      [ time 33 ] IO_DONE by JOB 1
      [ time 33 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 45 (of 50) ]
      [ time 34 ] IO_START by JOB 1
      IO DONE
      [ time 34 ] Run JOB 3 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 44 (of 50) ]
      [ time 35 ] IO_START by JOB 3
      IO DONE
      [ time 35 ] IO_DONE by JOB 1
      [ time 35 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 44 (of 50) ]
      [ time 36 ] IO_START by JOB 1
      IO DONE
      [ time 36 ] IO_DONE by JOB 3
      [ time 36 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 45 (of 50) ]
      [ time 37 ] IO_DONE by JOB 1
      [ time 37 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 43 (of 50) ]
      [ time 38 ] IO_START by JOB 1
      IO DONE
      [ time 38 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 44 (of 50) ]
      [ time 39 ] IO_START by JOB 2
      IO DONE
      [ time 39 ] IO_DONE by JOB 1
      [ time 39 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 42 (of 50) ]
      [ time 40 ] IO_START by JOB 1
      IO DONE
      [ time 40 ] IO_DONE by JOB 2
      [ time 40 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 43 (of 50) ]
      [ time 41 ] IO_DONE by JOB 1
      [ time 41 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 41 (of 50) ]
      [ time 42 ] IO_START by JOB 1
      IO DONE
      [ time 42 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 42 (of 50) ]
      [ time 43 ] IO_START by JOB 2
      IO DONE
      [ time 43 ] IO_DONE by JOB 1
      [ time 43 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 40 (of 50) ]
      [ time 44 ] IO_START by JOB 1
      IO DONE
      [ time 44 ] IO_DONE by JOB 2
      [ time 44 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 41 (of 50) ]
      [ time 45 ] IO_DONE by JOB 1
      [ time 45 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 39 (of 50) ]
      [ time 46 ] IO_START by JOB 1
      IO DONE
      [ time 46 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 40 (of 50) ]
      [ time 47 ] IO_START by JOB 2
      IO DONE
      [ time 47 ] IO_DONE by JOB 1
      [ time 47 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 38 (of 50) ]
      [ time 48 ] IO_START by JOB 1
      IO DONE
      [ time 48 ] IO_DONE by JOB 2
      [ time 48 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 39 (of 50) ]
      [ time 49 ] IO_DONE by JOB 1
      [ time 49 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 37 (of 50) ]
      [ time 50 ] IO_START by JOB 1
      IO DONE
      [ time 50 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 38 (of 50) ]
      [ time 51 ] IO_START by JOB 2
      IO DONE
      [ time 51 ] IO_DONE by JOB 1
      [ time 51 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 36 (of 50) ]
      [ time 52 ] IO_START by JOB 1
      IO DONE
      [ time 52 ] IO_DONE by JOB 2
      [ time 52 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 37 (of 50) ]
      [ time 53 ] IO_DONE by JOB 1
      [ time 53 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 35 (of 50) ]
      [ time 54 ] IO_START by JOB 1
      IO DONE
      [ time 54 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 36 (of 50) ]
      [ time 55 ] IO_START by JOB 2
      IO DONE
      [ time 55 ] IO_DONE by JOB 1
      [ time 55 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 34 (of 50) ]
      [ time 56 ] IO_START by JOB 1
      IO DONE
      [ time 56 ] IO_DONE by JOB 2
      [ time 56 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 35 (of 50) ]
      [ time 57 ] IO_DONE by JOB 1
      [ time 57 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 33 (of 50) ]
      [ time 58 ] IO_START by JOB 1
      IO DONE
      [ time 58 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 34 (of 50) ]
      [ time 59 ] IO_START by JOB 2
      IO DONE
      [ time 59 ] IO_DONE by JOB 1
      [ time 59 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 32 (of 50) ]
      [ time 60 ] IO_START by JOB 1
      IO DONE
      [ time 60 ] IO_DONE by JOB 2
      [ time 60 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 33 (of 50) ]
      [ time 61 ] IO_DONE by JOB 1
      [ time 61 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 31 (of 50) ]
      [ time 62 ] IO_START by JOB 1
      IO DONE
      [ time 62 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 32 (of 50) ]
      [ time 63 ] IO_START by JOB 2
      IO DONE
      [ time 63 ] IO_DONE by JOB 1
      [ time 63 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 30 (of 50) ]
      [ time 64 ] IO_START by JOB 1
      IO DONE
      [ time 64 ] IO_DONE by JOB 2
      [ time 64 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 31 (of 50) ]
      [ time 65 ] IO_DONE by JOB 1
      [ time 65 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 29 (of 50) ]
      [ time 66 ] IO_START by JOB 1
      IO DONE
      [ time 66 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 30 (of 50) ]
      [ time 67 ] IO_START by JOB 2
      IO DONE
      [ time 67 ] IO_DONE by JOB 1
      [ time 67 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 28 (of 50) ]
      [ time 68 ] IO_START by JOB 1
      IO DONE
      [ time 68 ] IO_DONE by JOB 2
      [ time 68 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 29 (of 50) ]
      [ time 69 ] IO_DONE by JOB 1
      [ time 69 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 27 (of 50) ]
      [ time 70 ] IO_START by JOB 1
      IO DONE
      [ time 70 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 28 (of 50) ]
      [ time 71 ] IO_START by JOB 2
      IO DONE
      [ time 71 ] IO_DONE by JOB 1
      [ time 71 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 26 (of 50) ]
      [ time 72 ] IO_START by JOB 1
      IO DONE
      [ time 72 ] IO_DONE by JOB 2
      [ time 72 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 27 (of 50) ]
      [ time 73 ] IO_DONE by JOB 1
      [ time 73 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 25 (of 50) ]
      [ time 74 ] IO_START by JOB 1
      IO DONE
      [ time 74 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 26 (of 50) ]
      [ time 75 ] IO_START by JOB 2
      IO DONE
      [ time 75 ] IO_DONE by JOB 1
      [ time 75 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 24 (of 50) ]
      [ time 76 ] IO_START by JOB 1
      IO DONE
      [ time 76 ] IO_DONE by JOB 2
      [ time 76 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 25 (of 50) ]
      [ time 77 ] IO_DONE by JOB 1
      [ time 77 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 23 (of 50) ]
      [ time 78 ] IO_START by JOB 1
      IO DONE
      [ time 78 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 24 (of 50) ]
      [ time 79 ] IO_START by JOB 2
      IO DONE
      [ time 79 ] IO_DONE by JOB 1
      [ time 79 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 22 (of 50) ]
      [ time 80 ] IO_START by JOB 1
      IO DONE
      [ time 80 ] IO_DONE by JOB 2
      [ time 80 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 23 (of 50) ]
      [ time 81 ] IO_DONE by JOB 1
      [ time 81 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 21 (of 50) ]
      [ time 82 ] IO_START by JOB 1
      IO DONE
      [ time 82 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 22 (of 50) ]
      [ time 83 ] IO_START by JOB 2
      IO DONE
      [ time 83 ] IO_DONE by JOB 1
      [ time 83 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 20 (of 50) ]
      [ time 84 ] IO_START by JOB 1
      IO DONE
      [ time 84 ] IO_DONE by JOB 2
      [ time 84 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 21 (of 50) ]
      [ time 85 ] IO_DONE by JOB 1
      [ time 85 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 19 (of 50) ]
      [ time 86 ] IO_START by JOB 1
      IO DONE
      [ time 86 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 20 (of 50) ]
      [ time 87 ] IO_START by JOB 2
      IO DONE
      [ time 87 ] IO_DONE by JOB 1
      [ time 87 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 18 (of 50) ]
      [ time 88 ] IO_START by JOB 1
      IO DONE
      [ time 88 ] IO_DONE by JOB 2
      [ time 88 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 19 (of 50) ]
      [ time 89 ] IO_DONE by JOB 1
      [ time 89 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 17 (of 50) ]
      [ time 90 ] IO_START by JOB 1
      IO DONE
      [ time 90 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 18 (of 50) ]
      [ time 91 ] IO_START by JOB 2
      IO DONE
      [ time 91 ] IO_DONE by JOB 1
      [ time 91 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 16 (of 50) ]
      [ time 92 ] IO_START by JOB 1
      IO DONE
      [ time 92 ] IO_DONE by JOB 2
      [ time 92 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 17 (of 50) ]
      [ time 93 ] IO_DONE by JOB 1
      [ time 93 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 15 (of 50) ]
      [ time 94 ] IO_START by JOB 1
      IO DONE
      [ time 94 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 16 (of 50) ]
      [ time 95 ] IO_START by JOB 2
      IO DONE
      [ time 95 ] IO_DONE by JOB 1
      [ time 95 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 14 (of 50) ]
      [ time 96 ] IO_START by JOB 1
      IO DONE
      [ time 96 ] IO_DONE by JOB 2
      [ time 96 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 15 (of 50) ]
      [ time 97 ] IO_DONE by JOB 1
      [ time 97 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 13 (of 50) ]
      [ time 98 ] IO_START by JOB 1
      IO DONE
      [ time 98 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 14 (of 50) ]
      [ time 99 ] IO_START by JOB 2
      IO DONE
      [ time 99 ] IO_DONE by JOB 1
      [ time 99 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 12 (of 50) ]
      [ time 100 ] IO_START by JOB 1
      IO DONE
      [ time 100 ] IO_DONE by JOB 2
      [ time 100 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 13 (of 50) ]
      [ time 101 ] IO_DONE by JOB 1
      [ time 101 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 11 (of 50) ]
      [ time 102 ] IO_START by JOB 1
      IO DONE
      [ time 102 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 12 (of 50) ]
      [ time 103 ] IO_START by JOB 2
      IO DONE
      [ time 103 ] IO_DONE by JOB 1
      [ time 103 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 10 (of 50) ]
      [ time 104 ] IO_START by JOB 1
      IO DONE
      [ time 104 ] IO_DONE by JOB 2
      [ time 104 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 11 (of 50) ]
      [ time 105 ] IO_DONE by JOB 1
      [ time 105 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 9 (of 50) ]
      [ time 106 ] IO_START by JOB 1
      IO DONE
      [ time 106 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 10 (of 50) ]
      [ time 107 ] IO_START by JOB 2
      IO DONE
      [ time 107 ] IO_DONE by JOB 1
      [ time 107 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 8 (of 50) ]
      [ time 108 ] IO_START by JOB 1
      IO DONE
      [ time 108 ] IO_DONE by JOB 2
      [ time 108 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 9 (of 50) ]
      [ time 109 ] IO_DONE by JOB 1
      [ time 109 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 7 (of 50) ]
      [ time 110 ] IO_START by JOB 1
      IO DONE
      [ time 110 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 8 (of 50) ]
      [ time 111 ] IO_START by JOB 2
      IO DONE
      [ time 111 ] IO_DONE by JOB 1
      [ time 111 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 6 (of 50) ]
      [ time 112 ] IO_START by JOB 1
      IO DONE
      [ time 112 ] IO_DONE by JOB 2
      [ time 112 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 7 (of 50) ]
      [ time 113 ] IO_DONE by JOB 1
      [ time 113 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 5 (of 50) ]
      [ time 114 ] IO_START by JOB 1
      IO DONE
      [ time 114 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 6 (of 50) ]
      [ time 115 ] IO_START by JOB 2
      IO DONE
      [ time 115 ] IO_DONE by JOB 1
      [ time 115 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 4 (of 50) ]
      [ time 116 ] IO_START by JOB 1
      IO DONE
      [ time 116 ] IO_DONE by JOB 2
      [ time 116 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 5 (of 50) ]
      [ time 117 ] IO_DONE by JOB 1
      [ time 117 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 3 (of 50) ]
      [ time 118 ] IO_START by JOB 1
      IO DONE
      [ time 118 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 4 (of 50) ]
      [ time 119 ] IO_START by JOB 2
      IO DONE
      [ time 119 ] IO_DONE by JOB 1
      [ time 119 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 2 (of 50) ]
      [ time 120 ] IO_START by JOB 1
      IO DONE
      [ time 120 ] IO_DONE by JOB 2
      [ time 120 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 3 (of 50) ]
      [ time 121 ] IO_DONE by JOB 1
      [ time 121 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 1 (of 50) ]
      [ time 122 ] IO_START by JOB 1
      IO DONE
      [ time 122 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 2 (of 50) ]
      [ time 123 ] IO_START by JOB 2
      IO DONE
      [ time 123 ] IO_DONE by JOB 1
      [ time 123 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 0 (of 50) ]
      [ time 124 ] FINISHED JOB 1
      [ time 124 ] IO_DONE by JOB 2
      [ time 124 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 1 (of 50) ]
      [ time 125 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 0 (of 50) ]
      [ time 126 ] FINISHED JOB 2
      [ time 126 ] Run JOB 3 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 43 (of 50) ]
      [ time 127 ] Run JOB 3 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 42 (of 50) ]
      [ time 128 ] Run JOB 3 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 41 (of 50) ]
      [ time 129 ] IO_START by JOB 3
      IO DONE
      [ time 129 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 29 (of 50) ]
      [ time 130 ] IO_DONE by JOB 3
      [ time 130 ] Run JOB 3 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 40 (of 50) ]
      [ time 131 ] Run JOB 3 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 39 (of 50) ]
      [ time 132 ] Run JOB 3 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 38 (of 50) ]
      [ time 133 ] IO_START by JOB 3
      IO DONE
      [ time 133 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 28 (of 50) ]
      [ time 134 ] IO_DONE by JOB 3
      [ time 134 ] Run JOB 3 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 37 (of 50) ]
      [ time 135 ] Run JOB 3 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 36 (of 50) ]
      [ time 136 ] Run JOB 3 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 35 (of 50) ]
      [ time 137 ] IO_START by JOB 3
      IO DONE
      [ time 137 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 27 (of 50) ]
      [ time 138 ] IO_DONE by JOB 3
      [ time 138 ] Run JOB 3 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 34 (of 50) ]
      [ time 139 ] Run JOB 3 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 33 (of 50) ]
      [ time 140 ] Run JOB 3 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 32 (of 50) ]
      [ time 141 ] IO_START by JOB 3
      IO DONE
      [ time 141 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 26 (of 50) ]
      [ time 142 ] IO_DONE by JOB 3
      [ time 142 ] Run JOB 3 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 31 (of 50) ]
      [ time 143 ] Run JOB 3 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 30 (of 50) ]
      [ time 144 ] Run JOB 3 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 29 (of 50) ]
      [ time 145 ] IO_START by JOB 3
      IO DONE
      [ time 145 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 25 (of 50) ]
      [ time 146 ] IO_DONE by JOB 3
      [ time 146 ] Run JOB 3 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 28 (of 50) ]
      [ time 147 ] Run JOB 3 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 27 (of 50) ]
      [ time 148 ] Run JOB 3 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 26 (of 50) ]
      [ time 149 ] IO_START by JOB 3
      IO DONE
      [ time 149 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 24 (of 50) ]
      [ time 150 ] IO_DONE by JOB 3
      [ time 150 ] Run JOB 3 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 25 (of 50) ]
      [ time 151 ] Run JOB 3 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 24 (of 50) ]
      [ time 152 ] Run JOB 3 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 23 (of 50) ]
      [ time 153 ] IO_START by JOB 3
      IO DONE
      [ time 153 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 23 (of 50) ]
      [ time 154 ] IO_DONE by JOB 3
      [ time 154 ] Run JOB 3 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 22 (of 50) ]
      [ time 155 ] Run JOB 3 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 21 (of 50) ]
      [ time 156 ] Run JOB 3 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 20 (of 50) ]
      [ time 157 ] IO_START by JOB 3
      IO DONE
      [ time 157 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 22 (of 50) ]
      [ time 158 ] IO_DONE by JOB 3
      [ time 158 ] Run JOB 3 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 19 (of 50) ]
      [ time 159 ] Run JOB 3 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 18 (of 50) ]
      [ time 160 ] Run JOB 3 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 17 (of 50) ]
      [ time 161 ] IO_START by JOB 3
      IO DONE
      [ time 161 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 21 (of 50) ]
      [ time 162 ] IO_DONE by JOB 3
      [ time 162 ] Run JOB 3 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 16 (of 50) ]
      [ time 163 ] Run JOB 3 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 15 (of 50) ]
      [ time 164 ] Run JOB 3 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 14 (of 50) ]
      [ time 165 ] IO_START by JOB 3
      IO DONE
      [ time 165 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 20 (of 50) ]
      [ time 166 ] IO_DONE by JOB 3
      [ time 166 ] Run JOB 3 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 13 (of 50) ]
      [ time 167 ] Run JOB 3 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 12 (of 50) ]
      [ time 168 ] Run JOB 3 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 11 (of 50) ]
      [ time 169 ] IO_START by JOB 3
      IO DONE
      [ time 169 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 19 (of 50) ]
      [ time 170 ] IO_DONE by JOB 3
      [ time 170 ] Run JOB 3 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 10 (of 50) ]
      [ time 171 ] Run JOB 3 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 9 (of 50) ]
      [ time 172 ] Run JOB 3 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 8 (of 50) ]
      [ time 173 ] IO_START by JOB 3
      IO DONE
      [ time 173 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 18 (of 50) ]
      [ time 174 ] IO_DONE by JOB 3
      [ time 174 ] Run JOB 3 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 7 (of 50) ]
      [ time 175 ] Run JOB 3 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 6 (of 50) ]
      [ time 176 ] Run JOB 3 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 5 (of 50) ]
      [ time 177 ] IO_START by JOB 3
      IO DONE
      [ time 177 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 17 (of 50) ]
      [ time 178 ] IO_DONE by JOB 3
      [ time 178 ] Run JOB 3 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 4 (of 50) ]
      [ time 179 ] Run JOB 3 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 3 (of 50) ]
      [ time 180 ] Run JOB 3 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 2 (of 50) ]
      [ time 181 ] IO_START by JOB 3
      IO DONE
      [ time 181 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 16 (of 50) ]
      [ time 182 ] IO_DONE by JOB 3
      [ time 182 ] Run JOB 3 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 1 (of 50) ]
      [ time 183 ] Run JOB 3 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 0 (of 50) ]
      [ time 184 ] FINISHED JOB 3
      [ time 184 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 15 (of 50) ]
      [ time 185 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 14 (of 50) ]
      [ time 186 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 13 (of 50) ]
      [ time 187 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 12 (of 50) ]
      [ time 188 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 11 (of 50) ]
      [ time 189 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 10 (of 50) ]
      [ time 190 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 9 (of 50) ]
      [ time 191 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 8 (of 50) ]
      [ time 192 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 7 (of 50) ]
      [ time 193 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 6 (of 50) ]
      [ time 194 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 5 (of 50) ]
      [ time 195 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 4 (of 50) ]
      [ time 196 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 3 (of 50) ]
      [ time 197 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 2 (of 50) ]
      [ time 198 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 1 (of 50) ]
      [ time 199 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 0 (of 50) ]
      [ time 200 ] FINISHED JOB 0
      
      Final statistics:
        Job  0: startTime   0 - response   0 - turnaround 200
        Job  1: startTime  20 - response   0 - turnaround 104
        Job  2: startTime  20 - response   1 - turnaround 106
        Job  3: startTime  20 - response   2 - turnaround 164
      
        Avg  3: startTime n/a - response 0.75 - turnaround 143.50
      ```

      

    - With tolerance

      ```bash
      python3 mlfq.py -l 0,50,0:20,50,1:20,50,2:20,50,3  -c -B 0 -Q 1,2,3,4,5 -i 1
      Here is the list of inputs:
      OPTIONS jobs 4
      OPTIONS queues 5
      OPTIONS allotments for queue  4 is   1
      OPTIONS quantum length for queue  4 is   1
      OPTIONS allotments for queue  3 is   1
      OPTIONS quantum length for queue  3 is   2
      OPTIONS allotments for queue  2 is   1
      OPTIONS quantum length for queue  2 is   3
      OPTIONS allotments for queue  1 is   1
      OPTIONS quantum length for queue  1 is   4
      OPTIONS allotments for queue  0 is   1
      OPTIONS quantum length for queue  0 is   5
      OPTIONS boost 0
      OPTIONS ioTime 1
      OPTIONS stayAfterIO False
      OPTIONS iobump False
      
      
      For each job, three defining characteristics are given:
        startTime : at what time does the job enter the system
        runTime   : the total CPU time needed by the job to finish
        ioFreq    : every ioFreq time units, the job issues an I/O
                    (the I/O takes ioTime units to complete)
      
      Job List:
        Job  0: startTime   0 - runTime  50 - ioFreq   0
        Job  1: startTime  20 - runTime  50 - ioFreq   1
        Job  2: startTime  20 - runTime  50 - ioFreq   2
        Job  3: startTime  20 - runTime  50 - ioFreq   3
      
      
      Execution Trace:
      
      [ time 0 ] JOB BEGINS by JOB 0
      [ time 0 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 49 (of 50) ]
      [ time 1 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 48 (of 50) ]
      [ time 2 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 47 (of 50) ]
      [ time 3 ] Run JOB 0 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 46 (of 50) ]
      [ time 4 ] Run JOB 0 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 45 (of 50) ]
      [ time 5 ] Run JOB 0 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 44 (of 50) ]
      [ time 6 ] Run JOB 0 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 43 (of 50) ]
      [ time 7 ] Run JOB 0 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 42 (of 50) ]
      [ time 8 ] Run JOB 0 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 41 (of 50) ]
      [ time 9 ] Run JOB 0 at PRIORITY 1 [ TICKS 0 ALLOT 1 TIME 40 (of 50) ]
      [ time 10 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 39 (of 50) ]
      [ time 11 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 38 (of 50) ]
      [ time 12 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 37 (of 50) ]
      [ time 13 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 36 (of 50) ]
      [ time 14 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 35 (of 50) ]
      [ time 15 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 34 (of 50) ]
      [ time 16 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 33 (of 50) ]
      [ time 17 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 32 (of 50) ]
      [ time 18 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 31 (of 50) ]
      [ time 19 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 30 (of 50) ]
      [ time 20 ] JOB BEGINS by JOB 1
      [ time 20 ] JOB BEGINS by JOB 2
      [ time 20 ] JOB BEGINS by JOB 3
      [ time 20 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 49 (of 50) ]
      [ time 21 ] IO_START by JOB 1
      IO DONE
      [ time 21 ] Run JOB 2 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 49 (of 50) ]
      [ time 22 ] IO_DONE by JOB 1
      [ time 22 ] Run JOB 3 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 49 (of 50) ]
      [ time 23 ] Run JOB 2 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 48 (of 50) ]
      [ time 24 ] IO_START by JOB 2
      IO DONE
      [ time 24 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 48 (of 50) ]
      [ time 25 ] IO_START by JOB 1
      IO DONE
      [ time 25 ] IO_DONE by JOB 2
      [ time 25 ] Run JOB 3 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 48 (of 50) ]
      [ time 26 ] IO_DONE by JOB 1
      [ time 26 ] Run JOB 3 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 47 (of 50) ]
      [ time 27 ] IO_START by JOB 3
      IO DONE
      [ time 27 ] Run JOB 2 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 47 (of 50) ]
      [ time 28 ] IO_DONE by JOB 3
      [ time 28 ] Run JOB 1 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 47 (of 50) ]
      [ time 29 ] IO_START by JOB 1
      IO DONE
      [ time 29 ] Run JOB 2 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 46 (of 50) ]
      [ time 30 ] IO_START by JOB 2
      IO DONE
      [ time 30 ] IO_DONE by JOB 1
      [ time 30 ] Run JOB 3 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 46 (of 50) ]
      [ time 31 ] IO_DONE by JOB 2
      [ time 31 ] Run JOB 3 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 45 (of 50) ]
      [ time 32 ] Run JOB 3 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 44 (of 50) ]
      [ time 33 ] IO_START by JOB 3
      IO DONE
      [ time 33 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 46 (of 50) ]
      [ time 34 ] IO_START by JOB 1
      IO DONE
      [ time 34 ] IO_DONE by JOB 3
      [ time 34 ] Run JOB 2 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 45 (of 50) ]
      [ time 35 ] IO_DONE by JOB 1
      [ time 35 ] Run JOB 2 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 44 (of 50) ]
      [ time 36 ] IO_START by JOB 2
      IO DONE
      [ time 36 ] Run JOB 1 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 45 (of 50) ]
      [ time 37 ] IO_START by JOB 1
      IO DONE
      [ time 37 ] IO_DONE by JOB 2
      [ time 37 ] Run JOB 3 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 43 (of 50) ]
      [ time 38 ] IO_DONE by JOB 1
      [ time 38 ] Run JOB 1 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 44 (of 50) ]
      [ time 39 ] IO_START by JOB 1
      IO DONE
      [ time 39 ] Run JOB 3 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 42 (of 50) ]
      [ time 40 ] IO_DONE by JOB 1
      [ time 40 ] Run JOB 3 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 41 (of 50) ]
      [ time 41 ] IO_START by JOB 3
      IO DONE
      [ time 41 ] Run JOB 2 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 43 (of 50) ]
      [ time 42 ] IO_DONE by JOB 3
      [ time 42 ] Run JOB 2 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 42 (of 50) ]
      [ time 43 ] IO_START by JOB 2
      IO DONE
      [ time 43 ] Run JOB 1 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 43 (of 50) ]
      [ time 44 ] IO_START by JOB 1
      IO DONE
      [ time 44 ] IO_DONE by JOB 2
      [ time 44 ] Run JOB 3 at PRIORITY 1 [ TICKS 0 ALLOT 1 TIME 40 (of 50) ]
      [ time 45 ] IO_DONE by JOB 1
      [ time 45 ] Run JOB 2 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 41 (of 50) ]
      [ time 46 ] Run JOB 2 at PRIORITY 1 [ TICKS 0 ALLOT 1 TIME 40 (of 50) ]
      [ time 47 ] IO_START by JOB 2
      IO DONE
      [ time 47 ] Run JOB 1 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 42 (of 50) ]
      [ time 48 ] IO_START by JOB 1
      IO DONE
      [ time 48 ] IO_DONE by JOB 2
      [ time 48 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 29 (of 50) ]
      [ time 49 ] IO_DONE by JOB 1
      [ time 49 ] Run JOB 1 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 41 (of 50) ]
      [ time 50 ] IO_START by JOB 1
      IO DONE
      [ time 50 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 28 (of 50) ]
      [ time 51 ] IO_DONE by JOB 1
      [ time 51 ] Run JOB 1 at PRIORITY 1 [ TICKS 0 ALLOT 1 TIME 40 (of 50) ]
      [ time 52 ] IO_START by JOB 1
      IO DONE
      [ time 52 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 27 (of 50) ]
      [ time 53 ] IO_DONE by JOB 1
      [ time 53 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 26 (of 50) ]
      [ time 54 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 25 (of 50) ]
      [ time 55 ] Run JOB 3 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 39 (of 50) ]
      [ time 56 ] Run JOB 3 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 38 (of 50) ]
      [ time 57 ] IO_START by JOB 3
      IO DONE
      [ time 57 ] Run JOB 2 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 39 (of 50) ]
      [ time 58 ] IO_DONE by JOB 3
      [ time 58 ] Run JOB 2 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 38 (of 50) ]
      [ time 59 ] IO_START by JOB 2
      IO DONE
      [ time 59 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 39 (of 50) ]
      [ time 60 ] IO_START by JOB 1
      IO DONE
      [ time 60 ] IO_DONE by JOB 2
      [ time 60 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 24 (of 50) ]
      [ time 61 ] IO_DONE by JOB 1
      [ time 61 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 23 (of 50) ]
      [ time 62 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 22 (of 50) ]
      [ time 63 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 21 (of 50) ]
      [ time 64 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 20 (of 50) ]
      [ time 65 ] Run JOB 3 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 37 (of 50) ]
      [ time 66 ] Run JOB 3 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 36 (of 50) ]
      [ time 67 ] Run JOB 3 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 35 (of 50) ]
      [ time 68 ] IO_START by JOB 3
      IO DONE
      [ time 68 ] Run JOB 2 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 37 (of 50) ]
      [ time 69 ] IO_DONE by JOB 3
      [ time 69 ] Run JOB 2 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 36 (of 50) ]
      [ time 70 ] IO_START by JOB 2
      IO DONE
      [ time 70 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 38 (of 50) ]
      [ time 71 ] IO_START by JOB 1
      IO DONE
      [ time 71 ] IO_DONE by JOB 2
      [ time 71 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 19 (of 50) ]
      [ time 72 ] IO_DONE by JOB 1
      [ time 72 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 18 (of 50) ]
      [ time 73 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 17 (of 50) ]
      [ time 74 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 16 (of 50) ]
      [ time 75 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 15 (of 50) ]
      [ time 76 ] Run JOB 3 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 34 (of 50) ]
      [ time 77 ] Run JOB 3 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 33 (of 50) ]
      [ time 78 ] Run JOB 3 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 32 (of 50) ]
      [ time 79 ] IO_START by JOB 3
      IO DONE
      [ time 79 ] Run JOB 2 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 35 (of 50) ]
      [ time 80 ] IO_DONE by JOB 3
      [ time 80 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 37 (of 50) ]
      [ time 81 ] IO_START by JOB 1
      IO DONE
      [ time 81 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 14 (of 50) ]
      [ time 82 ] IO_DONE by JOB 1
      [ time 82 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 13 (of 50) ]
      [ time 83 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 12 (of 50) ]
      [ time 84 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 11 (of 50) ]
      [ time 85 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 10 (of 50) ]
      [ time 86 ] Run JOB 2 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 34 (of 50) ]
      [ time 87 ] IO_START by JOB 2
      IO DONE
      [ time 87 ] Run JOB 3 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 31 (of 50) ]
      [ time 88 ] IO_DONE by JOB 2
      [ time 88 ] Run JOB 3 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 30 (of 50) ]
      [ time 89 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 36 (of 50) ]
      [ time 90 ] IO_START by JOB 1
      IO DONE
      [ time 90 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 9 (of 50) ]
      [ time 91 ] IO_DONE by JOB 1
      [ time 91 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 8 (of 50) ]
      [ time 92 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 7 (of 50) ]
      [ time 93 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 6 (of 50) ]
      [ time 94 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 5 (of 50) ]
      [ time 95 ] Run JOB 2 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 33 (of 50) ]
      [ time 96 ] Run JOB 2 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 32 (of 50) ]
      [ time 97 ] IO_START by JOB 2
      IO DONE
      [ time 97 ] Run JOB 3 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 29 (of 50) ]
      [ time 98 ] IO_START by JOB 3
      IO DONE
      [ time 98 ] IO_DONE by JOB 2
      [ time 98 ] Run JOB 1 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 35 (of 50) ]
      [ time 99 ] IO_START by JOB 1
      IO DONE
      [ time 99 ] IO_DONE by JOB 3
      [ time 99 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 4 (of 50) ]
      [ time 100 ] IO_DONE by JOB 1
      [ time 100 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 3 (of 50) ]
      [ time 101 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 2 (of 50) ]
      [ time 102 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 1 (of 50) ]
      [ time 103 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 0 (of 50) ]
      [ time 104 ] FINISHED JOB 0
      [ time 104 ] Run JOB 2 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 31 (of 50) ]
      [ time 105 ] Run JOB 2 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 30 (of 50) ]
      [ time 106 ] IO_START by JOB 2
      IO DONE
      [ time 106 ] Run JOB 3 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 28 (of 50) ]
      [ time 107 ] IO_DONE by JOB 2
      [ time 107 ] Run JOB 3 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 27 (of 50) ]
      [ time 108 ] Run JOB 3 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 26 (of 50) ]
      [ time 109 ] IO_START by JOB 3
      IO DONE
      [ time 109 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 34 (of 50) ]
      [ time 110 ] IO_START by JOB 1
      IO DONE
      [ time 110 ] IO_DONE by JOB 3
      [ time 110 ] Run JOB 2 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 29 (of 50) ]
      [ time 111 ] IO_DONE by JOB 1
      [ time 111 ] Run JOB 2 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 28 (of 50) ]
      [ time 112 ] IO_START by JOB 2
      IO DONE
      [ time 112 ] Run JOB 3 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 25 (of 50) ]
      [ time 113 ] IO_DONE by JOB 2
      [ time 113 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 33 (of 50) ]
      [ time 114 ] IO_START by JOB 1
      IO DONE
      [ time 114 ] Run JOB 3 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 24 (of 50) ]
      [ time 115 ] IO_DONE by JOB 1
      [ time 115 ] Run JOB 3 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 23 (of 50) ]
      [ time 116 ] IO_START by JOB 3
      IO DONE
      [ time 116 ] Run JOB 2 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 27 (of 50) ]
      [ time 117 ] IO_DONE by JOB 3
      [ time 117 ] Run JOB 2 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 26 (of 50) ]
      [ time 118 ] IO_START by JOB 2
      IO DONE
      [ time 118 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 32 (of 50) ]
      [ time 119 ] IO_START by JOB 1
      IO DONE
      [ time 119 ] IO_DONE by JOB 2
      [ time 119 ] Run JOB 3 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 22 (of 50) ]
      [ time 120 ] IO_DONE by JOB 1
      [ time 120 ] Run JOB 3 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 21 (of 50) ]
      [ time 121 ] Run JOB 3 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 20 (of 50) ]
      [ time 122 ] IO_START by JOB 3
      IO DONE
      [ time 122 ] Run JOB 2 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 25 (of 50) ]
      [ time 123 ] IO_DONE by JOB 3
      [ time 123 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 31 (of 50) ]
      [ time 124 ] IO_START by JOB 1
      IO DONE
      [ time 124 ] Run JOB 2 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 24 (of 50) ]
      [ time 125 ] IO_START by JOB 2
      IO DONE
      [ time 125 ] IO_DONE by JOB 1
      [ time 125 ] Run JOB 3 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 19 (of 50) ]
      [ time 126 ] IO_DONE by JOB 2
      [ time 126 ] Run JOB 3 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 18 (of 50) ]
      [ time 127 ] Run JOB 3 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 17 (of 50) ]
      [ time 128 ] IO_START by JOB 3
      IO DONE
      [ time 128 ] Run JOB 1 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 30 (of 50) ]
      [ time 129 ] IO_START by JOB 1
      IO DONE
      [ time 129 ] IO_DONE by JOB 3
      [ time 129 ] Run JOB 2 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 23 (of 50) ]
      [ time 130 ] IO_DONE by JOB 1
      [ time 130 ] Run JOB 2 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 22 (of 50) ]
      [ time 131 ] IO_START by JOB 2
      IO DONE
      [ time 131 ] Run JOB 3 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 16 (of 50) ]
      [ time 132 ] IO_DONE by JOB 2
      [ time 132 ] Run JOB 3 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 15 (of 50) ]
      [ time 133 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 29 (of 50) ]
      [ time 134 ] IO_START by JOB 1
      IO DONE
      [ time 134 ] Run JOB 2 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 21 (of 50) ]
      [ time 135 ] IO_DONE by JOB 1
      [ time 135 ] Run JOB 2 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 20 (of 50) ]
      [ time 136 ] IO_START by JOB 2
      IO DONE
      [ time 136 ] Run JOB 3 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 14 (of 50) ]
      [ time 137 ] IO_START by JOB 3
      IO DONE
      [ time 137 ] IO_DONE by JOB 2
      [ time 137 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 28 (of 50) ]
      [ time 138 ] IO_START by JOB 1
      IO DONE
      [ time 138 ] IO_DONE by JOB 3
      [ time 138 ] Run JOB 2 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 19 (of 50) ]
      [ time 139 ] IO_DONE by JOB 1
      [ time 139 ] Run JOB 2 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 18 (of 50) ]
      [ time 140 ] IO_START by JOB 2
      IO DONE
      [ time 140 ] Run JOB 3 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 13 (of 50) ]
      [ time 141 ] IO_DONE by JOB 2
      [ time 141 ] Run JOB 3 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 12 (of 50) ]
      [ time 142 ] Run JOB 3 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 11 (of 50) ]
      [ time 143 ] IO_START by JOB 3
      IO DONE
      [ time 143 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 27 (of 50) ]
      [ time 144 ] IO_START by JOB 1
      IO DONE
      [ time 144 ] IO_DONE by JOB 3
      [ time 144 ] Run JOB 2 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 17 (of 50) ]
      [ time 145 ] IO_DONE by JOB 1
      [ time 145 ] Run JOB 2 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 16 (of 50) ]
      [ time 146 ] IO_START by JOB 2
      IO DONE
      [ time 146 ] Run JOB 3 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 10 (of 50) ]
      [ time 147 ] IO_DONE by JOB 2
      [ time 147 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 26 (of 50) ]
      [ time 148 ] IO_START by JOB 1
      IO DONE
      [ time 148 ] Run JOB 3 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 9 (of 50) ]
      [ time 149 ] IO_DONE by JOB 1
      [ time 149 ] Run JOB 3 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 8 (of 50) ]
      [ time 150 ] IO_START by JOB 3
      IO DONE
      [ time 150 ] Run JOB 2 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 15 (of 50) ]
      [ time 151 ] IO_DONE by JOB 3
      [ time 151 ] Run JOB 1 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 25 (of 50) ]
      [ time 152 ] IO_START by JOB 1
      IO DONE
      [ time 152 ] Run JOB 2 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 14 (of 50) ]
      [ time 153 ] IO_START by JOB 2
      IO DONE
      [ time 153 ] IO_DONE by JOB 1
      [ time 153 ] Run JOB 3 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 7 (of 50) ]
      [ time 154 ] IO_DONE by JOB 2
      [ time 154 ] Run JOB 3 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 6 (of 50) ]
      [ time 155 ] Run JOB 3 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 5 (of 50) ]
      [ time 156 ] IO_START by JOB 3
      IO DONE
      [ time 156 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 24 (of 50) ]
      [ time 157 ] IO_START by JOB 1
      IO DONE
      [ time 157 ] IO_DONE by JOB 3
      [ time 157 ] Run JOB 2 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 13 (of 50) ]
      [ time 158 ] IO_DONE by JOB 1
      [ time 158 ] Run JOB 2 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 12 (of 50) ]
      [ time 159 ] IO_START by JOB 2
      IO DONE
      [ time 159 ] Run JOB 3 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 4 (of 50) ]
      [ time 160 ] IO_DONE by JOB 2
      [ time 160 ] Run JOB 3 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 3 (of 50) ]
      [ time 161 ] Run JOB 3 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 2 (of 50) ]
      [ time 162 ] IO_START by JOB 3
      IO DONE
      [ time 162 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 23 (of 50) ]
      [ time 163 ] IO_START by JOB 1
      IO DONE
      [ time 163 ] IO_DONE by JOB 3
      [ time 163 ] Run JOB 2 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 11 (of 50) ]
      [ time 164 ] IO_DONE by JOB 1
      [ time 164 ] Run JOB 2 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 10 (of 50) ]
      [ time 165 ] IO_START by JOB 2
      IO DONE
      [ time 165 ] Run JOB 3 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 1 (of 50) ]
      [ time 166 ] IO_DONE by JOB 2
      [ time 166 ] Run JOB 3 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 0 (of 50) ]
      [ time 167 ] FINISHED JOB 3
      [ time 167 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 22 (of 50) ]
      [ time 168 ] IO_START by JOB 1
      IO DONE
      [ time 168 ] Run JOB 2 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 9 (of 50) ]
      [ time 169 ] IO_DONE by JOB 1
      [ time 169 ] Run JOB 2 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 8 (of 50) ]
      [ time 170 ] IO_START by JOB 2
      IO DONE
      [ time 170 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 21 (of 50) ]
      [ time 171 ] IO_START by JOB 1
      IO DONE
      [ time 171 ] IO_DONE by JOB 2
      [ time 171 ] Run JOB 2 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 7 (of 50) ]
      [ time 172 ] IO_DONE by JOB 1
      [ time 172 ] Run JOB 2 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 6 (of 50) ]
      [ time 173 ] IO_START by JOB 2
      IO DONE
      [ time 173 ] Run JOB 1 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 20 (of 50) ]
      [ time 174 ] IO_START by JOB 1
      IO DONE
      [ time 174 ] IO_DONE by JOB 2
      [ time 174 ] Run JOB 2 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 5 (of 50) ]
      [ time 175 ] IO_DONE by JOB 1
      [ time 175 ] Run JOB 2 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 4 (of 50) ]
      [ time 176 ] IO_START by JOB 2
      IO DONE
      [ time 176 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 19 (of 50) ]
      [ time 177 ] IO_START by JOB 1
      IO DONE
      [ time 177 ] IO_DONE by JOB 2
      [ time 177 ] Run JOB 2 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 3 (of 50) ]
      [ time 178 ] IO_DONE by JOB 1
      [ time 178 ] Run JOB 2 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 2 (of 50) ]
      [ time 179 ] IO_START by JOB 2
      IO DONE
      [ time 179 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 18 (of 50) ]
      [ time 180 ] IO_START by JOB 1
      IO DONE
      [ time 180 ] IO_DONE by JOB 2
      [ time 180 ] Run JOB 2 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 1 (of 50) ]
      [ time 181 ] IO_DONE by JOB 1
      [ time 181 ] Run JOB 2 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 0 (of 50) ]
      [ time 182 ] FINISHED JOB 2
      [ time 182 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 17 (of 50) ]
      [ time 183 ] IO_START by JOB 1
      IO DONE
      [ time 183 ] IDLE
      [ time 184 ] IO_DONE by JOB 1
      [ time 184 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 16 (of 50) ]
      [ time 185 ] IO_START by JOB 1
      IO DONE
      [ time 185 ] IDLE
      [ time 186 ] IO_DONE by JOB 1
      [ time 186 ] Run JOB 1 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 15 (of 50) ]
      [ time 187 ] IO_START by JOB 1
      IO DONE
      [ time 187 ] IDLE
      [ time 188 ] IO_DONE by JOB 1
      [ time 188 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 14 (of 50) ]
      [ time 189 ] IO_START by JOB 1
      IO DONE
      [ time 189 ] IDLE
      [ time 190 ] IO_DONE by JOB 1
      [ time 190 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 13 (of 50) ]
      [ time 191 ] IO_START by JOB 1
      IO DONE
      [ time 191 ] IDLE
      [ time 192 ] IO_DONE by JOB 1
      [ time 192 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 12 (of 50) ]
      [ time 193 ] IO_START by JOB 1
      IO DONE
      [ time 193 ] IDLE
      [ time 194 ] IO_DONE by JOB 1
      [ time 194 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 11 (of 50) ]
      [ time 195 ] IO_START by JOB 1
      IO DONE
      [ time 195 ] IDLE
      [ time 196 ] IO_DONE by JOB 1
      [ time 196 ] Run JOB 1 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 10 (of 50) ]
      [ time 197 ] IO_START by JOB 1
      IO DONE
      [ time 197 ] IDLE
      [ time 198 ] IO_DONE by JOB 1
      [ time 198 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 9 (of 50) ]
      [ time 199 ] IO_START by JOB 1
      IO DONE
      [ time 199 ] IDLE
      [ time 200 ] IO_DONE by JOB 1
      [ time 200 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 8 (of 50) ]
      [ time 201 ] IO_START by JOB 1
      IO DONE
      [ time 201 ] IDLE
      [ time 202 ] IO_DONE by JOB 1
      [ time 202 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 7 (of 50) ]
      [ time 203 ] IO_START by JOB 1
      IO DONE
      [ time 203 ] IDLE
      [ time 204 ] IO_DONE by JOB 1
      [ time 204 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 6 (of 50) ]
      [ time 205 ] IO_START by JOB 1
      IO DONE
      [ time 205 ] IDLE
      [ time 206 ] IO_DONE by JOB 1
      [ time 206 ] Run JOB 1 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 5 (of 50) ]
      [ time 207 ] IO_START by JOB 1
      IO DONE
      [ time 207 ] IDLE
      [ time 208 ] IO_DONE by JOB 1
      [ time 208 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 4 (of 50) ]
      [ time 209 ] IO_START by JOB 1
      IO DONE
      [ time 209 ] IDLE
      [ time 210 ] IO_DONE by JOB 1
      [ time 210 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 3 (of 50) ]
      [ time 211 ] IO_START by JOB 1
      IO DONE
      [ time 211 ] IDLE
      [ time 212 ] IO_DONE by JOB 1
      [ time 212 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 2 (of 50) ]
      [ time 213 ] IO_START by JOB 1
      IO DONE
      [ time 213 ] IDLE
      [ time 214 ] IO_DONE by JOB 1
      [ time 214 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 1 (of 50) ]
      [ time 215 ] IO_START by JOB 1
      IO DONE
      [ time 215 ] IDLE
      [ time 216 ] IO_DONE by JOB 1
      [ time 216 ] Run JOB 1 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 0 (of 50) ]
      [ time 217 ] FINISHED JOB 1
      
      Final statistics:
        Job  0: startTime   0 - response   0 - turnaround 104
        Job  1: startTime  20 - response   0 - turnaround 197
        Job  2: startTime  20 - response   1 - turnaround 162
        Job  3: startTime  20 - response   2 - turnaround 147
      
        Avg  3: startTime n/a - response 0.75 - turnaround 152.50
      ```

    - Comparison

      ```bash
      Before Tolerance
      Final statistics:
        Job  0: startTime   0 - response   0 - turnaround 200
        Job  1: startTime  20 - response   0 - turnaround 104
        Job  2: startTime  20 - response   1 - turnaround 106
        Job  3: startTime  20 - response   2 - turnaround 164
      
        Avg  3: startTime n/a - response 0.75 - turnaround 143.50
      
      After Tolerance
      Final statistics:
        Job  0: startTime   0 - response   0 - turnaround 104
        Job  1: startTime  20 - response   0 - turnaround 197
        Job  2: startTime  20 - response   1 - turnaround 162
        Job  3: startTime  20 - response   2 - turnaround 147
      
        Avg  3: startTime n/a - response 0.75 - turnaround 152.50
      ```

      - We can see that job 0 is faster and job 1 is slower after tolerance .

  - Figure 8.6 - Lower Priority, Longer Quanta

    ```bash
    python3 mlfq.py -l 0,50,0:0,50,0 -c -B 0 -Q 1,2,3,4,5
    Here is the list of inputs:
    OPTIONS jobs 2
    OPTIONS queues 5
    OPTIONS allotments for queue  4 is   1
    OPTIONS quantum length for queue  4 is   1
    OPTIONS allotments for queue  3 is   1
    OPTIONS quantum length for queue  3 is   2
    OPTIONS allotments for queue  2 is   1
    OPTIONS quantum length for queue  2 is   3
    OPTIONS allotments for queue  1 is   1
    OPTIONS quantum length for queue  1 is   4
    OPTIONS allotments for queue  0 is   1
    OPTIONS quantum length for queue  0 is   5
    OPTIONS boost 0
    OPTIONS ioTime 5
    OPTIONS stayAfterIO False
    OPTIONS iobump False
    
    
    For each job, three defining characteristics are given:
      startTime : at what time does the job enter the system
      runTime   : the total CPU time needed by the job to finish
      ioFreq    : every ioFreq time units, the job issues an I/O
                  (the I/O takes ioTime units to complete)
    
    Job List:
      Job  0: startTime   0 - runTime  50 - ioFreq   0
      Job  1: startTime   0 - runTime  50 - ioFreq   0
    
    
    Execution Trace:
    
    [ time 0 ] JOB BEGINS by JOB 0
    [ time 0 ] JOB BEGINS by JOB 1
    [ time 0 ] Run JOB 0 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 49 (of 50) ]
    [ time 1 ] Run JOB 1 at PRIORITY 4 [ TICKS 0 ALLOT 1 TIME 49 (of 50) ]
    [ time 2 ] Run JOB 0 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 48 (of 50) ]
    [ time 3 ] Run JOB 0 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 47 (of 50) ]
    [ time 4 ] Run JOB 1 at PRIORITY 3 [ TICKS 1 ALLOT 1 TIME 48 (of 50) ]
    [ time 5 ] Run JOB 1 at PRIORITY 3 [ TICKS 0 ALLOT 1 TIME 47 (of 50) ]
    [ time 6 ] Run JOB 0 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 46 (of 50) ]
    [ time 7 ] Run JOB 0 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 45 (of 50) ]
    [ time 8 ] Run JOB 0 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 44 (of 50) ]
    [ time 9 ] Run JOB 1 at PRIORITY 2 [ TICKS 2 ALLOT 1 TIME 46 (of 50) ]
    [ time 10 ] Run JOB 1 at PRIORITY 2 [ TICKS 1 ALLOT 1 TIME 45 (of 50) ]
    [ time 11 ] Run JOB 1 at PRIORITY 2 [ TICKS 0 ALLOT 1 TIME 44 (of 50) ]
    [ time 12 ] Run JOB 0 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 43 (of 50) ]
    [ time 13 ] Run JOB 0 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 42 (of 50) ]
    [ time 14 ] Run JOB 0 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 41 (of 50) ]
    [ time 15 ] Run JOB 0 at PRIORITY 1 [ TICKS 0 ALLOT 1 TIME 40 (of 50) ]
    [ time 16 ] Run JOB 1 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 43 (of 50) ]
    [ time 17 ] Run JOB 1 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 42 (of 50) ]
    [ time 18 ] Run JOB 1 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 41 (of 50) ]
    [ time 19 ] Run JOB 1 at PRIORITY 1 [ TICKS 0 ALLOT 1 TIME 40 (of 50) ]
    [ time 20 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 39 (of 50) ]
    [ time 21 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 38 (of 50) ]
    [ time 22 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 37 (of 50) ]
    [ time 23 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 36 (of 50) ]
    [ time 24 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 35 (of 50) ]
    [ time 25 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 39 (of 50) ]
    [ time 26 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 38 (of 50) ]
    [ time 27 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 37 (of 50) ]
    [ time 28 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 36 (of 50) ]
    [ time 29 ] Run JOB 1 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 35 (of 50) ]
    [ time 30 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 34 (of 50) ]
    [ time 31 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 33 (of 50) ]
    [ time 32 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 32 (of 50) ]
    [ time 33 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 31 (of 50) ]
    [ time 34 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 30 (of 50) ]
    [ time 35 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 34 (of 50) ]
    [ time 36 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 33 (of 50) ]
    [ time 37 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 32 (of 50) ]
    [ time 38 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 31 (of 50) ]
    [ time 39 ] Run JOB 1 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 30 (of 50) ]
    [ time 40 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 29 (of 50) ]
    [ time 41 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 28 (of 50) ]
    [ time 42 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 27 (of 50) ]
    [ time 43 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 26 (of 50) ]
    [ time 44 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 25 (of 50) ]
    [ time 45 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 29 (of 50) ]
    [ time 46 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 28 (of 50) ]
    [ time 47 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 27 (of 50) ]
    [ time 48 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 26 (of 50) ]
    [ time 49 ] Run JOB 1 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 25 (of 50) ]
    [ time 50 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 24 (of 50) ]
    [ time 51 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 23 (of 50) ]
    [ time 52 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 22 (of 50) ]
    [ time 53 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 21 (of 50) ]
    [ time 54 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 20 (of 50) ]
    [ time 55 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 24 (of 50) ]
    [ time 56 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 23 (of 50) ]
    [ time 57 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 22 (of 50) ]
    [ time 58 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 21 (of 50) ]
    [ time 59 ] Run JOB 1 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 20 (of 50) ]
    [ time 60 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 19 (of 50) ]
    [ time 61 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 18 (of 50) ]
    [ time 62 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 17 (of 50) ]
    [ time 63 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 16 (of 50) ]
    [ time 64 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 15 (of 50) ]
    [ time 65 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 19 (of 50) ]
    [ time 66 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 18 (of 50) ]
    [ time 67 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 17 (of 50) ]
    [ time 68 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 16 (of 50) ]
    [ time 69 ] Run JOB 1 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 15 (of 50) ]
    [ time 70 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 14 (of 50) ]
    [ time 71 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 13 (of 50) ]
    [ time 72 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 12 (of 50) ]
    [ time 73 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 11 (of 50) ]
    [ time 74 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 10 (of 50) ]
    [ time 75 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 14 (of 50) ]
    [ time 76 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 13 (of 50) ]
    [ time 77 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 12 (of 50) ]
    [ time 78 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 11 (of 50) ]
    [ time 79 ] Run JOB 1 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 10 (of 50) ]
    [ time 80 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 9 (of 50) ]
    [ time 81 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 8 (of 50) ]
    [ time 82 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 7 (of 50) ]
    [ time 83 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 6 (of 50) ]
    [ time 84 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 5 (of 50) ]
    [ time 85 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 9 (of 50) ]
    [ time 86 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 8 (of 50) ]
    [ time 87 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 7 (of 50) ]
    [ time 88 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 6 (of 50) ]
    [ time 89 ] Run JOB 1 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 5 (of 50) ]
    [ time 90 ] Run JOB 0 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 4 (of 50) ]
    [ time 91 ] Run JOB 0 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 3 (of 50) ]
    [ time 92 ] Run JOB 0 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 2 (of 50) ]
    [ time 93 ] Run JOB 0 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 1 (of 50) ]
    [ time 94 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 0 (of 50) ]
    [ time 95 ] FINISHED JOB 0
    [ time 95 ] Run JOB 1 at PRIORITY 0 [ TICKS 4 ALLOT 1 TIME 4 (of 50) ]
    [ time 96 ] Run JOB 1 at PRIORITY 0 [ TICKS 3 ALLOT 1 TIME 3 (of 50) ]
    [ time 97 ] Run JOB 1 at PRIORITY 0 [ TICKS 2 ALLOT 1 TIME 2 (of 50) ]
    [ time 98 ] Run JOB 1 at PRIORITY 0 [ TICKS 1 ALLOT 1 TIME 1 (of 50) ]
    [ time 99 ] Run JOB 1 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 0 (of 50) ]
    [ time 100 ] FINISHED JOB 1
    
    Final statistics:
      Job  0: startTime   0 - response   0 - turnaround  95
      Job  1: startTime   0 - response   1 - turnaround 100
    
      Avg  1: startTime n/a - response 0.50 - turnaround 97.50
    ```

    
3. **How would you configure the scheduler parameters to behave just like a round-robin scheduler?**

  - Just use one queue.
4. **Craft a workload with two jobs and scheduler parameters so that one job takes advantage of the older Rules 4a and 4b (turned on with the -S flag) to game the scheduler and obtain 99% of the CPU over a particular time interval.**

  The idea is to have the first queue with more cpu time than the others with I/O frequency being almost the same time as the quanta of the first qeue, while the second qeue must have less space.
  ```bash
  python3 mlfq.py -l 0,50,0:11,50,9 -c -B 0 -Q 10,1 -S -i 1
  Here is the list of inputs:
  OPTIONS jobs 2
  OPTIONS queues 2
  OPTIONS allotments for queue  1 is   1
  OPTIONS quantum length for queue  1 is  10
  OPTIONS allotments for queue  0 is   1
  OPTIONS quantum length for queue  0 is   1
  OPTIONS boost 0
  OPTIONS ioTime 1
  OPTIONS stayAfterIO True
  OPTIONS iobump False
  
  
  For each job, three defining characteristics are given:
    startTime : at what time does the job enter the system
    runTime   : the total CPU time needed by the job to finish
    ioFreq    : every ioFreq time units, the job issues an I/O
                (the I/O takes ioTime units to complete)
  
  Job List:
    Job  0: startTime   0 - runTime  50 - ioFreq   0
    Job  1: startTime  11 - runTime  50 - ioFreq   9
  
  
  Execution Trace:
  
  [ time 0 ] JOB BEGINS by JOB 0
  [ time 0 ] Run JOB 0 at PRIORITY 1 [ TICKS 9 ALLOT 1 TIME 49 (of 50) ]
  [ time 1 ] Run JOB 0 at PRIORITY 1 [ TICKS 8 ALLOT 1 TIME 48 (of 50) ]
  [ time 2 ] Run JOB 0 at PRIORITY 1 [ TICKS 7 ALLOT 1 TIME 47 (of 50) ]
  [ time 3 ] Run JOB 0 at PRIORITY 1 [ TICKS 6 ALLOT 1 TIME 46 (of 50) ]
  [ time 4 ] Run JOB 0 at PRIORITY 1 [ TICKS 5 ALLOT 1 TIME 45 (of 50) ]
  [ time 5 ] Run JOB 0 at PRIORITY 1 [ TICKS 4 ALLOT 1 TIME 44 (of 50) ]
  [ time 6 ] Run JOB 0 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 43 (of 50) ]
  [ time 7 ] Run JOB 0 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 42 (of 50) ]
  [ time 8 ] Run JOB 0 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 41 (of 50) ]
  [ time 9 ] Run JOB 0 at PRIORITY 1 [ TICKS 0 ALLOT 1 TIME 40 (of 50) ]
  [ time 10 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 39 (of 50) ]
  [ time 11 ] JOB BEGINS by JOB 1
  [ time 11 ] Run JOB 1 at PRIORITY 1 [ TICKS 9 ALLOT 1 TIME 49 (of 50) ]
  [ time 12 ] Run JOB 1 at PRIORITY 1 [ TICKS 8 ALLOT 1 TIME 48 (of 50) ]
  [ time 13 ] Run JOB 1 at PRIORITY 1 [ TICKS 7 ALLOT 1 TIME 47 (of 50) ]
  [ time 14 ] Run JOB 1 at PRIORITY 1 [ TICKS 6 ALLOT 1 TIME 46 (of 50) ]
  [ time 15 ] Run JOB 1 at PRIORITY 1 [ TICKS 5 ALLOT 1 TIME 45 (of 50) ]
  [ time 16 ] Run JOB 1 at PRIORITY 1 [ TICKS 4 ALLOT 1 TIME 44 (of 50) ]
  [ time 17 ] Run JOB 1 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 43 (of 50) ]
  [ time 18 ] Run JOB 1 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 42 (of 50) ]
  [ time 19 ] Run JOB 1 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 41 (of 50) ]
  [ time 20 ] IO_START by JOB 1
  IO DONE
  [ time 20 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 38 (of 50) ]
  [ time 21 ] IO_DONE by JOB 1
  [ time 21 ] Run JOB 1 at PRIORITY 1 [ TICKS 9 ALLOT 1 TIME 40 (of 50) ]
  [ time 22 ] Run JOB 1 at PRIORITY 1 [ TICKS 8 ALLOT 1 TIME 39 (of 50) ]
  [ time 23 ] Run JOB 1 at PRIORITY 1 [ TICKS 7 ALLOT 1 TIME 38 (of 50) ]
  [ time 24 ] Run JOB 1 at PRIORITY 1 [ TICKS 6 ALLOT 1 TIME 37 (of 50) ]
  [ time 25 ] Run JOB 1 at PRIORITY 1 [ TICKS 5 ALLOT 1 TIME 36 (of 50) ]
  [ time 26 ] Run JOB 1 at PRIORITY 1 [ TICKS 4 ALLOT 1 TIME 35 (of 50) ]
  [ time 27 ] Run JOB 1 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 34 (of 50) ]
  [ time 28 ] Run JOB 1 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 33 (of 50) ]
  [ time 29 ] Run JOB 1 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 32 (of 50) ]
  [ time 30 ] IO_START by JOB 1
  IO DONE
  [ time 30 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 37 (of 50) ]
  [ time 31 ] IO_DONE by JOB 1
  [ time 31 ] Run JOB 1 at PRIORITY 1 [ TICKS 9 ALLOT 1 TIME 31 (of 50) ]
  [ time 32 ] Run JOB 1 at PRIORITY 1 [ TICKS 8 ALLOT 1 TIME 30 (of 50) ]
  [ time 33 ] Run JOB 1 at PRIORITY 1 [ TICKS 7 ALLOT 1 TIME 29 (of 50) ]
  [ time 34 ] Run JOB 1 at PRIORITY 1 [ TICKS 6 ALLOT 1 TIME 28 (of 50) ]
  [ time 35 ] Run JOB 1 at PRIORITY 1 [ TICKS 5 ALLOT 1 TIME 27 (of 50) ]
  [ time 36 ] Run JOB 1 at PRIORITY 1 [ TICKS 4 ALLOT 1 TIME 26 (of 50) ]
  [ time 37 ] Run JOB 1 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 25 (of 50) ]
  [ time 38 ] Run JOB 1 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 24 (of 50) ]
  [ time 39 ] Run JOB 1 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 23 (of 50) ]
  [ time 40 ] IO_START by JOB 1
  IO DONE
  [ time 40 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 36 (of 50) ]
  [ time 41 ] IO_DONE by JOB 1
  [ time 41 ] Run JOB 1 at PRIORITY 1 [ TICKS 9 ALLOT 1 TIME 22 (of 50) ]
  [ time 42 ] Run JOB 1 at PRIORITY 1 [ TICKS 8 ALLOT 1 TIME 21 (of 50) ]
  [ time 43 ] Run JOB 1 at PRIORITY 1 [ TICKS 7 ALLOT 1 TIME 20 (of 50) ]
  [ time 44 ] Run JOB 1 at PRIORITY 1 [ TICKS 6 ALLOT 1 TIME 19 (of 50) ]
  [ time 45 ] Run JOB 1 at PRIORITY 1 [ TICKS 5 ALLOT 1 TIME 18 (of 50) ]
  [ time 46 ] Run JOB 1 at PRIORITY 1 [ TICKS 4 ALLOT 1 TIME 17 (of 50) ]
  [ time 47 ] Run JOB 1 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 16 (of 50) ]
  [ time 48 ] Run JOB 1 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 15 (of 50) ]
  [ time 49 ] Run JOB 1 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 14 (of 50) ]
  [ time 50 ] IO_START by JOB 1
  IO DONE
  [ time 50 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 35 (of 50) ]
  [ time 51 ] IO_DONE by JOB 1
  [ time 51 ] Run JOB 1 at PRIORITY 1 [ TICKS 9 ALLOT 1 TIME 13 (of 50) ]
  [ time 52 ] Run JOB 1 at PRIORITY 1 [ TICKS 8 ALLOT 1 TIME 12 (of 50) ]
  [ time 53 ] Run JOB 1 at PRIORITY 1 [ TICKS 7 ALLOT 1 TIME 11 (of 50) ]
  [ time 54 ] Run JOB 1 at PRIORITY 1 [ TICKS 6 ALLOT 1 TIME 10 (of 50) ]
  [ time 55 ] Run JOB 1 at PRIORITY 1 [ TICKS 5 ALLOT 1 TIME 9 (of 50) ]
  [ time 56 ] Run JOB 1 at PRIORITY 1 [ TICKS 4 ALLOT 1 TIME 8 (of 50) ]
  [ time 57 ] Run JOB 1 at PRIORITY 1 [ TICKS 3 ALLOT 1 TIME 7 (of 50) ]
  [ time 58 ] Run JOB 1 at PRIORITY 1 [ TICKS 2 ALLOT 1 TIME 6 (of 50) ]
  [ time 59 ] Run JOB 1 at PRIORITY 1 [ TICKS 1 ALLOT 1 TIME 5 (of 50) ]
  [ time 60 ] IO_START by JOB 1
  IO DONE
  [ time 60 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 34 (of 50) ]
  [ time 61 ] IO_DONE by JOB 1
  [ time 61 ] Run JOB 1 at PRIORITY 1 [ TICKS 9 ALLOT 1 TIME 4 (of 50) ]
  [ time 62 ] Run JOB 1 at PRIORITY 1 [ TICKS 8 ALLOT 1 TIME 3 (of 50) ]
  [ time 63 ] Run JOB 1 at PRIORITY 1 [ TICKS 7 ALLOT 1 TIME 2 (of 50) ]
  [ time 64 ] Run JOB 1 at PRIORITY 1 [ TICKS 6 ALLOT 1 TIME 1 (of 50) ]
  [ time 65 ] Run JOB 1 at PRIORITY 1 [ TICKS 5 ALLOT 1 TIME 0 (of 50) ]
  [ time 66 ] FINISHED JOB 1
  [ time 66 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 33 (of 50) ]
  [ time 67 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 32 (of 50) ]
  [ time 68 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 31 (of 50) ]
  [ time 69 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 30 (of 50) ]
  [ time 70 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 29 (of 50) ]
  [ time 71 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 28 (of 50) ]
  [ time 72 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 27 (of 50) ]
  [ time 73 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 26 (of 50) ]
  [ time 74 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 25 (of 50) ]
  [ time 75 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 24 (of 50) ]
  [ time 76 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 23 (of 50) ]
  [ time 77 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 22 (of 50) ]
  [ time 78 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 21 (of 50) ]
  [ time 79 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 20 (of 50) ]
  [ time 80 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 19 (of 50) ]
  [ time 81 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 18 (of 50) ]
  [ time 82 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 17 (of 50) ]
  [ time 83 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 16 (of 50) ]
  [ time 84 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 15 (of 50) ]
  [ time 85 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 14 (of 50) ]
  [ time 86 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 13 (of 50) ]
  [ time 87 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 12 (of 50) ]
  [ time 88 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 11 (of 50) ]
  [ time 89 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 10 (of 50) ]
  [ time 90 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 9 (of 50) ]
  [ time 91 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 8 (of 50) ]
  [ time 92 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 7 (of 50) ]
  [ time 93 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 6 (of 50) ]
  [ time 94 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 5 (of 50) ]
  [ time 95 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 4 (of 50) ]
  [ time 96 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 3 (of 50) ]
  [ time 97 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 2 (of 50) ]
  [ time 98 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 1 (of 50) ]
  [ time 99 ] Run JOB 0 at PRIORITY 0 [ TICKS 0 ALLOT 1 TIME 0 (of 50) ]
  [ time 100 ] FINISHED JOB 0
  
  Final statistics:
    Job  0: startTime   0 - response   0 - turnaround 100
    Job  1: startTime  11 - response   0 - turnaround  55
  
    Avg  1: startTime n/a - response 0.00 - turnaround 77.50
  ```


5. **Given a system with a quantum length of 10 ms in its highest queue, how often would you have to boost jobs back to the highest priority level (with the -B flag) in order to guarantee that a single long-running (and potentially-starving) job gets at least 5% of the CPU?**

  Assuming that the job is at the last queue already and it will be the first to run after the boost.
  10ms need to be 5% of the whole  boost time, thus $\frac {10} {0.05} - 10 = 190$.
6. **One question that arises in scheduling is which end of a queue to add a job that just finished I/O; the -I flag changes this behavior for this scheduling simulator. Play around with some workloads and see if you can see the effect of this flag.**

  - `-i` change how long the I/O lasts in the simulator, so the greater the more will waits to return.
  - So using a smaller value will be similar to put the job at the head of the queue, and larger the value more to the end of the queue the job will be placed.
