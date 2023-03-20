# Chapter 9 - Dijkstra’s Shortest-Path Algorithm

Questions available in the book **Algorithms Illuminated Part 2: Graph Algorithms and Data Structures** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 9.1

Consider a directed graph $G$ with distinct and nonnegative edge lengths. Let $s$ be a starting vertex and $t$ a destination vertex, and assume that $G$ has at least one $s$-$t$ path. Which of the following statements are true? (Choose all that apply.) 

* **a)**  might have as many as $n-1$ edges, where $n$ is the number of vertices.
* **b)** There is a shortest $s$-$t$ path with no repeated vertices.
* **c)** The shortest $s$-$t$ path must include the minimum-length edge of $G$.
* **d)** The shortest $s$-$t$ path must exclude the maximum-length edge of $G$.

**ANSWER**

* **a)**  might have as many as $n-1$ edges, where $n$ is the number of vertices.
* **b)** There is a shortest $s$-$t$ path with no repeated vertices.

### Problem 9.2

Consider a directed graph $G$ with a starting vertex $s$, a destination $t$, and nonnegative edge lengths. Under what conditions is the shortest $s$-$t$ path guaranteed to be unique?

* **a)** When all edge lengths are distinct positive integers.
* **b)** When all edge lengths are distinct powers of 2.
* **c)** When all edge lengths are distinct positive integers and the graph G contains no directed cycles.
* **d)** None of the other options are correct.

**ANSWER**

* **b)** When all edge lengths are distinct powers of 2.

### Problem 9.3

Consider a directed graph $G$ with nonnegative edge lengths and two distinct vertices, $s$ and $t$. Let $P$ denote a shortest path from $s$ to $t$. If we add 10 to the length of every edge in the graph, then: (Choose all that apply.)

* **a)** $P$ definitely remains a shortest $s$-$t$ path.
* **b)** $P$ definitely does not remain a shortest $s$-$t$ path.
* **c)** $P$ might or might not remain a shortest s-t path (depending on the graph).
* **d)** If $P$ has only one edge, then $P$ definitely remains a shortest s-t path.

**ANSWER**

* **c)** $P$ might or might not remain a shortest s-t path (depending on the graph).
* **d)** If $P$ has only one edge, then $P$ definitely remains a shortest s-t path.

### Problem 9.4

Consider a directed graph $G$ and a starting vertex $s$ with the following properties:

* no edges enter the starting vertex $s$;
* edges that leave $s$ have arbitrary (possibly negative) lengths;
* and all other edge lengths are nonnegative.

Does Dijkstra’s algorithm correctly solve the single-source shortest path problem in this case? (Choose all that apply.)

* **a)** Yes, for all such inputs.
* **b)** Never, for no such inputs.
* **c)** Maybe, maybe not (depending on the specific choice of $G$, $s$, and edge lengths).
* **d)** Only if we add the assumption that $G$ contains no directed cycles with negative total length.

**ANSWER**

* **a)** Yes, for all such inputs.

### Problem 9.5

Consider a directed graph $G$ and a starting vertex $s$. Suppose $G$ has some negative edge lengths but no negative cycles, meaning $G$ does not have a directed cycle in which the sum of its edge lengths is negative. Suppose you run Dijkstra’s algorithm on this input. Which of the following statements are true? (Choose all that apply.)

* **a)** Dijkstra’s algorithm might loop forever.
* **b)** It’s impossible to run Dijkstra’s algorithm on a graph with negative edge lengths.
* **c)** Dijkstra’s algorithm always halts, but in some cases the shortest path distances it computes will not all be correct. 
* **d)** Dijkstra’s algorithm always halts, and in some cases the shortest path distances it computes will all be correct.

**ANSWER**

* **c)** Dijkstra’s algorithm always halts, but in some cases the shortest path distances it computes will not all be correct. 
* **d)** Dijkstra’s algorithm always halts, and in some cases the shortest path distances it computes will all be correct.

### Problem 9.6

Continuing the previous problem, suppose now that the input graph $G$ does contain a negative cycle, and also a path from the starting vertex $s$ to this cycle. Suppose you run Dijkstra’s algorithm on this input. Which of the following statements are true? (Choose all that apply.)

* **a)** Dijkstra’s algorithm might loop forever.
* **b)** It’s impossible to run Dijkstra’s algorithm on a graph with a negative cycle.
* **c)** Dijkstra’s algorithm always halts, but in some cases the shortest path distances it computes will not all be correct.
* **d)** Dijkstra’s algorithm always halts, and in some cases the shortest path distances it computes will all be correct.

**ANSWER**

* **c)** Dijkstra’s algorithm always halts, but in some cases the shortest path distances it computes will not all be correct.
* **d)** Dijkstra’s algorithm always halts, and in some cases the shortest path distances it computes will all be correct.

## Challenge Problems

### Problem 9.7

Consider a directed graph $G = (V,E)$ with nonnegative edge lengths and a starting vertex $s$. Define the bottleneck of a path to be the maximum length of one of its edges (as opposed to the sum of the lengths of its edges). Show how to modify Dijkstra’s algorithm to compute, for each vertex $v \in V$, the smallest bottleneck of any $s$-$v$ path. Your algorithm should run in $O(mn)$ time, where $m$ and $n$ denote the number of edges and vertices, respectively.

**ANSWER**

## Programming Problems

### Problem 9.8

Implement in your favorite programming language the Dijkstra algorithm from Section 9.2, and use it to solve the single-source shortest path problem in different directed graphs. With the straightforward implementation in this chapter, what’s the size of the largest problem you can solve in five minutes or less?

**ANSWER**