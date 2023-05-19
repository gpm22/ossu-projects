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

Prove the converse of Theorem 15.6: If $T$ is an MST of a graph with real-valued edge costs, every edge of $T$ satisfies the minimum bottleneck property.

**ANSWER**

Remembering that for a graph $G = (V,E)$ with real-valued edge costs, an edge $(v, w) \in E$ satisfies the minimum bottleneck property (MBP) if it is a minimum-bottleneck $v$-$w$ path.

Let's prove it by contradiction, so we assume that there is a MST $T$ with an edge $(v, w)$ that does not satisfy the MBP, which means there is an path $P$ between $(v, w)$ with every edge having the cost less than $c_{vw}$.

Removing $(v, w)$ from $T$, create two connected components, $C_1$, which contains $v$, and $C_2$, which contains $w$. We can than create a spanning tree $T'$ connecting $C_1$ and $C_2$, which and edge $(v', w')$ from the path $P$ that satisfies the MBP, where $v' \in C_1$ and $w' \in C_2$.

$T'$ is a spanning tree and has a total cost smaller than $T$'s total cost, therefore $T$ cannot be a MST and we arrived at a contradiction.

### Problem 15.5

Prove the correctness of Prim’s and Kruskal’s algorithms (Theorems 15.1 and 15.11) in full generality, for graphs in which edges’ costs need not be distinct.

**ANSWER**

In the case where all edges have the same cost, any spanning tree will be a MST, so we assume that not all edges have the same cost. Thus, we will have spanning trees with different values.

So, let:

* $G = (V, E)$ be a connected undirected graph with real-valued edge costs that need not be distinct;
* $\sigma_1$ be the smallest strictly positive difference between two edges’ costs;
* $M^*$ be the cost of an MST of $G$;
* $M$ be the minimum cost of a suboptimal spanning tree of $G$;
* $\sigma_2$ be $M-M^*$;
* $\sigma$  be $\min(\sigma_1, \sigma_2) > 0$;
* $e_i$ be the $i$th edge of $G$ in ascending order of cost, where ties are arbitrarily broken.

So, let's create a new graph $G'$ from $G$, where each edge $e'_i$ has a cost $c'_{e'_i}=c_{e_i} + \sigma \cdot 2^{-(m-i+1)}$, where $m = |E|$.

As $\sigma \leq \sigma_1$, all $G'$'s edges must have different values.

The cost of the $G'$'s spanning trees in relation with $G$'s can only increase, and can only increase by at most $\sigma \cdot \sum_{i=1}^m 2^{-(m-i+1)} < \sigma$.

As $ \sigma \leq \sigma_2$, an MST $T$ of $G'$ must also be one of $G$.

In the case of Kruskal's algorithm, $G'$ and $G$ will result in the same spanning tree $T$, as their edges are examined in the same order.

As $T$ is a MST, because $G'$ has edges with different values, $T$ must be a MST of $G$ as well.

So the Kruskal's case is proven.

In the case of Prim's algorithm, let start $G'$ and $G$ runs with $s$, which $s \in e'_1$ and $s \in e_1$, so both $e'_1$ and $e_1$ are added to their respective results.

To the next iterations, lets break the ties in the way that the nodes are added in the same order for both cases.

Thus both runs will result in the same spanning tree $T$​, as their edges are examined in the same order.

As $T$ is a MST, because $G'$ has edges with different values, $T$ must be a MST of $G$ as well.

So the Prim's case is also proven.

### Problem 15.6

Prove that in a connected undirected graph with distinct edge costs, there is a unique MST.

**ANSWER**

We proceed by contradiction. Assume that the graph $G$ has two distinct MST's, $T_1$ and $T_2$.

$T_1$ must has at least one edge $e_1 = (v, w)$ that is not in $T_2$.

Adding $e_1$ to $T_2$ creates a cycle $C$ that contains $e_1$.

As an edge of $T_1$, $e_1$ satisfies the MBP, so there is at least one edge $e_2 = (x, y)$ in the $v-w$ path $C-\{e_1\}$ with cost at least $c_{vw}$.

As edges' cost are distinct, the cost of $e_2$ must be strictly larger: $c_{xy} > c_{vw}$.

As result, $T_2$ has a cost greater than $T_1$ and it cannot be a MST.

Therefore, $G$ has only one MST.

### Problem 15.7

An alternative approach to proving the correctness of Prim’s and Kruskal’s algorithms is to use what’s called the **Cut Property** of MSTs. Assume throughout this problem that edges’ costs are distinct.

A cut of an undirected graph $G = (V,E)$ is a partition of its vertex set $V$ into two non-empty sets, $A$ and $B$.

An edge of $G$ crosses the cut $(A, B)$ if it has one endpoint in each of $A$ and $B$.

Let $G = (V,E)$ be a connected undirected graph with distinct real-valued edge costs. If an edge $e \in E$ is the cheapest edge crossing a cut $(A, B)$, $e$ belongs to every MST of $G$.

In other words, one way to justify an algorithm’s inclusion of an edge $e$ in its solution is to produce a cut of $G$ for which $e$ is the cheapest crossing edge.

#### a) Prove the Cut Property.

#### b) Use the Cut Property to prove that Prim’s algorithm is correct.

#### c) Repeat b) for Kruskal’s algorithm.

**ANSWER**

**a) Prove the Cut Property.**

We proceed by contradiction.

Let's assume that $T$ is a MST of $G = (V, E)$ and it has an edge $e = (v, w)$, which is not the cheapest edge cross of a cut.

So, there is an edge $e'$ in a path $P$ of $v$-$w$ that is the cheapest edge.

Adding $e'$ to $T$ will create a cycle that is solved by removing $e$, this results in the spanning tree $T'$, which is strictly smaller than $T$.

We arrived at a contradiction and therefore the cut property is proved.

**b) Use the Cut Property to prove that Prim’s algorithm is correct.**

Prim's algorithm works with the cut $X$ and $V-X$, and at it iteration it selects the smaller edge that crosses this and does not create a cycle.

A edge that creates a cycle in that case does not has the cut property, as a previous added edge is smaller than it.

Thus at each iteration, Prim's algorithm selects an edge that has the cut property.

Therefore, at the end of its execution, the Prim's algorithm creates a MST.

**c) Repeat b) for Kruskal’s algorithm.**

Kruskal's algorithm selects at each iteration the smaller edge that does not create a cycle in the current set of edges $T$.

We can create a cut based on that, where $X$ is the set of nodes that are in $T$ and $V-X$.

So after iteration a new node enters $X$ and leaves $V-X$.

An edge that creates a cycle in $T$ cannot have the cut property, as a previous added edge is smaller than it.

Thus at each iteration, Kruskal's algorithm selects an edge that has the cut property.

Therefore, at the end of its execution, the Kruskal's algorithm creates a MST.

### Problem 15.8

Consider a connected undirected graph with distinct real-valued edge costs. A minimum bottleneck spanning tree (MBST) is a spanning tree $T$ with the minimum-possible bottleneck.

#### a) Give a linear-time algorithm for computing the bottleneck of an MBST.

#### b) Does this imply a linear-time algorithm for computing the total cost of an MST?

**ANSWER**

**a) Give a linear-time algorithm for computing the bottleneck of an MBST.**

The bottleneck of an MBST is its highest weighted edge.

Therefore, just traverse the tree and returns its highest weighted edge.

**b) Does this imply a linear-time algorithm for computing the total cost of an MST?**

Yes, you just have to traverse and sum the weights of the MST edges.

## Programming Problems

### Problem 15.9

Implement in your favorite programming language the Prim and Kruskal algorithms. For bonus points, implement the heap-based version of Prim (Section 15.3) and the union-find-based version of Kruskal (Section 15.6). Does one of the algorithms seem reliably faster than the other?

**ANSWER**

**`Prim`**

```ruby
```

**`Kruskal`**

```ruby
```

