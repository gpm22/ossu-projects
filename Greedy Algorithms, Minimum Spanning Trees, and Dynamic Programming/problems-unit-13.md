# Chapter 13 - Introduction to Greedy Algorithms

Questions available in the book **Algorithms Illuminated Part 3: Greedy Algorithms and Dynamic Programming** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 13.1

You are given as input $n$ jobs, each with a length $l_j$ and a deadline $d_j$ . Define the **lateness** $\lambda_j (\sigma)$ of a job $j$ in a schedule $\sigma$ as the difference $C_j (\sigma) -  d_j$ between the job’s completion time and deadline, or as 0 if $C_j(\sigma) \leq d_j$ . This problem considers the objective of minimizing the maximum lateness, $\max_{j=1}^n \lambda_j (\sigma)$. 
	Which of the following greedy algorithms produces a schedule that minimizes the maximum lateness? Feel free to assume that there are no ties.

* **a)** Schedule the jobs in increasing order of deadline $d_j$.
* **b)** Schedule the jobs in increasing order of processing time $p_j$.
* **c)** Schedule the jobs in increasing order of the product $d_j \cdot p_j$.
* **d)** None of the other answers are correct.

**ANSWER**

* Cases:
  1. Holding the length fixed, it should be **increasing** in the job’s deadline;
  2. Holding the deadline fixed, it should be **indifferent** in the job’s length;
* So the correct answer is:
  * **a)** Schedule the jobs in increasing order of deadline $d_j$.


### Problem 13.2

Continuing Problem 13.1, consider instead the objective of minimizing the **total** lateness, $\sum_{j=1}^n \lambda_j (\sigma)$.
	Which of the following greedy algorithms produces a schedule that minimizes the total lateness? Feel free to assume that there are no ties.

* **a)** Schedule the jobs in increasing order of deadline $d_j$.
* **b)** Schedule the jobs in increasing order of processing time $p_j$.
* **c)** Schedule the jobs in increasing order of the product $d_j \cdot p_j$.
* **d)** None of the other answers are correct.

**ANSWER**

* Cases:
  1. Holding the length fixed, it should be **increasing** in the job’s deadline;
  2. Holding the deadline fixed, it should be **increasing** in the job’s length;

* So the correct answer is:
  * **c)** Schedule the jobs in increasing order of the product $d_j \cdot p_j$.

### Problem 13.3

You are given as input $n$ jobs, each with a start time $s_j$ and a finish time $t_j$. Two jobs **conflict** if they overlap in time—if one of them starts between the start and finish times of the other. In this problem, the goal is to select a maximum-size subset of jobs that have no conflicts. (For example, given three jobs consuming the intervals [0, 3], [2, 5], and [4, 7], the optimal solution consists of the first and third jobs.) The plan is to design an iterative greedy algorithm that, in each iteration, irrevocably adds a new job $j$ to the solution-so-far and removes from future consideration all jobs that conflict with $j$.
	Which of the following greedy algorithms is guaranteed to compute an optimal solution? Feel free to assume that there are no ties.

* **a)** At each iteration, choose the remaining job with the earliest finish time.
* **b)** At each iteration, choose the remaining job with the earliest start time.
* **c)** At each iteration, choose the remaining job that requires the least time (that is, with the smallest value of $t_j - s_j$).
* **d)** At each iteration, choose the remaining job with the fewest number of conflicts with other remaining jobs.

**ANSWER**

* Cannot be **b)**, as one job can start before and finish after the others;
* Cannot be **c)**, as the least time job can overlaps with other jobs, example:
  * [0, 3], [3, 4], and [4, 7].
  * The second job [3, 4] overlaps with the other two, which do not overlap between themselves.
* Cannot be **d)**, as we can have the right jobs overlapping various other, example:
  * [1, 3], [1, 5], [2, 5], [3, 5],  [4, 6], [6, 7], [7, 10], [8, 11], [9, 11], [10, 11], [11, 14]
  * The right answer is [1, 3], [4, 6], [7, 10], [11, 14]
  * But following this idea we get the element [6, 7], that is not part of the right answer.
* By elimination, **a)** must be correct:
  * **a)** At each iteration, choose the remaining job with the earliest finish time.

## Programming Problems

### Problem 13.4

Implement in your favorite programming language the `GreedyDiff` and `GreedyRatio` algorithms from Section 13.3 for minimizing the weighted sum of completion times. Run both algorithms on several examples. How much better are the schedules computed by the `GreedyRatio` algorithm than those by the `GreedyDiff` algorithm? 

**ANSWER**



