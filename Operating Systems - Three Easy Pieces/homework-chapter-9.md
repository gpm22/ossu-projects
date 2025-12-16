# 9 - Scheduling: Proportional Share

## Homework (Simulation)

This program, `lottery.py`, allows you to see how a lottery scheduler works.
See the README for details.

## Questions

1. **Compute the solutions for simulations with 3 jobs and random seeds of 1, 2, and 3.**

  ```bash
  #simulation 1
  prompt> python3 lottery.py -j 3 -s 1 -c
  ARG jlist 
  ARG jobs 3
  ARG maxlen 10
  ARG maxticket 100
  ARG quantum 1
  ARG seed 1
  
  Here is the job list, with the run time of each job: 
    Job 0 ( length = 1, tickets = 84 )
    Job 1 ( length = 7, tickets = 25 )
    Job 2 ( length = 4, tickets = 44 )
  
  
  ** Solutions **
  
  Random 651593 -> Winning ticket 119 (of 153) -> Run 2
    Jobs: (  job:0 timeleft:1 tix:84 )  (  job:1 timeleft:7 tix:25 )  (* job:2 timeleft:4 tix:44 ) 
  Random 788724 -> Winning ticket 9 (of 153) -> Run 0
    Jobs: (* job:0 timeleft:1 tix:84 )  (  job:1 timeleft:7 tix:25 )  (  job:2 timeleft:3 tix:44 ) 
  --> JOB 0 DONE at time 2
  Random 93859 -> Winning ticket 19 (of 69) -> Run 1
    Jobs: (  job:0 timeleft:0 tix:--- )  (* job:1 timeleft:7 tix:25 )  (  job:2 timeleft:3 tix:44 ) 
  Random 28347 -> Winning ticket 57 (of 69) -> Run 2
    Jobs: (  job:0 timeleft:0 tix:--- )  (  job:1 timeleft:6 tix:25 )  (* job:2 timeleft:3 tix:44 ) 
  Random 835765 -> Winning ticket 37 (of 69) -> Run 2
    Jobs: (  job:0 timeleft:0 tix:--- )  (  job:1 timeleft:6 tix:25 )  (* job:2 timeleft:2 tix:44 ) 
  Random 432767 -> Winning ticket 68 (of 69) -> Run 2
    Jobs: (  job:0 timeleft:0 tix:--- )  (  job:1 timeleft:6 tix:25 )  (* job:2 timeleft:1 tix:44 ) 
  --> JOB 2 DONE at time 6
  Random 762280 -> Winning ticket 5 (of 25) -> Run 1
    Jobs: (  job:0 timeleft:0 tix:--- )  (* job:1 timeleft:6 tix:25 )  (  job:2 timeleft:0 tix:--- ) 
  Random 2106 -> Winning ticket 6 (of 25) -> Run 1
    Jobs: (  job:0 timeleft:0 tix:--- )  (* job:1 timeleft:5 tix:25 )  (  job:2 timeleft:0 tix:--- ) 
  Random 445387 -> Winning ticket 12 (of 25) -> Run 1
    Jobs: (  job:0 timeleft:0 tix:--- )  (* job:1 timeleft:4 tix:25 )  (  job:2 timeleft:0 tix:--- ) 
  Random 721540 -> Winning ticket 15 (of 25) -> Run 1
    Jobs: (  job:0 timeleft:0 tix:--- )  (* job:1 timeleft:3 tix:25 )  (  job:2 timeleft:0 tix:--- ) 
  Random 228762 -> Winning ticket 12 (of 25) -> Run 1
    Jobs: (  job:0 timeleft:0 tix:--- )  (* job:1 timeleft:2 tix:25 )  (  job:2 timeleft:0 tix:--- ) 
  Random 945271 -> Winning ticket 21 (of 25) -> Run 1
    Jobs: (  job:0 timeleft:0 tix:--- )  (* job:1 timeleft:1 tix:25 )  (  job:2 timeleft:0 tix:--- ) 
  --> JOB 1 DONE at time 12
  
  # Simulation 2
  prompt: python3 lottery.py -j 3 -s 2 -c
  ARG jlist 
  ARG jobs 3
  ARG maxlen 10
  ARG maxticket 100
  ARG quantum 1
  ARG seed 2
  
  Here is the job list, with the run time of each job: 
    Job 0 ( length = 9, tickets = 94 )
    Job 1 ( length = 8, tickets = 73 )
    Job 2 ( length = 6, tickets = 30 )
  
  
  ** Solutions **
  
  Random 605944 -> Winning ticket 169 (of 197) -> Run 2
    Jobs: (  job:0 timeleft:9 tix:94 )  (  job:1 timeleft:8 tix:73 )  (* job:2 timeleft:6 tix:30 ) 
  Random 606802 -> Winning ticket 42 (of 197) -> Run 0
    Jobs: (* job:0 timeleft:9 tix:94 )  (  job:1 timeleft:8 tix:73 )  (  job:2 timeleft:5 tix:30 ) 
  Random 581204 -> Winning ticket 54 (of 197) -> Run 0
    Jobs: (* job:0 timeleft:8 tix:94 )  (  job:1 timeleft:8 tix:73 )  (  job:2 timeleft:5 tix:30 ) 
  Random 158383 -> Winning ticket 192 (of 197) -> Run 2
    Jobs: (  job:0 timeleft:7 tix:94 )  (  job:1 timeleft:8 tix:73 )  (* job:2 timeleft:5 tix:30 ) 
  Random 430670 -> Winning ticket 28 (of 197) -> Run 0
    Jobs: (* job:0 timeleft:7 tix:94 )  (  job:1 timeleft:8 tix:73 )  (  job:2 timeleft:4 tix:30 ) 
  Random 393532 -> Winning ticket 123 (of 197) -> Run 1
    Jobs: (  job:0 timeleft:6 tix:94 )  (* job:1 timeleft:8 tix:73 )  (  job:2 timeleft:4 tix:30 ) 
  Random 723012 -> Winning ticket 22 (of 197) -> Run 0
    Jobs: (* job:0 timeleft:6 tix:94 )  (  job:1 timeleft:7 tix:73 )  (  job:2 timeleft:4 tix:30 ) 
  Random 994820 -> Winning ticket 167 (of 197) -> Run 2
    Jobs: (  job:0 timeleft:5 tix:94 )  (  job:1 timeleft:7 tix:73 )  (* job:2 timeleft:4 tix:30 ) 
  Random 949396 -> Winning ticket 53 (of 197) -> Run 0
    Jobs: (* job:0 timeleft:5 tix:94 )  (  job:1 timeleft:7 tix:73 )  (  job:2 timeleft:3 tix:30 ) 
  Random 544177 -> Winning ticket 63 (of 197) -> Run 0
    Jobs: (* job:0 timeleft:4 tix:94 )  (  job:1 timeleft:7 tix:73 )  (  job:2 timeleft:3 tix:30 ) 
  Random 444854 -> Winning ticket 28 (of 197) -> Run 0
    Jobs: (* job:0 timeleft:3 tix:94 )  (  job:1 timeleft:7 tix:73 )  (  job:2 timeleft:3 tix:30 ) 
  Random 268241 -> Winning ticket 124 (of 197) -> Run 1
    Jobs: (  job:0 timeleft:2 tix:94 )  (* job:1 timeleft:7 tix:73 )  (  job:2 timeleft:3 tix:30 ) 
  Random 35924 -> Winning ticket 70 (of 197) -> Run 0
    Jobs: (* job:0 timeleft:2 tix:94 )  (  job:1 timeleft:6 tix:73 )  (  job:2 timeleft:3 tix:30 ) 
  Random 27444 -> Winning ticket 61 (of 197) -> Run 0
    Jobs: (* job:0 timeleft:1 tix:94 )  (  job:1 timeleft:6 tix:73 )  (  job:2 timeleft:3 tix:30 ) 
  --> JOB 0 DONE at time 14
  Random 464894 -> Winning ticket 55 (of 103) -> Run 1
    Jobs: (  job:0 timeleft:0 tix:--- )  (* job:1 timeleft:6 tix:73 )  (  job:2 timeleft:3 tix:30 ) 
  Random 318465 -> Winning ticket 92 (of 103) -> Run 2
    Jobs: (  job:0 timeleft:0 tix:--- )  (  job:1 timeleft:5 tix:73 )  (* job:2 timeleft:3 tix:30 ) 
  Random 380015 -> Winning ticket 48 (of 103) -> Run 1
    Jobs: (  job:0 timeleft:0 tix:--- )  (* job:1 timeleft:5 tix:73 )  (  job:2 timeleft:2 tix:30 ) 
  Random 891790 -> Winning ticket 16 (of 103) -> Run 1
    Jobs: (  job:0 timeleft:0 tix:--- )  (* job:1 timeleft:4 tix:73 )  (  job:2 timeleft:2 tix:30 ) 
  Random 525753 -> Winning ticket 41 (of 103) -> Run 1
    Jobs: (  job:0 timeleft:0 tix:--- )  (* job:1 timeleft:3 tix:73 )  (  job:2 timeleft:2 tix:30 ) 
  Random 560510 -> Winning ticket 87 (of 103) -> Run 2
    Jobs: (  job:0 timeleft:0 tix:--- )  (  job:1 timeleft:2 tix:73 )  (* job:2 timeleft:2 tix:30 ) 
  Random 236123 -> Winning ticket 47 (of 103) -> Run 1
    Jobs: (  job:0 timeleft:0 tix:--- )  (* job:1 timeleft:2 tix:73 )  (  job:2 timeleft:1 tix:30 ) 
  Random 23858 -> Winning ticket 65 (of 103) -> Run 1
    Jobs: (  job:0 timeleft:0 tix:--- )  (* job:1 timeleft:1 tix:73 )  (  job:2 timeleft:1 tix:30 ) 
  --> JOB 1 DONE at time 22
  Random 325143 -> Winning ticket 3 (of 30) -> Run 2
    Jobs: (  job:0 timeleft:0 tix:--- )  (  job:1 timeleft:0 tix:--- )  (* job:2 timeleft:1 tix:30 ) 
  --> JOB 2 DONE at time 23
  
  # Simulation 3
  prompt> python3 lottery.py -j 3 -s 3 -c
  ARG jlist 
  ARG jobs 3
  ARG maxlen 10
  ARG maxticket 100
  ARG quantum 1
  ARG seed 3
  
  Here is the job list, with the run time of each job: 
    Job 0 ( length = 2, tickets = 54 )
    Job 1 ( length = 3, tickets = 60 )
    Job 2 ( length = 6, tickets = 6 )
  
  
  ** Solutions **
  
  Random 13168 -> Winning ticket 88 (of 120) -> Run 1
    Jobs: (  job:0 timeleft:2 tix:54 )  (* job:1 timeleft:3 tix:60 )  (  job:2 timeleft:6 tix:6 ) 
  Random 837469 -> Winning ticket 109 (of 120) -> Run 1
    Jobs: (  job:0 timeleft:2 tix:54 )  (* job:1 timeleft:2 tix:60 )  (  job:2 timeleft:6 tix:6 ) 
  Random 259354 -> Winning ticket 34 (of 120) -> Run 0
    Jobs: (* job:0 timeleft:2 tix:54 )  (  job:1 timeleft:1 tix:60 )  (  job:2 timeleft:6 tix:6 ) 
  Random 234331 -> Winning ticket 91 (of 120) -> Run 1
    Jobs: (  job:0 timeleft:1 tix:54 )  (* job:1 timeleft:1 tix:60 )  (  job:2 timeleft:6 tix:6 ) 
  --> JOB 1 DONE at time 4
  Random 995645 -> Winning ticket 5 (of 60) -> Run 0
    Jobs: (* job:0 timeleft:1 tix:54 )  (  job:1 timeleft:0 tix:--- )  (  job:2 timeleft:6 tix:6 ) 
  --> JOB 0 DONE at time 5
  Random 470263 -> Winning ticket 1 (of 6) -> Run 2
    Jobs: (  job:0 timeleft:0 tix:--- )  (  job:1 timeleft:0 tix:--- )  (* job:2 timeleft:6 tix:6 ) 
  Random 836462 -> Winning ticket 2 (of 6) -> Run 2
    Jobs: (  job:0 timeleft:0 tix:--- )  (  job:1 timeleft:0 tix:--- )  (* job:2 timeleft:5 tix:6 ) 
  Random 476353 -> Winning ticket 1 (of 6) -> Run 2
    Jobs: (  job:0 timeleft:0 tix:--- )  (  job:1 timeleft:0 tix:--- )  (* job:2 timeleft:4 tix:6 ) 
  Random 639068 -> Winning ticket 2 (of 6) -> Run 2
    Jobs: (  job:0 timeleft:0 tix:--- )  (  job:1 timeleft:0 tix:--- )  (* job:2 timeleft:3 tix:6 ) 
  Random 150616 -> Winning ticket 4 (of 6) -> Run 2
    Jobs: (  job:0 timeleft:0 tix:--- )  (  job:1 timeleft:0 tix:--- )  (* job:2 timeleft:2 tix:6 ) 
  Random 634861 -> Winning ticket 1 (of 6) -> Run 2
    Jobs: (  job:0 timeleft:0 tix:--- )  (  job:1 timeleft:0 tix:--- )  (* job:2 timeleft:1 tix:6 ) 
  --> JOB 2 DONE at time 11
  ```

  
2. **Now run with two specific jobs: each of length 10, but one (job 0) with 1 ticket and the other (job 1) with 100 (e.g., `-l 10:1,10:100`). **

  ```bash
  prompt> python3 lottery.py -l 10:1,10:100 -c
  ARG jlist 10:1,10:100
  ARG jobs 3
  ARG maxlen 10
  ARG maxticket 100
  ARG quantum 1
  ARG seed 0
  
  Here is the job list, with the run time of each job: 
    Job 0 ( length = 10, tickets = 1 )
    Job 1 ( length = 10, tickets = 100 )
  
  
  ** Solutions **
  
  Random 844422 -> Winning ticket 62 (of 101) -> Run 1
    Jobs: (  job:0 timeleft:10 tix:1 )  (* job:1 timeleft:10 tix:100 ) 
  Random 757955 -> Winning ticket 51 (of 101) -> Run 1
    Jobs: (  job:0 timeleft:10 tix:1 )  (* job:1 timeleft:9 tix:100 ) 
  Random 420572 -> Winning ticket 8 (of 101) -> Run 1
    Jobs: (  job:0 timeleft:10 tix:1 )  (* job:1 timeleft:8 tix:100 ) 
  Random 258917 -> Winning ticket 54 (of 101) -> Run 1
    Jobs: (  job:0 timeleft:10 tix:1 )  (* job:1 timeleft:7 tix:100 ) 
  Random 511275 -> Winning ticket 13 (of 101) -> Run 1
    Jobs: (  job:0 timeleft:10 tix:1 )  (* job:1 timeleft:6 tix:100 ) 
  Random 404934 -> Winning ticket 25 (of 101) -> Run 1
    Jobs: (  job:0 timeleft:10 tix:1 )  (* job:1 timeleft:5 tix:100 ) 
  Random 783799 -> Winning ticket 39 (of 101) -> Run 1
    Jobs: (  job:0 timeleft:10 tix:1 )  (* job:1 timeleft:4 tix:100 ) 
  Random 303313 -> Winning ticket 10 (of 101) -> Run 1
    Jobs: (  job:0 timeleft:10 tix:1 )  (* job:1 timeleft:3 tix:100 ) 
  Random 476597 -> Winning ticket 79 (of 101) -> Run 1
    Jobs: (  job:0 timeleft:10 tix:1 )  (* job:1 timeleft:2 tix:100 ) 
  Random 583382 -> Winning ticket 6 (of 101) -> Run 1
    Jobs: (  job:0 timeleft:10 tix:1 )  (* job:1 timeleft:1 tix:100 ) 
  --> JOB 1 DONE at time 10
  Random 908113 -> Winning ticket 0 (of 1) -> Run 0
    Jobs: (* job:0 timeleft:10 tix:1 )  (  job:1 timeleft:0 tix:--- ) 
  Random 504687 -> Winning ticket 0 (of 1) -> Run 0
    Jobs: (* job:0 timeleft:9 tix:1 )  (  job:1 timeleft:0 tix:--- ) 
  Random 281838 -> Winning ticket 0 (of 1) -> Run 0
    Jobs: (* job:0 timeleft:8 tix:1 )  (  job:1 timeleft:0 tix:--- ) 
  Random 755804 -> Winning ticket 0 (of 1) -> Run 0
    Jobs: (* job:0 timeleft:7 tix:1 )  (  job:1 timeleft:0 tix:--- ) 
  Random 618369 -> Winning ticket 0 (of 1) -> Run 0
    Jobs: (* job:0 timeleft:6 tix:1 )  (  job:1 timeleft:0 tix:--- ) 
  Random 250506 -> Winning ticket 0 (of 1) -> Run 0
    Jobs: (* job:0 timeleft:5 tix:1 )  (  job:1 timeleft:0 tix:--- ) 
  Random 909747 -> Winning ticket 0 (of 1) -> Run 0
    Jobs: (* job:0 timeleft:4 tix:1 )  (  job:1 timeleft:0 tix:--- ) 
  Random 982786 -> Winning ticket 0 (of 1) -> Run 0
    Jobs: (* job:0 timeleft:3 tix:1 )  (  job:1 timeleft:0 tix:--- ) 
  Random 810218 -> Winning ticket 0 (of 1) -> Run 0
    Jobs: (* job:0 timeleft:2 tix:1 )  (  job:1 timeleft:0 tix:--- ) 
  Random 902166 -> Winning ticket 0 (of 1) -> Run 0
    Jobs: (* job:0 timeleft:1 tix:1 )  (  job:1 timeleft:0 tix:--- ) 
  --> JOB 0 DONE at time 20
  ```

  **What happens when the number of tickets is so imbalanced?**
  The job with more tickets just hijacks the whole CPU.

  **Will job 0 ever run before job 1 completes?**

  It is possible, but highly unlikely.

  **How often?**

  $\frac 1 {101}$, thus ~1% of the time.

  **In general, what does such a ticket imbalance do to the behavior of lottery scheduling?**

  Transforms it in an ordered list sorted by ticket number.
3. **When running with two jobs of length 100 and equal ticket allocations of 100 (`-l 100:100,100:100`), how unfair is the scheduler? Run with some different random seeds to determine the (probabilistic) answer; let unfairness be determined by how much earlier one job finishes than the other.**

  ```bash
  # run 1
  prompt>  python3 lottery.py -l 100:100,100:100 -c -s 0
  
  --> JOB 0 DONE at time 192
  --> JOB 1 DONE at time 200
  
  # run 2 
  python3 lottery.py -l 100:100,100:100 -c -s 1
  
  --> JOB 1 DONE at time 196
  --> JOB 0 DONE at time 200
  
  # run 3 
  python3 lottery.py -l 100:100,100:100 -c -s 2
  
  --> JOB 1 DONE at time 190
  --> JOB 0 DONE at time 200
  
  # run 4 
  python3 lottery.py -l 100:100,100:100 -c -s 3
  
  --> JOB 0 DONE at time 196
  --> JOB 1 DONE at time 200
  
  # run 5
  python3 lottery.py -l 100:100,100:100 -c -s 4
  
  --> JOB 1 DONE at time 199
  --> JOB 0 DONE at time 200
  
  # run 6
  python3 lottery.py -l 100:100,100:100 -c -s 5
  
  --> JOB 1 DONE at time 181
  --> JOB 0 DONE at time 200
  
  # run 7
  python3 lottery.py -l 100:100,100:100 -c -s 6
  
  --> JOB 1 DONE at time 193
  --> JOB 0 DONE at time 200
  
  # run 8
  python3 lottery.py -l 100:100,100:100 -c -s 7
  
  --> JOB 1 DONE at time 185
  --> JOB 0 DONE at time 200
  
  # run 9
  python3 lottery.py -l 100:100,100:100 -c -s 8
  
  --> JOB 1 DONE at time 191
  --> JOB 0 DONE at time 200
  
  # run 10
  python3 lottery.py -l 100:100,100:100 -c -s 9
  
  --> JOB 1 DONE at time 192
  --> JOB 0 DONE at time 200
  ```

  The average unfairness is around 8.5 s, as the total time is 200s, this means that a job finishes 4.25% earlier than the other.
4. **How does your answer to the previous question change as the quantum size (`-q`) gets larger?**

  ```bash
  # run 1
  prompt> python3 lottery.py -l 100:100,100:100 -c -s 9 -q 1
  
  --> JOB 1 DONE at time 192
  --> JOB 0 DONE at time 200
  --> unfairness 8
  
  # run 2
  prompt> python3 lottery.py -l 100:100,100:100 -c -s 9 -q 2
  
  --> JOB 1 DONE at time 196
  --> JOB 0 DONE at time 200
  --> unfairness 4
  
  # run 3
  prompt> python3 lottery.py -l 100:100,100:100 -c -s 9 -q 3
  
  --> JOB 1 DONE at time 180
  --> JOB 0 DONE at time 204
  --> unfairness 24
  
  # run 4
  prompt> python3 lottery.py -l 100:100,100:100 -c -s 9 -q 4
  
  --> JOB 0 DONE at time 164
  --> JOB 1 DONE at time 200
  --> unfairness 36
  
  # run 5
  prompt> python3 lottery.py -l 100:100,100:100 -c -s 9 -q 5
  
  --> JOB 1 DONE at time 135
  --> JOB 0 DONE at time 200
  --> unfairness 65
  
  # run 6
  prompt> python3 lottery.py -l 100:100,100:100 -c -s 9 -q 6
  
  --> JOB 1 DONE at time 138
  --> JOB 0 DONE at time 204
  --> unfairness 66
  
  # run 7
  prompt> python3 lottery.py -l 100:100,100:100 -c -s 9 -q 7
  
  --> JOB 1 DONE at time 147
  --> JOB 0 DONE at time 210
  --> unfairness 73
  
  # run 8
  prompt> python3 lottery.py -l 100:100,100:100 -c -s 9 -q 8
  
  --> JOB 0 DONE at time 152
  --> JOB 1 DONE at time 208
  --> unfairness 56
  
  # run 9
  prompt> python3 lottery.py -l 100:100,100:100 -c -s 9 -q 9
  
  --> JOB 0 DONE at time 153
  --> JOB 1 DONE at time 216
  --> unfairness 63
  
  # run 10
  prompt> python3 lottery.py -l 100:100,100:100 -c -s 9 -q 10
  
  --> JOB 0 DONE at time 140
  --> JOB 1 DONE at time 200
  --> unfairness 60
  
  ```

  The unfairness increases with `q`, but it stabilizes around 60s.
5. **Can you make a version of the graph that is found in the chapter?**

  ```bash
  # 1
  prompt> python3 lottery.py -l 10:100,10:100 -c
  
  --> JOB 1 DONE at time 2
  --> JOB 0 DONE at time 11
  --> fairness = 0.18
  
  # 2
  prompt> python3 lottery.py -l 15:100,15:100 -c
  
  --> JOB 1 DONE at time 21
  --> JOB 0 DONE at time 30
  --> fairness = 0.7
  
  # 3
  prompt> python3 lottery.py -l 20:100,20:100 -c
  
  --> JOB 1 DONE at time 32
  --> JOB 0 DONE at time 40
  --> fairness = 0.8
  
  # 4
  prompt> python3 lottery.py -l 30:100,30:100 -c
  
  --> JOB 1 DONE at time 55
  --> JOB 0 DONE at time 60
  --> fairness = 0.91
  
  # 5
  prompt> python3 lottery.py -l 40:100,40:100 -c
  
  --> JOB 1 DONE at time 78
  --> JOB 0 DONE at time 80
  --> fairness = 0.975
  
  # 6
  prompt> python3 lottery.py -l 50:100,50:100 -c
  
  --> JOB 0 DONE at time 94
  --> JOB 1 DONE at time 100
  --> fairness = 0.94
  
  # 7
  prompt> python3 lottery.py -l 60:100,60:100 -c
  
  --> JOB 1 DONE at time 114
  --> JOB 0 DONE at time 120
  --> fairness = 0.95
  
  # 8
  prompt> python3 lottery.py -l 100:100,100:100 -c
  
  --> JOB 0 DONE at time 192
  --> JOB 1 DONE at time 200
  --> fairness = 0.96
  ```

  **How would the graph look with a stride scheduler**

  Considering the length and tickets are the same, thus also their stride.

  The graph would be the curve of $\frac { n-1} n$, almost a line at 1 for $n > 10$.
