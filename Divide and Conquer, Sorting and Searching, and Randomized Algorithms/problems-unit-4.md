# Chapter 4 - The Master Method

Questions available in the book **Algorithms Illuminated Part 1: The Basics** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 4.1

Recall the master method (Theorem 4.1) and its three parameters $a$, $b$, and $d$. Which of the following is the best interpretation of $b^d$?

* a) The rate at which the total work is growing (per level of recursion).
* b) The rate at which the number of subproblems is growing (per level of recursion).
* c) The rate at which the subproblem size is shrinking (per level of recursion).
* d) The rate at which the work-per-subproblem is shrinking (per level of recursion).

**Answer**

As $b^d$ is called as **rate of work shrinkage (RWS)**, which means that the amount of work per subproblem decreases by a factor of $b^d$, therefore the correct answer is

d) The rate at which the work-per-subproblem is shrinking (per level of recursion).

### Problem 4.2

Suppose the running time $T(n)$ of an algorithm is bounded by a standard recurrence with $T(n) \leq 7 \cdot T\left(\frac n3 \right)+O(n^2)$ Which of the following is the smallest correct upper bound on the asymptotic running time of the algorithm?

* a) $O(n \log n)$
* b) $O(n^2)$
* c) $O(n^2 \log n)$
* d) $O(n^{3.17})$

**Answer**

$a = 7, b =3, d=2$

Thus, $a < b^d$.

Then, by the master method, $T(n) = O(n^{2})$.

Therefore the answer is **b) $O(n^2)$**.

### Problem 4.3

Suppose the running time $T(n)$ of an algorithm is bounded by a standard recurrence with $T(n) \leq 9 \cdot T\left(\frac n3 \right)+O(n^2)$ Which of the following is the smallest correct upper bound on the asymptotic running time of the algorithm?

* a) $O(n \log n)$
* b) $O(n^2)$
* c) $O(n^2 \log n)$
* d) $O(n^{2.81})$

**Answer**

$a = 9, b =3, d=2$

Thus, $a = b^d$.

Then, by the master method, $T(n) = O(n^2 \log n)$.

Therefore the answer is **c) $O(n^2 \log n)$**.

### Problem 4.4

Suppose the running time $T(n)$ of an algorithm is bounded by a standard recurrence with $T(n) \leq 5 \cdot T\left(\frac n3 \right)+O(n)$ Which of the following is the smallest correct upper bound on the asymptotic running time of the algorithm?

* a) $O(n ^{\log_5 3})$
* b) $O(n \log n)$
* c) $O(n ^{\log_3 5})$
* d) $O(n^{5/3})$
* e) $O(n^2)$ 
* f) $O(n^{2.59})$

**Answer**

$a = 5, b =3, d=1$

Thus, $a > b^d$.

Then, by the master method, $T(n) = O(n^{\log_3 5}) \approx O(n^{1.46})$.

Therefore the answer is **c) $O(n ^{\log_3 5})$**.

## Challenge Problems

### Problem 4.5

Suppose the running time $T(n)$ of an algorithm is bounded by the (non-standard!) recurrence with $T(1) = 1$ and $T(n) \leq T(\text{floor}(\sqrt n)) + 1$ for $N > 1$. Which of the following is the smallest correct upper bound on the asymptotic running time of the algorithm? (Note that the master method does not apply!) 

* a) $O(1)$
* b) $O(\log \log n)$
* c) $O(\log n)$
* d) $O(\sqrt n)$

**Answer**:

The recurrence shows that each level does 1 recursive call and decrease the level of $n$ by its square.

This means that the tree has $\text{floor}(\log_2(n))$ levels.

The work done by each level is $O(1)$, therefore the running time is $O(\log n))$.

Therefore, the correct answer is **c) $O(\log n)$**.