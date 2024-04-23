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

  ```
  A = [[1, 4, 5, 10],
       [0, 0, 0, 0],
       [0, 0, 0, 0],
       [0, 0, 0, 0],
       [0, 0, 0, 0],
       [0, 0, 0, 0],
       [0, 0, 0, 0],
       [0, 0, 0, 0],
       [0, 0, 0, 0],
       [0, 0, 0, 0],
       [0, 0, 0, 0],
       [0, 0, 0, 0],
       [0, 0, 0, 0],
       [0, 0, 0, 0],
       [0, 0, 0, 0]]
  ```

  

* a

### Problem 21.3

### Problem 21.4

### Problem 21.5

### Problem 21.6

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