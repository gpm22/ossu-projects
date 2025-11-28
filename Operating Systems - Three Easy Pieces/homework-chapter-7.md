# 7 -  Scheduling: Introduction

## Homework (Simulation)
This program, [scheduler.py](http://pages.cs.wisc.edu/~remzi/OSTEP/Homework/HW-Scheduler.tgz), allows you to see how different schedulers perform under scheduling metrics such as response time, turnaround time, and total wait time. See the README for details.

## Questions

1. **Compute the response time and turnaround time when running three jobs of length 200 with the SJF and FIFO schedulers.**

  ```bash
  # FIFO
  python3 ./scheduler.py -p FIFO -l 200,200,200 -s 100 -c
  ARG policy FIFO
  ARG jlist 200,200,200
  
  Here is the job list, with the run time of each job: 
    Job 0 ( length = 200.0 )
    Job 1 ( length = 200.0 )
    Job 2 ( length = 200.0 )
  
  
  ** Solutions **
  
  Execution trace:
    [ time   0 ] Run job 0 for 200.00 secs ( DONE at 200.00 )
    [ time 200 ] Run job 1 for 200.00 secs ( DONE at 400.00 )
    [ time 400 ] Run job 2 for 200.00 secs ( DONE at 600.00 )
  
  Final statistics:
    Job   0 -- Response: 0.00  Turnaround 200.00  Wait 0.00
    Job   1 -- Response: 200.00  Turnaround 400.00  Wait 200.00
    Job   2 -- Response: 400.00  Turnaround 600.00  Wait 400.00
  
    Average -- Response: 200.00  Turnaround 400.00  Wait 200.00
    
  # -------------------------------------------------------------------------------------
  # SJF
  python3 ./scheduler.py -p SJF -l 200,200,200 -s 100 -c
  ARG policy SJF
  ARG jlist 200,200,200
  
  Here is the job list, with the run time of each job: 
    Job 0 ( length = 200.0 )
    Job 1 ( length = 200.0 )
    Job 2 ( length = 200.0 )
  
  
  ** Solutions **
  
  Execution trace:
    [ time   0 ] Run job 0 for 200.00 secs ( DONE at 200.00 )
    [ time 200 ] Run job 1 for 200.00 secs ( DONE at 400.00 )
    [ time 400 ] Run job 2 for 200.00 secs ( DONE at 600.00 )
  
  Final statistics:
    Job   0 -- Response: 0.00  Turnaround 200.00  Wait 0.00
    Job   1 -- Response: 200.00  Turnaround 400.00  Wait 200.00
    Job   2 -- Response: 400.00  Turnaround 600.00  Wait 400.00
  
    Average -- Response: 200.00  Turnaround 400.00  Wait 200.00
  
  ```

  are the same, as jobs have same lenght.
2. **Now do the same but with jobs of different lengths: 100, 200, and 300.**

  - **100, 200, 300**

    ```bash
    # FIFO
    python3 ./scheduler.py -p FIFO -l 100,200,300 -s 100-c
    ARG policy FIFO
    ARG jlist 100,200,300
    
    Here is the job list, with the run time of each job: 
      Job 0 ( length = 100.0 )
      Job 1 ( length = 200.0 )
      Job 2 ( length = 300.0 )
    
    
    ** Solutions **
    
    Execution trace:
      [ time   0 ] Run job 0 for 100.00 secs ( DONE at 100.00 )
      [ time 100 ] Run job 1 for 200.00 secs ( DONE at 300.00 )
      [ time 300 ] Run job 2 for 300.00 secs ( DONE at 600.00 )
    
    Final statistics:
      Job   0 -- Response: 0.00  Turnaround 100.00  Wait 0.00
      Job   1 -- Response: 100.00  Turnaround 300.00  Wait 100.00
      Job   2 -- Response: 300.00  Turnaround 600.00  Wait 300.00
    
      Average -- Response: 133.33  Turnaround 333.33  Wait 133.33
    # -------------------------------------------------------------------------------------
    # SJF
    python3 ./scheduler.py -p SJF -l 100,200,300 -s 100-c
    ARG policy SJF
    ARG jlist 100,200,300
    
    Here is the job list, with the run time of each job: 
      Job 0 ( length = 100.0 )
      Job 1 ( length = 200.0 )
      Job 2 ( length = 300.0 )
    
    
    ** Solutions **
    
    Execution trace:
      [ time   0 ] Run job 0 for 100.00 secs ( DONE at 100.00 )
      [ time 100 ] Run job 1 for 200.00 secs ( DONE at 300.00 )
      [ time 300 ] Run job 2 for 300.00 secs ( DONE at 600.00 )
    
    Final statistics:
      Job   0 -- Response: 0.00  Turnaround 100.00  Wait 0.00
      Job   1 -- Response: 100.00  Turnaround 300.00  Wait 100.00
      Job   2 -- Response: 300.00  Turnaround 600.00  Wait 300.00
    
      Average -- Response: 133.33  Turnaround 333.33  Wait 133.33
    ```

    are the same, because it is receiving them sorted from smaller to larger

  - **300, 200, 100**

    ```bash
    # FIFO
    python3 ./scheduler.py -p FIFO -l 300,200,100 -s 100-c
    
    ARG policy FIFO
    ARG jlist 300,200,100
    
    Here is the job list, with the run time of each job: 
      Job 0 ( length = 300.0 )
      Job 1 ( length = 200.0 )
      Job 2 ( length = 100.0 )
    
    
    ** Solutions **
    
    Execution trace:
      [ time   0 ] Run job 0 for 300.00 secs ( DONE at 300.00 )
      [ time 300 ] Run job 1 for 200.00 secs ( DONE at 500.00 )
      [ time 500 ] Run job 2 for 100.00 secs ( DONE at 600.00 )
    
    Final statistics:
      Job   0 -- Response: 0.00  Turnaround 300.00  Wait 0.00
      Job   1 -- Response: 300.00  Turnaround 500.00  Wait 300.00
      Job   2 -- Response: 500.00  Turnaround 600.00  Wait 500.00
    
      Average -- Response: 266.67  Turnaround 466.67  Wait 266.67
    
    # -------------------------------------------------------------------------------------
    # SJF
    python3 ./scheduler.py -p SJF -l 300,200,100 -s 100-c
    ARG policy SJF
    ARG jlist 300,200,100
    
    Here is the job list, with the run time of each job: 
      Job 0 ( length = 300.0 )
      Job 1 ( length = 200.0 )
      Job 2 ( length = 100.0 )
    
    
    ** Solutions **
    
    Execution trace:
      [ time   0 ] Run job 2 for 100.00 secs ( DONE at 100.00 )
      [ time 100 ] Run job 1 for 200.00 secs ( DONE at 300.00 )
      [ time 300 ] Run job 0 for 300.00 secs ( DONE at 600.00 )
    
    Final statistics:
      Job   2 -- Response: 0.00  Turnaround 100.00  Wait 0.00
      Job   1 -- Response: 100.00  Turnaround 300.00  Wait 100.00
      Job   0 -- Response: 300.00  Turnaround 600.00  Wait 300.00
    
      Average -- Response: 133.33  Turnaround 333.33  Wait 133.33
    
    ```

    As FIFO does not sort by smaller, it took away longer than SJF.

  
3. **Now do the same, but also with the RR scheduler and a time-slice of 1.**

  * **100, 200, 300**

    ```bash
    python3 ./scheduler.py -p RR -l 100,200,300 -s 100-c
    ARG policy RR
    ARG jlist 100,200,300
    
    Here is the job list, with the run time of each job: 
      Job 0 ( length = 100.0 )
      Job 1 ( length = 200.0 )
      Job 2 ( length = 300.0 )
    
    Final statistics:
      Job   0 -- Response: 0.00  Turnaround 298.00  Wait 198.00
      Job   1 -- Response: 1.00  Turnaround 499.00  Wait 299.00
      Job   2 -- Response: 2.00  Turnaround 600.00  Wait 300.00
    
      Average -- Response: 1.00  Turnaround 465.67  Wait 265.67
    ```

  * **300, 200, 100**

    ```bash
    python3 ./scheduler.py -p RR -l 300,200,100 -s 100-c
    ARG policy RR
    ARG jlist 300,200,100
    
    Here is the job list, with the run time of each job: 
      Job 0 ( length = 300.0 )
      Job 1 ( length = 200.0 )
      Job 2 ( length = 100.0 )
    
    Final statistics:
      Job   0 -- Response: 0.00  Turnaround 600.00  Wait 300.00
      Job   1 -- Response: 1.00  Turnaround 500.00  Wait 300.00
      Job   2 -- Response: 2.00  Turnaround 300.00  Wait 200.00
    
      Average -- Response: 1.00  Turnaround 466.67  Wait 266.67
    ```

    Pretty the same for both RR, with response times away faster than FIFO and SJF, but turnaround away worse!
4. **For what types of workloads does SJF deliver the same turnaround times as FIFO?**

  When they are sorted from smaller to larger.
5. **For what types of workloads and quantum lengths does SJF deliver the same response times as RR?**

  When the workloads have the same length, which is the same as the quantum length:

  ```bash
  ## RR
  python3 ./scheduler.py -p RR -l 10,10,10 -s 100 -q 10 -c
  ARG policy RR
  ARG jlist 10,10,10
  
  Here is the job list, with the run time of each job: 
    Job 0 ( length = 10.0 )
    Job 1 ( length = 10.0 )
    Job 2 ( length = 10.0 )
  
  
  ** Solutions **
  
  Execution trace:
    [ time   0 ] Run job   0 for 10.00 secs ( DONE at 10.00 )
    [ time  10 ] Run job   1 for 10.00 secs ( DONE at 20.00 )
    [ time  20 ] Run job   2 for 10.00 secs ( DONE at 30.00 )
  
  Final statistics:
    Job   0 -- Response: 0.00  Turnaround 10.00  Wait 0.00
    Job   1 -- Response: 10.00  Turnaround 20.00  Wait 10.00
    Job   2 -- Response: 20.00  Turnaround 30.00  Wait 20.00
  
    Average -- Response: 10.00  Turnaround 20.00  Wait 10.00
  
  # --------------------------------------------------------------------------
  # SJF
  python3 ./scheduler.py -p SJF -l 10,10,10 -s 100 -c
  ARG policy SJF
  ARG jlist 10,10,10
  
  Here is the job list, with the run time of each job: 
    Job 0 ( length = 10.0 )
    Job 1 ( length = 10.0 )
    Job 2 ( length = 10.0 )
  
  
  ** Solutions **
  
  Execution trace:
    [ time   0 ] Run job 0 for 10.00 secs ( DONE at 10.00 )
    [ time  10 ] Run job 1 for 10.00 secs ( DONE at 20.00 )
    [ time  20 ] Run job 2 for 10.00 secs ( DONE at 30.00 )
  
  Final statistics:
    Job   0 -- Response: 0.00  Turnaround 10.00  Wait 0.00
    Job   1 -- Response: 10.00  Turnaround 20.00  Wait 10.00
    Job   2 -- Response: 20.00  Turnaround 30.00  Wait 20.00
  
    Average -- Response: 10.00  Turnaround 20.00  Wait 10.00
  
  ```

  
6. **What happens to response time with SJF as job lengths increase? Can you use the simulator to demonstrate the trend?**

  They increase too, as the response time is the turnaround time of the previous job.

  ```bash
  python3 ./scheduler.py -p SJF -l 10,20,30,40,50,60 -s 100 -c
  ARG policy SJF
  ARG jlist 10,20,30,40,50,60
  
  Here is the job list, with the run time of each job: 
    Job 0 ( length = 10.0 )
    Job 1 ( length = 20.0 )
    Job 2 ( length = 30.0 )
    Job 3 ( length = 40.0 )
    Job 4 ( length = 50.0 )
    Job 5 ( length = 60.0 )
  
  
  ** Solutions **
  
  Execution trace:
    [ time   0 ] Run job 0 for 10.00 secs ( DONE at 10.00 )
    [ time  10 ] Run job 1 for 20.00 secs ( DONE at 30.00 )
    [ time  30 ] Run job 2 for 30.00 secs ( DONE at 60.00 )
    [ time  60 ] Run job 3 for 40.00 secs ( DONE at 100.00 )
    [ time 100 ] Run job 4 for 50.00 secs ( DONE at 150.00 )
    [ time 150 ] Run job 5 for 60.00 secs ( DONE at 210.00 )
  
  Final statistics:
    Job   0 -- Response: 0.00  Turnaround 10.00  Wait 0.00
    Job   1 -- Response: 10.00  Turnaround 30.00  Wait 10.00
    Job   2 -- Response: 30.00  Turnaround 60.00  Wait 30.00
    Job   3 -- Response: 60.00  Turnaround 100.00  Wait 60.00
    Job   4 -- Response: 100.00  Turnaround 150.00  Wait 100.00
    Job   5 -- Response: 150.00  Turnaround 210.00  Wait 150.00
  
    Average -- Response: 58.33  Turnaround 93.33  Wait 58.33
  
  ```
7. **What happens to response time with RR as quantum lengths increase? Can you write an equation that gives the worst-case response time, given $N$ jobs?**

  It linearly increases:

  ```bash
  # 1 s
  python3 ./scheduler.py -p RR -l 10,20,30,40,50,60 -s 100 -c
  ARG policy RR
  ARG jlist 10,20,30,40,50,60
  
  Here is the job list, with the run time of each job: 
    Job 0 ( length = 10.0 )
    Job 1 ( length = 20.0 )
    Job 2 ( length = 30.0 )
    Job 3 ( length = 40.0 )
    Job 4 ( length = 50.0 )
    Job 5 ( length = 60.0 )
    
  Final statistics:
    Job   0 -- Response: 0.00  Turnaround 55.00  Wait 45.00
    Job   1 -- Response: 1.00  Turnaround 106.00  Wait 86.00
    Job   2 -- Response: 2.00  Turnaround 147.00  Wait 117.00
    Job   3 -- Response: 3.00  Turnaround 178.00  Wait 138.00
    Job   4 -- Response: 4.00  Turnaround 199.00  Wait 149.00
    Job   5 -- Response: 5.00  Turnaround 210.00  Wait 150.00
  
    Average -- Response: 2.50  Turnaround 149.17  Wait 114.17
  
  # 5 s 
  python3 ./scheduler.py -p RR -l 10,20,30,40,50,60 -s 100 -q 5 -c
  ARG policy RR
  ARG jlist 10,20,30,40,50,60
  
  Here is the job list, with the run time of each job: 
    Job 0 ( length = 10.0 )
    Job 1 ( length = 20.0 )
    Job 2 ( length = 30.0 )
    Job 3 ( length = 40.0 )
    Job 4 ( length = 50.0 )
    Job 5 ( length = 60.0 )
  
  Final statistics:
    Job   0 -- Response: 0.00  Turnaround 35.00  Wait 25.00
    Job   1 -- Response: 5.00  Turnaround 90.00  Wait 70.00
    Job   2 -- Response: 10.00  Turnaround 135.00  Wait 105.00
    Job   3 -- Response: 15.00  Turnaround 170.00  Wait 130.00
    Job   4 -- Response: 20.00  Turnaround 195.00  Wait 145.00
    Job   5 -- Response: 25.00  Turnaround 210.00  Wait 150.00
  
    Average -- Response: 12.50  Turnaround 139.17  Wait 104.17
  ```

  The worst time possible will be for the last one to be executed, so it is $Q_t \cdot (N - 1)$ and the average will be just half of it: $\frac {Q_t \cdot (N - 1)} 2$.
