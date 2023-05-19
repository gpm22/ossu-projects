# Chapter 15 - Minimum Spanning Trees

Questions available in the book **Algorithms Illuminated Part 3: Greedy Algorithms and Dynamic Programming** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 15.1

Consider an undirected graph $G = (V,E)$ in which every edge $e \in E$ has a distinct and nonnegative cost. Let $T$ be an MST and $P$ a shortest path from some vertex $s$ to some other vertex $t$. Now suppose the cost of every edge $e$ of $G$ is increased by 1 and becomes $c_e + 1$. Call this new graph $G'$ . Which of the following is true about $G'$?

* **a)** $T$ must be an MST and $P$ must be a shortest $s$-$t$ path.
* **b)** $T$ must be an MST but $P$ may not be a shortest $s$-$t$ path.
* **c)** $T$ may not be an MST but $P$ must be a shortest $s$-$t$ path.
* **d)** $T$ may not be an MST and $P$ may not be a shortest $s$-$t$ path.

**ANSWER**

* **b)** $T$ must be an MST but $P$ may not be a shortest $s$-$t$ path.

### Problem 15.2

Consider the following algorithm that attempts to compute an MST of a connected undirected graph $G = (V,E)$ with distinct edge costs by running Kruskal’s algorithm “in reverse”:

```ruby
# Kruskal (Reverse Version)
T := E
sort edges of E in decreasing order of cost
for each e in E, in order do
	if T - {e} is connected then
		T := T - {e}
return T
```

Which of the following statements is true?

* **a)** The output of the algorithm will never have a cycle, but it might not be connected.
* **b)** The output of the algorithm will always be connected, but it might have cycles.
* **c)** The algorithm always outputs a spanning tree, but it might not be an MST.
* **d)** The algorithm always outputs an MST.

**ANSWER**

* **d)** The algorithm always outputs an MST.

### Problem 15.3

Which of the following problems reduce, in a straightforward way, to the minimum spanning tree problem?

* **a)** The maximum-cost spanning tree problem. That is, among all spanning trees $T$ of a connected graph with edge costs, compute one with the maximum-possible sum $\sum_{e \in T} c_e$ of edge costs.
* **b)** The minimum-product spanning tree problem. That is, among all spanning trees $T$ of a connected graph with strictly positive edge costs, compute one with the minimum-possible product $\prod_{e \in T} c_e$ of edge costs.
* **c)** The single-source shortest-path problem. In this problem, the input comprises a connected undirected graph $G = (V,E)$, a nonnegative length $l_e$ for each edge $e \in E$, and a designated starting vertex $s \in V$. The required output is, for every possible destination $v \in V$, the minimum total length of a path from $s$ to $v$.
* **d)** Given a connected undirected graph $G = (V,E)$ with positive edge costs, compute a minimum-cost set $F \subseteq E$ of edges such that the graph $(V,E - F)$ is acyclic.

**ANSWER**

* **a)** The maximum-cost spanning tree problem. That is, among all spanning trees $T$ of a connected graph with edge costs, compute one with the maximum-possible sum $\sum_{e \in T} c_e$ of edge costs.
* **b)** The minimum-product spanning tree problem. That is, among all spanning trees $T$ of a connected graph with strictly positive edge costs, compute one with the minimum-possible product $\prod_{e \in T} c_e$ of edge costs.
* **d)** Given a connected undirected graph $G = (V,E)$ with positive edge costs, compute a minimum-cost set $F \subseteq E$ of edges such that the graph $(V,E - F)$ is acyclic.

## Challenge Problems

### Problem 15.4

### Problem 15.5

### Problem 15.6

### Problem 15.7

### Problem 15.8

## Programming Problems

### Problem 15.9
