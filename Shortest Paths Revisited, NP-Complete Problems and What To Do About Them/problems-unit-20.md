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

This problem considers three greedy heuristics for the knapsack problem. The input consists of $n$ items with values $v_1, v_2,\dots,v_n$ and sizes $s_1, s_2, \dots,s_n$, and a knapsack capacity $C$.

#### Greedy Heuristic Algorithm #1 for Knapsack

```ruby
I := {}, S := 0 # chosen items and their size
sort and reindex the jobs so that v1 >= v2 >= ··· >= vn
for i = 1 to n do
	if S + si <= C then # choose item if feasible
		I := I union {i}, S := S + si
    end
end
return I
```

#### Greedy Heuristic Algorithm #2 for Knapsack

```ruby
I := {}, S := 0 # chosen items and their size
sort and reindex the jobs so that 'v1/s1' >= 'v2/s2' >= ··· >= 'vn/sn'
for i = 1 to n do
	if S + si <= C then # choose item if feasible
		I := I union {i}, S := S + si
    end
end
return I
```

#### Greedy Heuristic Algorithm #3 for Knapsack

```ruby
I1 := output of greedy heuristic algorithm #1
I2 := output of greedy heuristic algorithm #2
return whichever of I1, I2 has higher total value
```

Which of the following statements are true? (Choose all that apply.)

* **a)** The total value of the solution returned by the first greedy algorithm is always at least 50% of the maximum possible.
* **b)** The total value of the solution returned by the second greedy algorithm is always at least 50% of the maximum possible.
* **c)** The total value of the solution returned by the third greedy algorithm is always at least 50% of the maximum possible.
* **d)** If every item size is at most 10% of the knapsack capacity (that is, $\max_{i=1}^n si \leq C/10$), the total value of the solution returned by the first greedy algorithm is at least 90% of the maximum possible.
* **e)** If every item size is at most 10% of the knapsack capacity, the total value of the solution returned by the second greedy algorithm is at least 90% of the maximum possible.
* **f)** If every item size is at most 10% of the knapsack capacity, the total value of the solution returned by the third greedy algorithm is at least 90% of the maximum possible.

**ANSWER**

* **c)** The total value of the solution returned by the third greedy algorithm is always at least 50% of the maximum possible.
* **e)** If every item size is at most 10% of the knapsack capacity, the total value of the solution returned by the second greedy algorithm is at least 90% of the maximum possible.
* **f)** If every item size is at most 10% of the knapsack capacity, the total value of the solution returned by the third greedy algorithm is at least 90% of the maximum possible.

### Problem 20.4

In the **vertex cover** problem, the input is an undirected graph $G = (V,E)$, and the goal is to identify a minimum-size subset $S \subseteq V$ of vertices that includes at least one endpoint of every edge in $E$. One simple heuristic algorithm repeatedly chooses a not-yet-covered edge and adds **both** its endpoints to its solution-so-far:

#### Heuristic Algorithm for Vertex Cover

```ruby
S := {} # chosen vertices
while there is an edge (v, w) in E with v, w not in S do
	S := S union {v, w} # add both endpoints of edge
end
return S
```

Let $k$ denote the minimum number of vertices required to capture at least one endpoint of each edge. Which of the following approximate correctness guarantees holds for this algorithm? (Choose the strongest true statement.)

* **a)** Its solution consists of at most $2$k vertices.
* **b)** Its solution consists of $O(k \log |E|)$ vertices.
* **c)** Its solution consists of $O(k \cdot \sqrt{|E|})$ vertices.
* **d)** Its solution consists of $O(k \cdot |E|)$ vertices.

**ANSWER**

As the solution add both endpoints of an edge at the same time, not two edges of the solution share an endpoint.

So the answer is

* **a)** Its solution consists of at most $2$k vertices.

### Problem 20.5

Which of the following statements about the generic local search algorithm is not true?

* **a)** Its output generally depends on the choice of the initial feasible solution.
* **b)** Its output generally depends on the method for choosing one improving local move from many.
* **c)** It will always, eventually, halt at an optimal solution.
* **d)** In some cases, it performs an exponential (in the input size) number of iterations before halting.

**ANSWER**

It will at a local optimal solution, not a global one.

**c)** It will always, eventually, halt at an optimal solution.

## Challenge Problems

### Problem 20.6

Propose an implementation of the Graham algorithm that uses a heap data structure and runs in $O(n \log m)$ time, where $n$ is the number of jobs and $m$ is the number of machines.

**ANSWER**

```ruby
# Initialization
heap = {}
for i = 1 to m do
    J_i := {} ; # jobs assigned to machine i
    heap.set(L_i) := 0 # current load of machine i
end
# Main loop
for j = 1 to n do
    k := heap.getMin # least-loaded machine2
    J_k := J_k union { j } # assign current job
    heap.update(L_k) := heap.get(L_k) + l_j # update loads
end

return J_1, J_2,...,J_m
```

As the `update` and `getMin` run in $log(m)$, it runs in $O(n \log m)$.

### Problem 20.7

This problem improves Theorem 20.4 and extends the example in Quiz 20.3 to identify the best-possible approximate correctness guarantee for the `LPT` algorithm

* **(a)** Let job $j$ be the last job assigned to the most heavily loaded machine in the schedule returned by the `LPT` algorithm. Prove that if $\ell_j > M^*/3$, where $M^*$ denotes the minimum-possible makespan, then this schedule is optimal (that is, has makespan $M^*$).

  **ANSWER**

  The last job is the smaller one, so that would mean that all jobs are bigger than $M^*/3$.

  Let's assume that it is false, that it receives the last and it is not optimal. So
  $$
  M^* < M_1 + \frac {M^*}3 \\
  \frac {2M^*}3 < M_1
  $$
   $M_1$ must be the smaller one at time $j-1$, so all the other machines have at least one of the longest jobs, which are bigger or equal to $M^*/3$, so that is not possible for $M_1$ be greater than $M^*$ and therefore it is false.

  

* **(b)** Prove that the `LPT` algorithm always outputs a schedule with makespan at most $\frac 43- \frac 1{3m}$ times the minimum possible, where $m$ denotes the number of machines.

  **ANSWER**
  $$
  M & \leq & \left(1- \frac 1m \right) \cdot lj + \frac 1m \sum_{h=1}^n \ell_h \\
  & \leq & \left(1- \frac 1m \right) \cdot \frac {M^*}3 + M^* \\
  & = & \left(4- \frac 1m \right) \cdot \frac {M^*}3
  $$
  
* **(c)** Generalize the example in Quiz 20.3 to show that, for every $m \geq 1$, there is an example with $m$ machines in which the schedule produced by the `LPT` algorithm has makespan $\frac 43- \frac 1{3m}$ times the minimum possible.

  **ANSWER**

  For $m$ machines the example will have $2m+1$ jobs:

  * 3 jobs of length $m$
  * 2 jobs of length $m+1$
  * $\vdots$
  * 2 jobs of length $2m-1$.

  

  The perfect makespan will be
  $$
  (m + 2 \sum_{i=1}^{m-1} {m+i})/m & = & 1+ 2m + \frac 2 m \sum_{i=1}^{m-1} {i} \\
  & = & 1 + 2m + \frac {2(m-1)(m-1+1)}{2m} \\
  & = & 1 + 2m + (m-1)\\
  & = & 3m
  $$
  

  As the `LPT`sorts the input, after 2m interactions, all the machines with have the makespan $3m-1$, so the makespan from `LPT`will be $4m-1$.

  Therefore is $M =\left(4- \frac 1m \right) \cdot \frac {M^*}3$.


### Problem 20.8

Recall the bad example for the `GreedyCoverage` algorithm in Quiz 20.5.

* **(a)** Prove Proposition 20.6.

  **ANSWER**

  Proposition 20.6 states that for every positive integer $k$, there is an instance of the maximum coverage problem in which:

  1. There exist $k$ subsets that cover the entire ground set
  2. With arbitrary tie-breaking, the `GreedyCoverage` algorithm might cover only a $1 - \left(1 - \frac 1k \right)^k$ fraction of the elements.

  To prove it, for each positive integer $k$ we create an instance with $n=k^{2(k-1)}$ elements and $2k-1$ subsets, where $k$ subsets have $\frac nk$ elements that are disjoint between them, so the first item is proved. The other $k-1$ subsets are organized to have $m = k^{k-2} (k^k - k^{k-1}-[k-1]^k)$ elements disjoint between them and one of the subsets with $\frac nk$ elements.

  Doing that the fraction will be
  $$
  \frac {m+n/k}n & = & \frac{km+n}{kn} \\
  & = & \frac{k^{k-1} (k^k - k^{k-1}-[k-1]^k) + k^{2(k-1)}}{k^{2k-1}} \\
  & = & \frac{k^{2k-1} \left(1 - \frac 1k -\left[1-\frac 1k \right]^k\right) + k^{2(k1)}}{k^{2k-1}} \\
  & = & 1 - \frac 1k -\left[1-\frac 1k \right]^k + \frac 1k \\
  & = & 1  -\left[1-\frac 1k \right]^k 
  $$
  QED.

* **(b)** Extend your examples in **(a)** to show that, even with best-case tie-breaking, for every constant $\epsilon > 0$, the `GreedyCoverage` algorithm does not guarantee a $1 - \left(1 - \frac 1k \right)^k + \epsilon$ fraction of the maximum-possible coverage (where $k$ denotes the number of subsets chosen).

  **ANSWER**

  First we replace each element with a group of $N$ copies of it, where they keep belonging to the same subsets as before.

  The value of $N$ is chosen based on $\epsilon$, so $N = f(\epsilon)$.

  Then the new number of elements $n_2 = n \cdot N$.

  To eliminate the ties we add one additional copy to some of the groups, so they become bigger.

  

### Problem 20.9

### Problem 20.10

### Problem 20.11

### Problem 20.12

### Problem 20.13

### Problem 20.14

## Programming Problems

### Problem 20.15