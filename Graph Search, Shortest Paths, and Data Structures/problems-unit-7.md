# Chapter 7 - Graphs: The Basics

Questions available in the book **Algorithms Illuminated Part 2: Graph Algorithms and Data Structures** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 7.1

Let $G = (V,E)$ be an undirected graph. By the degree of a vertex $v \in V$, we mean the number of edges in $E$ that are incident to $v$ (i.e., that have $v$ as an endpoint). For each of the following conditions on the graph $G$, is the condition satisfied only by dense graphs, only by sparse graphs, or by both some sparse and some dense graphs? As usual, $n = |V |$ denotes the number of vertices. Assume that $n$ is large (say, at least 10,000).

* **a)** At least one vertex of $G$ has degree at most 10.
  * **Both**
* **b)** Every vertex of $G$ has degree at most 10.
  * **Sparse Graphs**
* **c)** At least one vertex of $G$ has degree $n - 1$.
  * **Both**
* **d)** Every vertex of $G$ has degree $n - 1$.
  * **Dense Graphs**

### Problem 7.2

Consider an undirected graph $G = (V,E)$ that is represented as an adjacency matrix. Given a vertex $v \in V$, how many operations are required to identify the edges incident to $v$? (Let $k$ denote the number of such edges. As usual, $n$ and $m$ denote the number of vertices and edges, respectively.)

* **a)** $\Theta(1)$
* **b)** $\Theta(k)$
* **c)** $\Theta(n)$
* **d)** $\Theta(m)$

**ANSWER**

* **b)** $\Theta(n)$

### Problem 7.3

Consider an directed graph $G = (V,E)$ that is represented with adjacency lists, with each vertex storing an array of its outgoing edges (but not its incoming edges). Given a vertex $v \in V$, how many operations are required to identify the edges incident to $v$? (Let $k$ denote the number of such edges. As usual, $n$ and $m$ denote the number of vertices and edges, respectively.)

* **a)** $\Theta(1)$
* **b)** $\Theta(k)$
* **c)** $\Theta(n)$
* **d)** $\Theta(m)$

**ANSWER**

* **d)** $\Theta(m)$
