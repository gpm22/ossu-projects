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

  First we create an instance using the idea of **a)**.

  Then we replace each element with a group of $N$ copies of it, where they keep belonging to the same subsets as before.

  The value of $N$ is chosen based on $\epsilon$, so $N = f(\epsilon)$.

  To eliminate the ties we add one additional copy to some of the groups, so they become bigger and will be selected.

  Then the new number of elements $n_2 = n \cdot N+t$, where $t$ is the number of ties.
  
  Let's make the bigger groups the ones that will result in the best case tie-breaking.
  
  Selecting $k$ groups will result in $m_2 = m \cdot N + k$, so the fraction is
  $$
  \frac {m_2}{n_2} = \frac {mN + k}{nN + t} = \frac mn + \epsilon
  $$
  Therefore
  $$
  \epsilon =  \frac {mN + k}{nN + t} - \frac mn
  $$
  Then we just have to select a $N$ that make it worse.
  
  After running the algorithm we eliminate the copies, so it rest only the original ones.

### Problem 20.9

Show that every instance of the maximum coverage problem can be encoded as an instance of the influence maximization problem so that:

1. The two instances have the same optimal objective function value $F^*$;
2. Any solution to the latter instance with influence $F$ can be easily converted to a solution to the former instance with coverage at least $F$.

**ANSWER**

First let states both problems:

**Problem: Maximum Coverage**

  * **Input:**

    * A collection $A_1, A_2, \dots, A_m$ of subsets of a **ground set** $U$, and a positive integer $k$.

  * **Output**:

    * A choice $K \subseteq \{1, 2, \dots,m\}$ of $k$ indices to maximize the coverage $f_{cov}(K)$ of the corresponding subsets, where:
      $$
      f_{cov}(K) = \left| \bigcup_{i \in K} A_i \right|
      $$

**Problem: Influence Maximization**

* **Input**:
    * A directed graph $G = (V,E)$, a probability $p$, and a positive integer $k$.
* **Output**:
    * A choice $S \subseteq V$ of $k$ vertices with the maximum-possible influence $f_{\text{inf}} (S)$ in the cascade model with activation probability $p$.

We can see that vertices play the role of subsets and influence plays the role of coverage.

So to transform an instance of the maximum coverage into an instance of influence Maximization, we first transform the elements of ground set $U$ in the vertices of the graph $G$ and we create the subsets by connecting the subset vertices with edges to the ground set vertices, so now we have the graph $G(V,E)$. As $f_{\text{inf}} (S)$ we use the same $f_{cov}(K)$ with $p=1$.

### Problem 20.10

The goal in the maximum coverage problem is to choose $k$ subsets to maximize the coverage $f_{cov}$. The goal in the influence maximization problem is to choose $k$ vertices to maximize the influence $f_{inf}$. The general version of this type of problem is: Given a set $O$ of objects and a real-valued set function $f$ (specifying a number $f(S)$ for each subset $S \subseteq O$), choose $k$ objects of $O$ to maximize $f$. The `GreedyCoverage` and `GreedyInfluence` algorithms extend naturally to the general problem:

#### Greedy Algorithm for Set Function Maximization

```ruby
S := {} # chosen objects
for j = 1 to k do # choose objects one by one
    # greedily increase objective function
    o* := argmax([f(K union {o}) - f(K)]) #for o not in S
    S := S union {o*}
end
return S
```

For which objective functions $f$ does this greedy algorithm enjoy an approximate correctness guarantee akin to Theorems 20.7 and 20.9?
Here are the key properties:

1. **Nonnegative**: $f(S) \geq 0$ for all $S \subseteq O$.
2. **Monotone**: $f(S) \geq f(T)$ whenever $S \supseteq T$.
3. **Submodular**: $f(S \cup \{o\}) - f(S) \leq f(T \cup \{o\}) - f(T)$ whenever $S \supseteq T$ and $O \notin S$

* **a)** Prove that the coverage and influence functions $f_{cov}$ and $f_{inf}$ possess all three properties.

  **ANSWER**

  $f_{conv}(K)$ is defined as $|\cup_{i \in K} A_i|$, it is impossible to it to be negative, so is nonnegative. It is clearly monotone, as a bigger set will have more elements than a smaller one. It is submodular as:
  $$
  | S \cup o | - |S| = 1 \leq 1 = |T \cup o| - |T|
  $$
  $f_{inf}$ is defined as $E{|X(S)|}$, where $X(S)$ is the (random) set of vertices that are eventually activated when the vertices $S$ are chosen as seeds. It is impossible to it to be negative, so is nonnegative. It is clearly monotone, as a bigger set will have more elements than a smaller one, as they all have the same probability. It is submodular as:
  $$
  E| S \cup o | - E|S| = p \leq p = E|T \cup o| - E|T|
  $$

* **b)** Prove that whenever $f$ is nonnegative, monotone, and submodular, the general greedy heuristic algorithm is guaranteed to return a set $S$ of objects that satisfies
  $$
  f(S) \geq \left(1-\left(1- \frac 1k \right)^k \right) \cdot f(S^*)
  $$
  where $S^*$ maximizes $f$ over all size-k subsets of $O$.

  **ANSWER**

  This greedy algorithm always makes progress.

  * For each $j \in \{1, 2, \dots,k\}$, let $C_j$ denote the coverage achieved by the first $j$ objects chosen by the algorithm.

  * For each such $j$, the $j$th subset chosen covers at least $1 - (C^* - C_ {j-1})$ new elements, where $C^*$ denotes the maximum-possible coverage by $k$ subsets:
    $$
    C_j - C_{j-1} \geq \frac 1k \left(C^* - C_{j-1} \right)
    $$

​	To prove it let $K_{j-1}$ denote the indices of the first $j - 1$ objects chosen by the algorithm any competing set $\hat K$ of $k$ indices, so we have:
$$
\sum_{i \in \hat K} \left[f(K_{j-1} \cup \{i\}) - f(K_{j-1}) \right] \geq f(\hat K) - f(K_{j-1})
$$
​	This is true because because submodularity implies that each term in the sum is at most that in the right side. If the $k$ numbers summed on the left side were equal, each would be $\frac 1k \sum_{i \in \hat K} \left[f(K_{j-1} \cup \{i\}) - f(K_{j-1}) \right]$, so
$$
\max_{i \in \hat K} \left[f(K_{j-1} \cup \{i\}) - f(K_{j-1}) \right] & \geq & \frac 1k \sum_{i \in \hat K} \left[f(K_{j-1} \cup \{i\}) - f(K_{j-1}) \right] \\
& \geq & \frac 1k \left(f(\hat K) - f(K_{j-1})\right)
$$
This true because $f$ is nonnegative and monotone. Which proves the lemma. Applying it for $j=k$:
$$
f(K_{k}) & \geq & \frac 1k \left(f(K^*) - f(K_{j-1})\right) + f(K_{k-1}) \\
& = & \frac {f(K^*)} k + \left(1 - \frac 1k\right)f(K_{k-1})
$$
Applying it for $j=k-1$
$$
f(K_{k-1}) \geq \frac {f(K^*)} k + \left(1 - \frac 1k\right)f(K_{k-2})
$$
Combining both
$$
f(K_{k}) & \geq & \frac {f(K^*)} k + \left(1 - \frac 1k\right) \left[\frac {f(K^*)} k + \left(1 - \frac 1k\right)f(K_{k-2}) \right] \\
& = & \frac {f(K^*)} k \left(2 - \frac 1k\right)  + \left(1 - \frac 1k\right)^2 f(K_{k-2})
$$
We can keep substituting the the term $f(K_{k-i}) $, where we arrived the pattern
$$
f(K_{k}) \geq \frac {f(\hat K)} k \left( 1 + \left(1 - \frac 1k\right) +\left(1 - \frac 1k\right)^2 + \cdots + \left(1 - \frac 1k\right)^{k-1} \right)
$$
The right side is a geometric series, so we get
$$
f(K_{k}) \geq \frac {f(\hat K)} k \left(\frac {1-\left(1-\frac 1k\right)^k}{1-\left(1-\frac 1k\right)} \right) = f(\hat K)\left(1-\left(1-\frac 1k\right)^k \right)
$$
Which concludes the proof.

### Problem 20.11

Problem 20.3 investigated approximate correctness guarantees for greedy heuristic algorithms for the knapsack problem. This problem outlines a dynamic programming algorithm with a much stronger guarantee: For a user-specified error parameter $\epsilon > 0$ (like .1 or .01), the algorithm outputs a solution with total value at least $1 - \epsilon$ times the maximum possible.

* **a)** Section 19.4.2 mentioned that the knapsack problem can be solved in $O(nC)$ time using dynamic programming, where $n$ denotes the number of items and $C$ the knapsack capacity; see also Chapter 16 of Part 3. (All item values and sizes, as well as the knapsack capacity, are positive integers.) Give a different dynamic programming algorithm for the problem that runs in $O(n^2 \cdot v_\text{max})$ time, where $v_\text{max}$ denotes the largest value of any item.

  **ANSWER**

  **Subproblems**

  Let $i = 0, 1, 2, \dots, n$ and $x = 0, 1, 2, \dots, n \cdot v_\text{max}$ and define
  $$
  S_{i, x} = \text{ minimum total size needed to achieve a value } \geq x \\ \text{ while using only the first } i \text{ items or} +\infty \text{ if impossible}
  $$
  

  **Recurrence**

  If $i \geq 1$
  $$
  S_{i, x} = \min \begin{cases}
  	S_{(i-1), x}, \ \text{if item } i \text{ is not used in the optimal solution} \\
  	w_i + S_{(i-1), (x - v_i)}, \ \text{if item } i \text{ is used in the optimal solution}
  \end{cases}
  $$
  $S_{(i-1), (x - v_i)} = 0$ if $v_i \geq x$.

  **Algorithm**

  ```ruby
  # subproblem solutions (indexed from 0)
  A := (n + 1) * (n * v_max + 1) two-dimensional array
  X := n * v_max
  # base case (i = 0)
  A[0][0] = 0
  for x = 1 to X do
  	A[0][x]=+inf
  end
  # systematically solve all subproblems
  for i = 1 to n do
      for x = 0 to X do
          previousOptiomal := vi >= x ? 0 : A[i - 1][x - vi]
          A[i][x] := min{A[i - 1][x], wi + previousOptiomal}
      end
  end
  
  # return the biggext x for wich A[n, x] <= W
  for x = X to 0 do
      return x if A[n, x] <= W
  end
  ```

  It is clearly $O(n^2 \cdot v_\text{max})$.
* **b)** To shrink the item values down to a manageable magnitude, divide each of them by $m = (\epsilon \cdot v_\text{max})/n$ and round each result down to the nearest integer (where $\epsilon$ is the user-specified error parameter). Prove that the total value of every feasible solution goes down by at least a factor of $m$ and that the total value of an optimal solution goes down by at most a factor of $m/(1 - \epsilon)$. (You can assume that every item has size at most $C$ and hence fits in the knapsack.)

  **ANSWER**

  First we prove that the total value of every feasible solution goes down by at least a factor of $m$.

  As $\hat v_i = \left \lfloor \frac {v_i}m \right \rfloor$, we got $v_i \geq m \cdot \hat v_i$ and $m \cdot \hat v_i \geq v_i-m$

  If $S^*$ is the optimal solution to the original problem, and $S$ is solution resulted from using the shrunk items, then
  $$
  \sum_{i \in S} \hat v_i \geq \sum_{i \in S^*} \hat v_i
  $$
  Since $S$ is optimal for the $\hat v_i$'s.
  
  Then by multiplying both sides of the previous inequality by $m$ and using the first two inequalities we get:
  $$
  \sum_{i \in S} v_i \geq m\sum_{i \in S} \hat v_i \geq m\sum_{i \in S^*} \hat v_i \geq \sum_{i \in S^*} (v_i-m)
  $$
  Thus
  $$
  \sum_{i \in S} v_i \geq  \left(\sum_{i \in S^*} v_i\right)-nm
  $$
  So, every feasible solution goes down by at least a factor of $m$.
  
  
  
  Now we prove that the total value of an optimal solution goes down by at most a factor of $m/(1 - \epsilon)$. 
  
  We now that
  
  
  $$
  \sum_{i \in S} v_i \geq  (1-\epsilon) \sum_{i \in S^*} \hat v_i
  $$
  and
  $$
  \sum_{i \in S} v_i \geq m\sum_{i \in S^*} \hat v_i
  $$
  Thus
  $$
  \sum_{i \in S} v_i & \geq &  m\sum_{i \in S^*} \hat v_i \\
  & \geq &  m \left(\frac {\sum_{i \in S} v_i}{1-\epsilon} \right)  \\
  & = & \frac m {1-\epsilon}\sum_{i \in S} v_i \\
  & \geq & \frac m {1-\epsilon}\sum_{i \in S} \hat v_i
  $$
  Therefore the total value of an optimal solution goes down by at most a factor of $m/(1 - \epsilon)$.
  
  
  
* **c)** Propose an $O(n^3/\epsilon)$-time algorithm that is guaranteed to return a feasible solution with total value at least $1 - \epsilon$ times the maximum possible (A heuristic algorithm with this type of guarantee is called a fully polynomial time approximation scheme (FPTAS)).

  **ANSWER**

  **Step 1**: Create a new instance of the knapsack problem with values $\hat v_i$, where $\hat v_i = \left\lfloor \frac {v_i}m \right\rfloor$ and $m = (\epsilon \cdot v_\text{max}/n$).

  **Step 2**: Use the dynamic program proposed in **a)** to solve this new instance.

  

  The running time is $O(n^2 \cdot \max_{i=0}^n\{\hat v_i\})$, as 
  $$
  \max_{i=0}^n\{\hat v_i\} & = & \left\lfloor \frac {v_\text{max}}m \right\rfloor \\
   & = &  \frac {v_\text{max}n}{v_\text{max} \epsilon}  \\
   & = &  \frac n\epsilon
  $$
  we got $O(n^3/\epsilon)$.

### Problem 20.12

### Problem 20.13

### Problem 20.14

## Programming Problems

### Problem 20.15