# 4 - The Abstraction: The Process

## 1

The CPU was used 100 %, as it showed cpu in all iterations:

```bash
python process-run.py -l 5:100,5:100
Produce a trace of what would happen when you run these processes:
Process 0
  cpu
  cpu
  cpu
  cpu
  cpu

Process 1
  cpu
  cpu
  cpu
  cpu
  cpu
```

Running with `-cp` shows I am correct:

```bash
Time        PID: 0        PID: 1           CPU           IOs
  1        RUN:cpu         READY             1
  2        RUN:cpu         READY             1
  3        RUN:cpu         READY             1
  4        RUN:cpu         READY             1
  5        RUN:cpu         READY             1
  6           DONE       RUN:cpu             1
  7           DONE       RUN:cpu             1
  8           DONE       RUN:cpu             1
  9           DONE       RUN:cpu             1
 10           DONE       RUN:cpu             1

Stats: Total Time 10
Stats: CPU Busy 10 (100.00%)
Stats: IO Busy  0 (0.00%)
```

## 2

`./process-run.py -l 4:100,1:0` takes  6 iterations to conclude, so it total time will be 7.

Running with `-cp` shows I am incorrect, daaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaang:

```bash
python process-run.py -l 4:100,1:0 -cp
Time        PID: 0        PID: 1           CPU           IOs
  1        RUN:cpu         READY             1
  2        RUN:cpu         READY             1
  3        RUN:cpu         READY             1
  4        RUN:cpu         READY             1
  5           DONE        RUN:io             1
  6           DONE       BLOCKED                           1
  7           DONE       BLOCKED                           1
  8           DONE       BLOCKED                           1
  9           DONE       BLOCKED                           1
 10           DONE       BLOCKED                           1
 11*          DONE   RUN:io_done             1

Stats: Total Time 11
Stats: CPU Busy 6 (54.55%)
Stats: IO Busy  5 (45.45%)
```

IO used 5 iterations instead of 1 to run.

## 3

It does not seem to matter, as process 0 finishes before process 1 started, so it is mono-thread:

```bash
python process-run.py -l 1:0,4:100
Produce a trace of what would happen when you run these processes:
Process 0
  io
  io_done

Process 1
  cpu
  cpu
  cpu
  cpu
```



Running with `-cp` shows I am incorrect, daaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaang:

```bash
python process-run.py -l 1:0,4:100 -cp
Time        PID: 0        PID: 1           CPU           IOs
  1         RUN:io         READY             1
  2        BLOCKED       RUN:cpu             1             1
  3        BLOCKED       RUN:cpu             1             1
  4        BLOCKED       RUN:cpu             1             1
  5        BLOCKED       RUN:cpu             1             1
  6        BLOCKED          DONE                           1
  7*   RUN:io_done          DONE             1

Stats: Total Time 7
Stats: CPU Busy 6 (85.71%)
Stats: IO Busy  5 (71.43%)

```

It is not mono-thread, I totally misunderstood the output, so the cpu was used by process 1 while process 0 was waiting for the IO.
So process 1 started and concluded while process 0 was waiting for the IO.

## 4

Using `SWITCH_ON_END` makes the system mono-thread, so it will take time total of 11.

Running with `-cp` shows I am correct:

```bash
python process-run.py -l 1:0,4:100 -cp -S SWITCH_ON_END
Time        PID: 0        PID: 1           CPU           IOs
  1         RUN:io         READY             1
  2        BLOCKED         READY                           1
  3        BLOCKED         READY                           1
  4        BLOCKED         READY                           1
  5        BLOCKED         READY                           1
  6        BLOCKED         READY                           1
  7*   RUN:io_done         READY             1
  8           DONE       RUN:cpu             1
  9           DONE       RUN:cpu             1
 10           DONE       RUN:cpu             1
 11           DONE       RUN:cpu             1

Stats: Total Time 11
Stats: CPU Busy 6 (54.55%)
Stats: IO Busy  5 (45.45%)
```

## 5

Using `SWITCH_ON_IO` will make the system have the default behavior, which is the same as question 3, so it will take time total of 7.

Running with `-cp` shows I am correct:

```bash
 python process-run.py -l 1:0,4:100 -S SWITCH_ON_IO -cp
Time        PID: 0        PID: 1           CPU           IOs
  1         RUN:io         READY             1
  2        BLOCKED       RUN:cpu             1             1
  3        BLOCKED       RUN:cpu             1             1
  4        BLOCKED       RUN:cpu             1             1
  5        BLOCKED       RUN:cpu             1             1
  6        BLOCKED          DONE                           1
  7*   RUN:io_done          DONE             1

Stats: Total Time 7
Stats: CPU Busy 6 (85.71%)
Stats: IO Busy  5 (71.43%)

```

## 6

With `IO_RUN_LATER` the system will have the default behavior of waiting for the other process to conclude, the same as question 3.

For the combination `3:0,5:100,5:100,5:100`, it first start an IO, finishes an cpu only process, start an IO, etc. So it will take a time total of 21.

Running with `-cp` shows I am incorrect, daaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaang:

```bash
python process-run.py -l 3:0,5:100,5:100,5:100 -S SWITCH_ON_IO -I IO_RUN_LATER -cp
Time        PID: 0        PID: 1        PID: 2        PID: 3           CPU           IOs
  1         RUN:io         READY         READY         READY             1
  2        BLOCKED       RUN:cpu         READY         READY             1             1
  3        BLOCKED       RUN:cpu         READY         READY             1             1
  4        BLOCKED       RUN:cpu         READY         READY             1             1
  5        BLOCKED       RUN:cpu         READY         READY             1             1
  6        BLOCKED       RUN:cpu         READY         READY             1             1
  7*         READY          DONE       RUN:cpu         READY             1
  8          READY          DONE       RUN:cpu         READY             1
  9          READY          DONE       RUN:cpu         READY             1
 10          READY          DONE       RUN:cpu         READY             1
 11          READY          DONE       RUN:cpu         READY             1
 12          READY          DONE          DONE       RUN:cpu             1
 13          READY          DONE          DONE       RUN:cpu             1
 14          READY          DONE          DONE       RUN:cpu             1
 15          READY          DONE          DONE       RUN:cpu             1
 16          READY          DONE          DONE       RUN:cpu             1
 17    RUN:io_done          DONE          DONE          DONE             1
 18         RUN:io          DONE          DONE          DONE             1
 19        BLOCKED          DONE          DONE          DONE                           1
 20        BLOCKED          DONE          DONE          DONE                           1
 21        BLOCKED          DONE          DONE          DONE                           1
 22        BLOCKED          DONE          DONE          DONE                           1
 23        BLOCKED          DONE          DONE          DONE                           1
 24*   RUN:io_done          DONE          DONE          DONE             1
 25         RUN:io          DONE          DONE          DONE             1
 26        BLOCKED          DONE          DONE          DONE                           1
 27        BLOCKED          DONE          DONE          DONE                           1
 28        BLOCKED          DONE          DONE          DONE                           1
 29        BLOCKED          DONE          DONE          DONE                           1
 30        BLOCKED          DONE          DONE          DONE                           1
 31*   RUN:io_done          DONE          DONE          DONE             1

Stats: Total Time 31
Stats: CPU Busy 21 (67.74%)
Stats: IO Busy  15 (48.39%)
```

In reality the first process waits for the three cpu-only processes to finish before it returns of IO, as when the io returned another processed have already begun.

And no, system resources are not being effectively utilized, as returning directly to the io process would have run in less time.

## 7

With `IO_RUN_IMMEDIATE` the system will behavior as I believed before at the start of question 6, so it will take a total time of 21.

Running with `-cp` shows I am correct:

```bash
python process-run.py -l 3:0,5:100,5:100,5:100 -S SWITCH_ON_IO -I IO_RUN_IMMEDIATE -cp
Time        PID: 0        PID: 1        PID: 2        PID: 3           CPU           IOs
  1         RUN:io         READY         READY         READY             1
  2        BLOCKED       RUN:cpu         READY         READY             1             1
  3        BLOCKED       RUN:cpu         READY         READY             1             1
  4        BLOCKED       RUN:cpu         READY         READY             1             1
  5        BLOCKED       RUN:cpu         READY         READY             1             1
  6        BLOCKED       RUN:cpu         READY         READY             1             1
  7*   RUN:io_done          DONE         READY         READY             1
  8         RUN:io          DONE         READY         READY             1
  9        BLOCKED          DONE       RUN:cpu         READY             1             1
 10        BLOCKED          DONE       RUN:cpu         READY             1             1
 11        BLOCKED          DONE       RUN:cpu         READY             1             1
 12        BLOCKED          DONE       RUN:cpu         READY             1             1
 13        BLOCKED          DONE       RUN:cpu         READY             1             1
 14*   RUN:io_done          DONE          DONE         READY             1
 15         RUN:io          DONE          DONE         READY             1
 16        BLOCKED          DONE          DONE       RUN:cpu             1             1
 17        BLOCKED          DONE          DONE       RUN:cpu             1             1
 18        BLOCKED          DONE          DONE       RUN:cpu             1             1
 19        BLOCKED          DONE          DONE       RUN:cpu             1             1
 20        BLOCKED          DONE          DONE       RUN:cpu             1             1
 21*   RUN:io_done          DONE          DONE          DONE             1

Stats: Total Time 21
Stats: CPU Busy 21 (100.00%)
Stats: IO Busy  15 (71.43%)

```

Now the cpu is always busy, which is a more efficient use of the resources.
This show that returning the control to the IO process is a good idea!

## 8

### `-s 1 -l 3:50,3:50`

#### `IO_RUN_IMMEDIATE` and `SWITCH_ON_IO`

It will be the most efficient one.

It took 15 iterations.

#### `IO_RUN_IMMEDIATE` and `SWITCH_ON_END`

With `SWITCH_ON_END` the IO stuff does not matter, as it will have to wait.

It will take 18.

The `-cp` option shows I am correct:

```bash
python process-run.py -s 1 -l 3:50,3:50 -S SWITCH_ON_END -I IO_RUN_IMMEDIATE -cp
Time        PID: 0        PID: 1           CPU           IOs
  1        RUN:cpu         READY             1
  2         RUN:io         READY             1
  3        BLOCKED         READY                           1
  4        BLOCKED         READY                           1
  5        BLOCKED         READY                           1
  6        BLOCKED         READY                           1
  7        BLOCKED         READY                           1
  8*   RUN:io_done         READY             1
  9         RUN:io         READY             1
 10        BLOCKED         READY                           1
 11        BLOCKED         READY                           1
 12        BLOCKED         READY                           1
 13        BLOCKED         READY                           1
 14        BLOCKED         READY                           1
 15*   RUN:io_done         READY             1
 16           DONE       RUN:cpu             1
 17           DONE       RUN:cpu             1
 18           DONE       RUN:cpu             1

Stats: Total Time 18
Stats: CPU Busy 8 (44.44%)
Stats: IO Busy  10 (55.56%)
```



#### `IO_RUN_LATER` and `SWITCH_ON_IO`

As to process 3 cpu only processes take 3 iterations and to process an IO request takes 5, it will 15.

The `-cp` option shows I am correct:

```bash
python process-run.py -s 1 -l 3:50,3:50 -S SWITCH_ON_IO -I IO_RUN_LATER -cp
Time        PID: 0        PID: 1           CPU           IOs
  1        RUN:cpu         READY             1
  2         RUN:io         READY             1
  3        BLOCKED       RUN:cpu             1             1
  4        BLOCKED       RUN:cpu             1             1
  5        BLOCKED       RUN:cpu             1             1
  6        BLOCKED          DONE                           1
  7        BLOCKED          DONE                           1
  8*   RUN:io_done          DONE             1
  9         RUN:io          DONE             1
 10        BLOCKED          DONE                           1
 11        BLOCKED          DONE                           1
 12        BLOCKED          DONE                           1
 13        BLOCKED          DONE                           1
 14        BLOCKED          DONE                           1
 15*   RUN:io_done          DONE             1

Stats: Total Time 15
Stats: CPU Busy 8 (53.33%)
Stats: IO Busy  10 (66.67%)

```

#### `IO_RUN_LATER` and `SWITCH_ON_END`

With `SWITCH_ON_END` the IO stuff does not matter, as it will have to wait.

It will take 18.

The `-cp` option shows I am correct:

```bash
 python process-run.py -s 1 -l 3:50,3:50 -S SWITCH_ON_END -I IO_RUN_LATER -cp
Time        PID: 0        PID: 1           CPU           IOs
  1        RUN:cpu         READY             1
  2         RUN:io         READY             1
  3        BLOCKED         READY                           1
  4        BLOCKED         READY                           1
  5        BLOCKED         READY                           1
  6        BLOCKED         READY                           1
  7        BLOCKED         READY                           1
  8*   RUN:io_done         READY             1
  9         RUN:io         READY             1
 10        BLOCKED         READY                           1
 11        BLOCKED         READY                           1
 12        BLOCKED         READY                           1
 13        BLOCKED         READY                           1
 14        BLOCKED         READY                           1
 15*   RUN:io_done         READY             1
 16           DONE       RUN:cpu             1
 17           DONE       RUN:cpu             1
 18           DONE       RUN:cpu             1

Stats: Total Time 18
Stats: CPU Busy 8 (44.44%)
Stats: IO Busy  10 (55.56%)

```



### `-s 2 -l 3:50,3:50`

#### `IO_RUN_IMMEDIATE` and `SWITCH_ON_IO`

It will also take 18.

In reality it took 16, was faster than I thought!
```bash
 python process-run.py -s 2 -l 3:50,3:50 -S SWITCH_ON_IO -I IO_RUN_IMMEDIATE -cp
Time        PID: 0        PID: 1           CPU           IOs
  1         RUN:io         READY             1
  2        BLOCKED       RUN:cpu             1             1
  3        BLOCKED        RUN:io             1             1
  4        BLOCKED       BLOCKED                           2
  5        BLOCKED       BLOCKED                           2
  6        BLOCKED       BLOCKED                           2
  7*   RUN:io_done       BLOCKED             1             1
  8         RUN:io       BLOCKED             1             1
  9*       BLOCKED   RUN:io_done             1             1
 10        BLOCKED        RUN:io             1             1
 11        BLOCKED       BLOCKED                           2
 12        BLOCKED       BLOCKED                           2
 13        BLOCKED       BLOCKED                           2
 14*   RUN:io_done       BLOCKED             1             1
 15        RUN:cpu       BLOCKED             1             1
 16*          DONE   RUN:io_done             1

Stats: Total Time 16
Stats: CPU Busy 10 (62.50%)
Stats: IO Busy  14 (87.50%)
```

#### `IO_RUN_IMMEDIATE` and `SWITCH_ON_END`

It will take 30.

`-cp` option shows I am correct:

```bash
python process-run.py -s 2 -l 3:50,3:50 -S SWITCH_ON_END -I IO_RUN_IMMEDIATE -cp
Time        PID: 0        PID: 1           CPU           IOs
  1         RUN:io         READY             1
  2        BLOCKED         READY                           1
  3        BLOCKED         READY                           1
  4        BLOCKED         READY                           1
  5        BLOCKED         READY                           1
  6        BLOCKED         READY                           1
  7*   RUN:io_done         READY             1
  8         RUN:io         READY             1
  9        BLOCKED         READY                           1
 10        BLOCKED         READY                           1
 11        BLOCKED         READY                           1
 12        BLOCKED         READY                           1
 13        BLOCKED         READY                           1
 14*   RUN:io_done         READY             1
 15        RUN:cpu         READY             1
 16           DONE       RUN:cpu             1
 17           DONE        RUN:io             1
 18           DONE       BLOCKED                           1
 19           DONE       BLOCKED                           1
 20           DONE       BLOCKED                           1
 21           DONE       BLOCKED                           1
 22           DONE       BLOCKED                           1
 23*          DONE   RUN:io_done             1
 24           DONE        RUN:io             1
 25           DONE       BLOCKED                           1
 26           DONE       BLOCKED                           1
 27           DONE       BLOCKED                           1
 28           DONE       BLOCKED                           1
 29           DONE       BLOCKED                           1
 30*          DONE   RUN:io_done             1

Stats: Total Time 30
Stats: CPU Busy 10 (33.33%)
Stats: IO Busy  20 (66.67%)

```



#### `IO_RUN_LATER` and `SWITCH_ON_IO`

It will also take 16, as they are passing more time blocked than using the cpu.

`-cp` shows I am correct:

```bash
python process-run.py -s 2 -l 3:50,3:50 -S SWITCH_ON_IO -I IO_RUN_LATER -cp
Time        PID: 0        PID: 1           CPU           IOs
  1         RUN:io         READY             1
  2        BLOCKED       RUN:cpu             1             1
  3        BLOCKED        RUN:io             1             1
  4        BLOCKED       BLOCKED                           2
  5        BLOCKED       BLOCKED                           2
  6        BLOCKED       BLOCKED                           2
  7*   RUN:io_done       BLOCKED             1             1
  8         RUN:io       BLOCKED             1             1
  9*       BLOCKED   RUN:io_done             1             1
 10        BLOCKED        RUN:io             1             1
 11        BLOCKED       BLOCKED                           2
 12        BLOCKED       BLOCKED                           2
 13        BLOCKED       BLOCKED                           2
 14*   RUN:io_done       BLOCKED             1             1
 15        RUN:cpu       BLOCKED             1             1
 16*          DONE   RUN:io_done             1

Stats: Total Time 16
Stats: CPU Busy 10 (62.50%)
Stats: IO Busy  14 (87.50%)

```



#### `IO_RUN_LATER` and `SWITCH_ON_END`

It will take 30.

`-cp` shows I am correct:

```bash
python process-run.py -s 2 -l 3:50,3:50 -S SWITCH_ON_END -I IO_RUN_LATER -cp
Time        PID: 0        PID: 1           CPU           IOs
  1         RUN:io         READY             1
  2        BLOCKED         READY                           1
  3        BLOCKED         READY                           1
  4        BLOCKED         READY                           1
  5        BLOCKED         READY                           1
  6        BLOCKED         READY                           1
  7*   RUN:io_done         READY             1
  8         RUN:io         READY             1
  9        BLOCKED         READY                           1
 10        BLOCKED         READY                           1
 11        BLOCKED         READY                           1
 12        BLOCKED         READY                           1
 13        BLOCKED         READY                           1
 14*   RUN:io_done         READY             1
 15        RUN:cpu         READY             1
 16           DONE       RUN:cpu             1
 17           DONE        RUN:io             1
 18           DONE       BLOCKED                           1
 19           DONE       BLOCKED                           1
 20           DONE       BLOCKED                           1
 21           DONE       BLOCKED                           1
 22           DONE       BLOCKED                           1
 23*          DONE   RUN:io_done             1
 24           DONE        RUN:io             1
 25           DONE       BLOCKED                           1
 26           DONE       BLOCKED                           1
 27           DONE       BLOCKED                           1
 28           DONE       BLOCKED                           1
 29           DONE       BLOCKED                           1
 30*          DONE   RUN:io_done             1

Stats: Total Time 30
Stats: CPU Busy 10 (33.33%)
Stats: IO Busy  20 (66.67%)

```



### `-s 3 -l 3:50, 3:50`

#### `IO_RUN_IMMEDIATE` and `SWITCH_ON_IO`

It will also take 18, as I believe all processes will be IO.

`-cp` shows I am incorrect, (but that was hard, come on!):

```bash
python process-run.py -s 3 -l 3:50,3:50 -S SWITCH_ON_IO -I IO_RUN_IMMEDIATE -cp
Time        PID: 0        PID: 1           CPU           IOs
  1        RUN:cpu         READY             1
  2         RUN:io         READY             1
  3        BLOCKED        RUN:io             1             1
  4        BLOCKED       BLOCKED                           2
  5        BLOCKED       BLOCKED                           2
  6        BLOCKED       BLOCKED                           2
  7        BLOCKED       BLOCKED                           2
  8*   RUN:io_done       BLOCKED             1             1
  9*         READY   RUN:io_done             1
 10          READY        RUN:io             1
 11        RUN:cpu       BLOCKED             1             1
 12           DONE       BLOCKED                           1
 13           DONE       BLOCKED                           1
 14           DONE       BLOCKED                           1
 15           DONE       BLOCKED                           1
 16*          DONE   RUN:io_done             1
 17           DONE       RUN:cpu             1

Stats: Total Time 17
Stats: CPU Busy 9 (52.94%)
Stats: IO Busy  11 (64.71%)

```



#### `IO_RUN_IMMEDIATE` and `SWITCH_ON_END`

It will take 24.

`-cp` shows I am correct:

```bash
python process-run.py -s 3 -l 3:50,3:50 -S SWITCH_ON_END -I IO_RUN_IMMEDIATE -cp
Time        PID: 0        PID: 1           CPU           IOs
  1        RUN:cpu         READY             1
  2         RUN:io         READY             1
  3        BLOCKED         READY                           1
  4        BLOCKED         READY                           1
  5        BLOCKED         READY                           1
  6        BLOCKED         READY                           1
  7        BLOCKED         READY                           1
  8*   RUN:io_done         READY             1
  9        RUN:cpu         READY             1
 10           DONE        RUN:io             1
 11           DONE       BLOCKED                           1
 12           DONE       BLOCKED                           1
 13           DONE       BLOCKED                           1
 14           DONE       BLOCKED                           1
 15           DONE       BLOCKED                           1
 16*          DONE   RUN:io_done             1
 17           DONE        RUN:io             1
 18           DONE       BLOCKED                           1
 19           DONE       BLOCKED                           1
 20           DONE       BLOCKED                           1
 21           DONE       BLOCKED                           1
 22           DONE       BLOCKED                           1
 23*          DONE   RUN:io_done             1
 24           DONE       RUN:cpu             1

Stats: Total Time 24
Stats: CPU Busy 9 (37.50%)
Stats: IO Busy  15 (62.50%)

```

#### `IO_RUN_LATER` and `SWITCH_ON_IO`

It will took 18, as the second and third part of process 1 will have to wait for process 0 to finish.

`-cp` shows I am correct:

```bash
python process-run.py -s 3 -l 3:50,3:50 -S SWITCH_ON_IO -I IO_RUN_LATER -cp
Time        PID: 0        PID: 1           CPU           IOs
  1        RUN:cpu         READY             1
  2         RUN:io         READY             1
  3        BLOCKED        RUN:io             1             1
  4        BLOCKED       BLOCKED                           2
  5        BLOCKED       BLOCKED                           2
  6        BLOCKED       BLOCKED                           2
  7        BLOCKED       BLOCKED                           2
  8*   RUN:io_done       BLOCKED             1             1
  9*       RUN:cpu         READY             1
 10           DONE   RUN:io_done             1
 11           DONE        RUN:io             1
 12           DONE       BLOCKED                           1
 13           DONE       BLOCKED                           1
 14           DONE       BLOCKED                           1
 15           DONE       BLOCKED                           1
 16           DONE       BLOCKED                           1
 17*          DONE   RUN:io_done             1
 18           DONE       RUN:cpu             1

Stats: Total Time 18
Stats: CPU Busy 9 (50.00%)
Stats: IO Busy  11 (61.11%)

```

#### `IO_RUN_LATER` and `SWITCH_ON_END`

It will take 24.

`-cp` shows I am correct:

```bash
python process-run.py -s 3 -l 3:50,3:50 -S SWITCH_ON_END -I IO_RUN_LATER -cp
Time        PID: 0        PID: 1           CPU           IOs
  1        RUN:cpu         READY             1
  2         RUN:io         READY             1
  3        BLOCKED         READY                           1
  4        BLOCKED         READY                           1
  5        BLOCKED         READY                           1
  6        BLOCKED         READY                           1
  7        BLOCKED         READY                           1
  8*   RUN:io_done         READY             1
  9        RUN:cpu         READY             1
 10           DONE        RUN:io             1
 11           DONE       BLOCKED                           1
 12           DONE       BLOCKED                           1
 13           DONE       BLOCKED                           1
 14           DONE       BLOCKED                           1
 15           DONE       BLOCKED                           1
 16*          DONE   RUN:io_done             1
 17           DONE        RUN:io             1
 18           DONE       BLOCKED                           1
 19           DONE       BLOCKED                           1
 20           DONE       BLOCKED                           1
 21           DONE       BLOCKED                           1
 22           DONE       BLOCKED                           1
 23*          DONE   RUN:io_done             1
 24           DONE       RUN:cpu             1

Stats: Total Time 24
Stats: CPU Busy 9 (37.50%)
Stats: IO Busy  15 (62.50%)

```

### Summary

We could observe that the combination `IO_RUN_IMMEDIATE` and `SWITCH_ON_IO` is the best one, as it is the one that uses better the resources by keeping the cpu occupied most time possible.

Any combination with `SWITCH_ON_END` sucks as it makes the system mono-thread.