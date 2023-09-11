# 19 - What Is NP-Hardness?

Questions available in the book **Algorithms Illuminated Part 4: Algorithms For NP-Hard Problems** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 19.1

Suppose that a computational problem B that you care about is NP-hard. Which of the following are true?

* a) NP-hardness is a “death sentence”; you shouldn’t bother trying to solve the instances of B that are relevant for your application.
* b) If your boss criticizes you for failing to find a polynomial-time algorithm for B, you can legitimately respond that thousands of brilliant minds have likewise tried and failed to solve B.
* c) You should not try to design an algorithm that is guaranteed to solve B correctly and in polynomial time for every possible instance of the problem (unless you’re explicitly trying to refute the $P \neq NP$ conjecture).
* d) Because the dynamic programming paradigm is useful only for designing exact algorithms, there’s no point in trying to apply it to problem B.

**ANSWER**

* b) If your boss criticizes you for failing to find a polynomial-time algorithm for B, you can legitimately respond that thousands of brilliant minds have likewise tried and failed to solve B.
* c) You should not try to design an algorithm that is guaranteed to solve B correctly and in polynomial time for every possible instance of the problem (unless you’re explicitly trying to refute the $P \neq NP$ conjecture).

### Problem 19.2

Which of the following statements are true?

* a) The MST problem is computationally tractable because the number of spanning trees of a graph is polynomial in the number $n$ of vertices and the number $m$ of edges.
* b) The MST problem is computationally tractable because there are at most $m$ possibilities for the total cost of a spanning tree of a graph.
* c) Exhaustive search does not solve the TSP in polynomial time because a graph has an exponential number of traveling salesman tours.
* d) The TSP is computationally intractable because a graph has an exponential number of traveling salesman tours.

**ANSWER**

* c) Exhaustive search does not solve the TSP in polynomial time because a graph has an exponential number of traveling salesman tours.

### Problem 19.3

Which of the following statements are true?

* a) If the $P \neq NP$ conjecture is true, NP-hard problems can never be solved in practice.
* b) If the $P \neq NP$ conjecture is true, no NP-hard problem can be solved by an algorithm that is always correct and that always runs in polynomial time.
* c) If the $P \neq NP$ conjecture is false, NP-hard problems can always be solved in practice.
* d) If the $P \neq NP$ conjecture is false, some NP-hard problems are polynomial-time solvable.

**ANSWER**

* b) If the $P \neq NP$ conjecture is true, no NP-hard problem can be solved by an algorithm that is always correct and that always runs in polynomial time.
* d) If the $P \neq NP$ conjecture is false, some NP-hard problems are polynomial-time solvable.

### Problem 19.4

Which of the following statements are implied by the $P \neq NP$ conjecture?

* a) Every algorithm that solves an NP-hard problem runs in superpolynomial time in the worst case.
* b) Every algorithm that solves an NP-hard problem runs in exponential time in the worst case.
* c) Every algorithm that solves an NP-hard problem always runs in super-polynomial time.
* d) Every algorithm that solves an NP-hard problem always runs in exponential time.

**ANSWER**

* a) Every algorithm that solves an NP-hard problem runs in superpolynomial time in the worst case.

### Problem 19.5

Suppose that a problem $A$ reduces to another problem $B$. Which of the following statements are always true?

* a) If $A$ is polynomial-time solvable, then $B$ is also polynomial-time solvable.
* b) If $B$ is NP-hard, then $A$ is also NP-hard.
* c) $B$ also reduces to $A$.
* d) $B$ cannot reduce to $A$.
* e) If the problem $B$ reduces to another problem $C$, then $A$ also reduces to $C$.

**ANSWER**

* e) If the problem $B$ reduces to another problem $C$, then $A$ also reduces to $C$.

### Problem 19.6

Assume that the $P \neq NP$ conjecture is true. Which of the following statements about the knapsack problem (Section 19.4.2) are correct?

* a) The special case in which all item sizes are positive integers less than or equal to $n^5$ , where $n$ is the number of items, can be solved in polynomial time.
* b) The special case in which all item values are positive integers less than or equal to $n^5$ , where $n$ is the number of items, can be solved in polynomial time.
* c) The special case in which all item values, all item sizes, and the knapsack capacity are positive integers can be solved in polynomial time.
* d) There is no polynomial-time algorithm for the knapsack problem in general.

**ANSWER**

* a) The special case in which all item sizes are positive integers less than or equal to $n^5$, where $n$ is the number of items, can be solved in polynomial time.
* b) The special case in which all item values are positive integers less than or equal to $n^5$ , where $n$ is the number of items, can be solved in polynomial time.
* d) There is no polynomial-time algorithm for the knapsack problem in general.

## Challenge Problems

### Problem 19.7

The input in the traveling salesman path problem (TSPP) is the same as that in the TSP, and the goal is to compute a minimum-cost cycle-free path that visits every vertex (that is, a tour without its final edge). Prove that the TSPP reduces to the TSP and vice versa.

**ANSWER**

* TSPP reduces to TSP.
  * First create the graph $G'$ by adding a new vertex $v'$ to original graph $G$, this new vertex is connected to all other vertices by zero-cost edges
  * Then we run the TSPP solver, this will create a path
  * you just need to add and the edge from the last vertex to the first.
  * This will create the minimum-cost tour.
  * This adding is done in $O(1)$
* TSP reduces to TSPP
  * After running the TSP solver you just need to remove the edge with the greatest value from the tour.
  * Doing that will result in the minimum-cost cycle-free path that visits every vertex.
  * This removing is done in $O(n)$.

### Problem 19.8

## Programming Problems

### Problem 19.9

