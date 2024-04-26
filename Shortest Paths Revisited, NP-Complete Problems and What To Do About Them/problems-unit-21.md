# 20 - Compromising on Speed: Exact Inefficient Algorithms

Questions available in the book **Algorithms Illuminated Part 4: Algorithms For NP-Hard Problems** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 21.1

Does the `BellmanHeldKarp` algorithm for the `TSP` (Section 21.1.6) refute the $P \neq NP$ conjecture? (Choose all that apply.)

* **a)** Yes, it does.
* **b)** No. A polynomial-time algorithm for the `TSP` does not necessarily refute the $P \neq NP$ conjecture.
* **c)** No. Because the algorithm uses an exponential (in the input size) number of subproblems, it does not always run in polynomial time.
* **d)** No. Because the algorithm might perform an exponential amount of work to solve a single subproblem, it does not always run in polynomial time.
* **e)** No. Because the algorithm might perform an exponential amount of work to extract the final solution from the solutions to its subproblems, it does not always run in polynomial time.

**ANSWER**

* **c)** No. Because the algorithm uses an exponential (in the input size) number of subproblems, it does not always run in polynomial time.

### Problem 21.2

For the `TSP` input in Quiz 20.7, what are the final subproblem array entries of the `BellmanHeldKarp` algorithm from Section 21.1.6?

**ANSWER**

* The graph is defined by 
  $$
  V = \{a, b, c, d, e\} \\
  E = \{ (a, b, 1), (a, c, 4), (a, d, 5), (a, e, 10), \\
         (b, c, 2), (b, d, 6), (b, e, 3), \\
         (c, d, 7), (c, e, 8), \\
         (d, e, 9) \}
  $$
  
* The $15 \times 4$ final array is

  ```ruby
      #| b | c | d | e |
  A = [[ 1, NA, NA, NA], #|S| = 2, s = {a, b}
       [NA,  4, NA, NA], #|S| = 2, s = {a, c}
       [NA, NA,  5, NA], #|S| = 2, s = {a, d}
       [NA, NA, NA, 10], #|S| = 2, s = {a, e}
       [ 6,  3, NA, NA], #|S| = 3, s = {a, b, c}
       [11, NA,  7, NA], #|S| = 3, s = {a, b, d}
       [13, NA, NA,  4], #|S| = 3, s = {a, b, e}
       [NA, 12, 11, NA], #|S| = 3, s = {a, c, d}
       [NA, 18, NA, 12], #|S| = 3, s = {a, c, e}
       [NA, NA, 19, 14], #|S| = 3, s = {a, d, e}
       [14, 13, 10, NA], #|S| = 4, s = {a, b, c, d}
       [15, 12, NA,  9], #|S| = 4, s = {a, b, c, e}
       [NA, 22, 21, 20], #|S| = 4, s = {a, c, d, e}
       [17, NA, 13, 14], #|S| = 4, s = {a, b, d, e}
       [23, 19, 18, 17]] #|S| = 5, s = {a, b, c, d, e}
  ```
  

### Problem 21.3

Consider the following proposed subproblems for an instance $G = (V,E)$​ of the TSP:

**Subproblems (Attempt)**

* Compute $C_{i,v}$, the minimum cost of a cycle-free path that begins at vertex 1, ends at vertex $v$, and visits exactly $i$ vertices (or $+\infty$, if there is no such path).
* For each $i \in \{2, 3, \dots, |V|\}$ and $v \in V - \{1\}$.

What prevents us from using these subproblems, with $i$ as the measure of subproblem size, to design a polynomial-time dynamic programming algorithm for the TSP? (Choose all that apply.)

* **a)** The number of subproblems is super-polynomial in the input size.
* **b)** Optimal solutions to bigger subproblems cannot be computed easily from optimal solutions to smaller subproblems.
* **c)** The optimal tour cannot be computed easily from the optimal solutions to all the subproblems.
* **d)** Nothing!

**ANSWER**

* **b)** Optimal solutions to bigger subproblems cannot be computed easily from optimal solutions to smaller subproblems.

Because will be necessary to verify if cycles are not being created.

### Problem 21.4

Which of the following problems can be solved in $O(n^2 2^n)$ time for $n$-vertex graphs using a minor variation of the `BellmanHeldKarp` algorithm? (Choose all that apply.)

* **a)** Given an $n$-vertex undirected graph, determine whether it has a Hamiltonian path (a cycle-free path with $n - 1$ edges).
* **b)** Given an $n$-vertex directed graph, determine whether it has a directed Hamiltonian path (a cycle-free directed path with $n - 1$ edges).
* **c)** Given a complete undirected graph and real-valued edge costs, compute the maximum cost of a traveling salesman tour.
* **d)** Given a complete $n$-vertex directed graph (with all $n(n - 1)$ directed edges present) and real-valued edge costs, compute the minimum cost of a directed traveling salesman tour (a directed cycle that visits every vertex exactly once).
* **e)** The cycle-free shortest path problem defined on page 29 in Section 19.5.4.

**ANSWER**

* **a)** Given an $n$-vertex undirected graph, determine whether it has a Hamiltonian path (a cycle-free path with $n - 1$ edges).
* **b)** Given an $n$-vertex directed graph, determine whether it has a directed Hamiltonian path (a cycle-free directed path with $n - 1$ edges).
* **c)** Given a complete undirected graph and real-valued edge costs, compute the maximum cost of a traveling salesman tour.
* **d)** Given a complete $n$-vertex directed graph (with all $n(n - 1)$ directed edges present) and real-valued edge costs, compute the minimum cost of a directed traveling salesman tour (a directed cycle that visits every vertex exactly once).
* **e)** The cycle-free shortest path problem defined on page 29 in Section 19.5.4.

### Problem 21.5

For the instance
$$
V = \{a, b, c, d, e, f, g, h\} \\
E = \{ (a, c, 1), (a, f, 2), \\
       (b, e, 6), (b, d, 4), \\
       (c, e, 7), (c, h, 8), \\
       (d, g, 5), (d, f, 3), \\
       (e, g, 9), (f, h, 10)\} \\
\text{red} = \{a, b \}\\
\text{green} = \{c, d\}\\
\text{blue} = \{e, f\}\\
\text{yellow} = \{g, h\}\\
$$


what are the final subproblem array entries of the `PanchromaticPath` algorithm from Section 21.2.5?

**ANSWER**

* The $15 \times 8$ final array is

  ```ruby
  #    | a|  b|  c|  d|  e|  f|  g|  h|
  A = [[ 0,  0, NA, NA, NA, NA, NA, NA], #|S| = 1, S ={red}
       [NA, NA,  0,  0, NA, NA, NA, NA], #|S| = 1, S ={green}
       [NA, NA, NA, NA,  0,  0, NA, NA], #|S| = 1, S ={blue}
       [NA, NA, NA, NA, NA, NA,  0,  0], #|S| = 1, S ={yellow}
       [ 1,  4,  1,  4, NA, NA, NA, NA], #|S| = 2, S ={red, green}
       [ 2,  6, NA, NA,  6,  2, NA, NA], #|S| = 2, S ={red, blue}
       [NA, NA, NA, NA, NA, NA, NA, NA], #|S| = 2, S ={red, yellow}
       [NA, NA,  7,  3,  7,  3, NA, NA], #|S| = 2, S ={green, blue}
       [NA, NA,  8,  5, NA, NA,  5,  8], #|S| = 2, S ={green, yellow}
       [NA, NA, NA, NA,  9, 10,  9, 10], #|S| = 2, S ={blue, yellow}
       [ 5,  7,  3,  5,  8,  3, NA, NA], #|S| = 3, S ={red, green, blue}
       [ 9,  9, NA, NA, NA, NA,  9,  9], #|S| = 3, S ={red, green, yellow}
       [12, 15, NA, NA, NA, NA, 15, 12], #|S| = 3, S ={red, blue, yellow}
       [NA, NA, 16, 13, 14,  8,  8, 13], #|S| = 3, S ={green, blue, yellow}
       [10, 17, 13, 19, 15, 11, 10, 11]] #|S| = 4, S ={red, green, blue, yellow}
  ```

### Problem 21.6

Propose an implementation of a postprocessing step that reconstructs a minimum-cost traveling salesman tour from the subproblem array computed by the `BellmanHeldKarp` algorithm. Can you achieve a linear (in the number of vertices) running time, perhaps after adding some extra bookkeeping to the `BellmanHeldKarp` algorithm?

**ANSWER**

### Problem 21.7

## Challenge Problems

### Problem 21.8

### Problem 21.9

### Problem 21.10

### Problem 21.11

### Problem 21.12

### Problem 21.13

## Programming Problems

### Problem 21.14

### Problem 21.15