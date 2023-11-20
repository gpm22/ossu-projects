# 20 - Compromising on Correctness:
Efficient Inexact Algorithms

Questions available in the book **Algorithms Illuminated Part 4: Algorithms For NP-Hard Problems** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 20.1

In the makespan minimization problem, suppose that jobs have similar lengths (with $\ell_j \leq 2 \ell_h$ for all jobs $j, h$) and that there is a healthy number of jobs (at least 10 times the number of machines).
What can you say about the makespan of the schedule output by the `Graham` algorithm? (Choose the strongest true statement.)

* **a)** It is at most 10% larger than the minimum-possible makespan
* **b)** It is at most 20% larger than the minimum-possible makespan.
* **c)** It is at most 50% larger than the minimum-possible makespan.
* **d)** It is at most 100% larger than the minimum-possible makespan.

**ANSWER**

Cannot be **a)**, a counterexample is when you have 10 machines, ten jobs with length 1, ninety jobs with length 6/5 and 1 job with length 2.

The best case scenario 9 machines have nine jobs with length 6/5 and one with length 1, and a machine wills have that plus the job with length 2.

So the makespan is 13.8.

The ideal one is 12.

So the the Graham makespan is 15% bigger.

Must be **b)**. To prove it first we show that the maximum job length is at most 20% of the average machine load.

The maximum job length $j_h$ is at most the double of the smallest $j_l$.

The most increment would happen when the average machine load is the lowest as possible, which happens in the case when there is $(n-1)$ jobs $j_l$ and 1 $j_h$.
$$
\frac {lj}{\frac{\sum_{i=1}^n l_i}{m}} = \frac {mlj}{\sum_{i=1}^n l_i}= \frac {ml_j}{(n-1)l_i + lj}
$$
As $l_j \leq 2l_i$ and $10m \leq n$, we got
$$
\frac {ml_j}{(n-1)l_i + lj} \leq \frac {nl_j}{10(n-1)(\frac {l_j}2) + lj} = \frac {nl_j}{5(n+1)l_j} = \frac {n}{5(n+1)}
$$
So for $n \to \infty$, it is at most 0.2.

The worst case scenario is the one where the makespan is the ideal one and where the makespan is the ideal one plus the largest job. So the answer is 

* **b)** It is at most 20% larger than the minimum-possible makespan.

### Problem 20.2

The goal in the maximum coverage problem is to cover as many elements as possible using a fixed number of subsets; in the closely related **set cover** problem, the goal is to cover **all the elements** while using as few subsets as possible (like hiring a team with all the requisite skills at the minimum-possible cost). The greedy algorithm for the maximum coverage problem extends easily to the set cover problem (given as input $m$ subsets $A_1, A_2, \dots, A_m$ of a ground set $U$, with $\cup_{i=1}^m Ai = U$).

#### Greedy Heuristic Algorithm for Set Cover

```ruby
K := {} # indices of chosen sets
while f_cov(K) < |U| do # part of U uncovered
	i* := argmax(i=1,m, [f_cov(K union {i}) - f_cov(K)])
	K := K union {i*}
end
return K
```

Let $k$ denote the **minimum number of subsets** required to cover all of $U$. Which of the following approximate correctness guarantees holds for this algorithm? (Choose the strongest true statement.)

* **a)** Its solution consists of at most $2k$ subsets.
* **b)** Its solution consists of $O(k \log |U|)$ subsets
* **c)** Its solution consists of $O(k \cdot \sqrt{|U|})$ subsets.
* **d)** Its solution consists of $O(k \cdot |U|)$ subsets.

**ANSWER**

**b)** Its solution consists of $O(k \log |U|)$ subsets

### Problem 20.3

### Problem 20.4

### Problem 20.5

## Challenge Problems

### Problem 20.6

### Problem 20.7

### Problem 20.8

### Problem 20.9

### Problem 20.10

### Problem 20.11

### Problem 20.12

### Problem 20.13

### Problem 20.14

## Programming Problems

### Problem 20.15