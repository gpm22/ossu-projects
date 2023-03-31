# Chapter 11 - Search Trees

Questions available in the book **Algorithms Illuminated Part 2: Graph Algorithms and Data Structures** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 11.1

Which of the following statements are true?

* **a)** The height of a binary search tree with $n$ nodes cannot be smaller than $\Theta(\log n)$.
* **b)** All the operations supported by a binary search tree (except `OutputSorted`) run in $O(\log n)$ time.
* **c)** The heap property is a special case of the search tree property.
* **d)** Balanced binary search trees are always preferable to sorted arrays.

**ANSWER**

* **a)** The height of a binary search tree with $n$ nodes cannot be smaller than $\Theta(\log n)$.

### Problem 11.2

You are given a binary tree with $n$ nodes (via a pointer to its root). Each node of the tree has a `size` field, as in Section 11.3.9, but these fields have not been filled in yet. How much time is necessary and sufficient to compute the correct value for all the size fields?

* **a)** $\Theta(\text{height})$
* **b)** $\Theta(n)$
* **c)** $\Theta(n \log n)$
* **d)** $\Theta(n^2)$

**ANSWER**

**b)** $\Theta(n)$

## Programming Problems

### Problem 11.3

This problem uses the median maintenance problem from Section 10.3.3 to explore the relative performance of heaps and search trees.

* **a)** Implement in your favorite programming language the heap based solution in Section 10.3.3 to the median maintenance problem.
* **b)** Implement a solution to the problem that uses a single search tree and its `Insert` and `Select` operations.

Which implementation is faster?

**ANSWER**