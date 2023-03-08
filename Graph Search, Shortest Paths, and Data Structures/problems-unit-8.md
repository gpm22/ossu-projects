# Chapter 8 - Graph Search and Its Applications

Questions available in the book **Algorithms Illuminated Part 2: Graph Algorithms and Data Structures** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 8.1

Which of the following statements hold?

* **a)** Breadth-first search can be used to compute the connected components of an undirected graph in O(m + n) time.
  * **HOLDS**

* **b)** Breadth-first search can be used to compute the lengths of shortest paths from a starting vertex to every other vertex in O(m+n) time, where “shortest” means having the fewest number of edges.
  * **HOLDS**

* **c)** Depth-first search can be used to compute the strongly connected components of a directed graph in O(m + n) time.
  * **HOLDS**

* **d)** Depth-first search can be used to compute a topological ordering of a directed acyclic graph in O(m + n) time.
  * **HOLDS**


### Problem 8.2

What is the running time of depth-first search, as a function of $n$ and $m$ (the number of vertices and edges), if the input graph is represented by an adjacency matrix (and NOT adjacency lists)? You may assume the graph does not have parallel edges. 

* **a)** $\Theta(m + n)$

* **b)** $\Theta(m + n \log n)$

* **c)** $\Theta(n^2)$

* **d)** $\Theta(m \cdot n)$

**ANSWER**

As the matrix size is $n^2$, the worst case would traverse the whole matrix resulting in $\Theta(n^2)$.

**c)** $\Theta(n^2)$

### Problem 8.3

This problem explores the relationship between two definitions concerning graph distances. In this problem, we consider only graphs that are undirected and connected. 
The diameter of a graph is the maximum, over all choices of vertices $v$ and $w$, of the shortest-path distance between $v$ and $w$. 
Next, for a vertex $v$, let $l(v)$ denote the maximum, over all vertices $w$, of the shortest-path distance between $v$ and $w$. The radius of a graph is the minimum value of $l(v)$, over all choices of the vertex $v$.
Which of the following inequalities relating the radius $r$ to the diameter $d$ hold in every undirected connected graph? (Choose all that apply.)

* **a)** $r \leq \frac d2$

* **b)** $r \leq d$

* **c)** $r \geq \frac d2$

* **d)** $r \geq d$

**ANSWER**

In a linear graph the diameter is $n-1$ and the radius is $n/2$.

In a complete graph the diameter is 1 and the radius is also 1.

Therefore the correct answers are

**b)** $r \leq d$

**c)** $r \geq \frac d2$

### Problem 8.4

When does a directed graph have a unique topological ordering?

* **a)** Whenever it is directed acyclic.

* **b)** Whenever it has a unique cycle.

* **c)** Whenever it contains a directed path that visits every vertex exactly once.

* **d)** None of the other options are correct.

**ANSWER**

**a)** Whenever it is directed acyclic.

### Problem 8.5

Consider running the `TopoSort` algorithm (Section 8.5) on a directed graph $G$ that is not directed acyclic. The algorithm will not compute a topological ordering (as none exist). Does it compute an ordering that minimizes the number of edges that travel backward (Figure 8.20)? (Choose all that apply.)

* **a)** The `TopoSort` algorithm always computes an ordering of the vertices that minimizes the number of backward edges.

* **b)** The `TopoSort` algorithm never computes an ordering of the vertices that minimizes the number of backward edges.

* **c)** There are examples in which the `TopoSort` algorithm computes an ordering of the vertices that minimizes the number of backward edges, and also examples in which it doesn’t.

* **d)** The `TopoSort` algorithm computes an ordering of the vertices that minimizes the number of backward edges if and only if the input graph is a directed cycle.

**ANSWER**

**c)** There are examples in which the `TopoSort` algorithm computes an ordering of the vertices that minimizes the number of backward edges, and also examples in which it doesn’t.

### Problem 8.6

If you add one new edge to a directed graph G, then the number of strongly connected components... (Choose all that apply.)

* **a)** ...might or might not remain the same (depending on G and the new edge).

* **b)** ...cannot decrease.

* **c)** ...cannot increase.

* **d)** ...cannot decrease by more than 1.

**ANSWER**

* a) ...might or might not remain the same (depending on $G$ and the new edge).
* **c)** ...cannot increase.

### Problem 8.7

Recall the `Kosaraju` algorithm from Section 8.6, which uses two passes of depth-first search to compute the strongly connected components of a directed graph. Which of the following statements are true? (Choose all that apply.)

* **a)** The algorithm would remain correct if it used breadth-first search instead of depth-first search in both its passes.

* **b)** The algorithm would remain correct if we used breadth-first search instead of depth-first search in its first pass.

* **c)** The algorithm would remain correct if we used breadth-first search instead of depth-first search in its second pass.

* **d)** The algorithm is not correct unless it uses depth-first search in both its passes.

**ANSWER**

**c)** The algorithm would remain correct if we used breadth-first search instead of depth-first search in its second pass.

### Problem 8.8

Recall that in the `Kosaraju` algorithm, the first pass of depth-first search operates on the reversed version of the input graph and the second on the original input graph. Which of the following statements are true?

* **a)** The algorithm would remain correct if in the first pass it assigned vertex positions in increasing (rather than decreasing) order and in the second pass considered the vertices in decreasing (rather than increasing) order of vertex position.

* **b)** The algorithm would remain correct if it used the original input graph in its first pass and the reversed graph in its second pass.

* **c)** The algorithm would remain correct if it used the original input graph in both passes, provided in the first pass it assigned vertex positions in increasing (rather than decreasing) order.

* **d)** The algorithm would remain correct if it used the original input graph in both passes, provided in the second pass it considered the vertices in decreasing (rather than increasing) order of vertex position.

**ANSWER**

* **a)** The algorithm would remain correct if in the first pass it assigned vertex positions in increasing (rather than decreasing) order and in the second pass considered the vertices in decreasing (rather than increasing) order of vertex position.
* **b)** The algorithm would remain correct if it used the original input graph in its first pass and the reversed graph in its second pass.

## Challenge Problems

### Problem 8.9

In the **2SAT** problem, you are given a set of clauses, each of which is the disjunction (logical “or”) of two literals. (A literal is a Boolean variable or the negation of a Boolean variable.) You would like to assign a value “true” or “false” to each of the variables so that all the clauses are satisfied, with at least one true literal in each clause.

Design an algorithm that determines whether or not a given 2SAT instance has at least one satisfying assignment. (Your algorithm is responsible only for deciding whether or not a satisfying assignment exists; it need not exhibit such an assignment.) Your algorithm should run in $O(m + n)$ time, where $m$ and $n$ are the number of clauses and variables, respectively.

[Hint: Show how to solve the problem by computing the strongly connected components of a suitably defined directed graph.]



## Programming Problems

### Problem 8.10

Implement in your favorite programming language the `Kosaraju` algorithm from Section 8.6, and use it to compute the sizes of the five biggest strongly connected components of different directed graphs. You can implement the iterative version of depth-first search, the recursive version (though see footnote 24), or both.