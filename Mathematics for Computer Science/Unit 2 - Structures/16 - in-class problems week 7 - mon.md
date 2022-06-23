# In-Class Problems Week 7, Mon.

## Problem 1

* **a)** Given an example of a digraph in which a vertex $v$ is on a positive even-length closed walk, but **no** vertex is on an even-length cycle.

  * Just need to create a cycle with even-length and then add 2 edges point in different directions of 2 arbitrary edges.

* **b)** Give an example of a digraph in which a vertex $v$ is on a odd-length closed walk, but not on an odd-length cycle.

  * Just need to create a cycle with odd-length and then add 2 edges point in different directions of 2 arbitrary edges.

* **c)** Prove that every odd-length closed walk contains a vertex that is on an odd-length cycle

  **Proof.** We argue by cases that every odd-length closed walk contains a vertex that is on an odd-length cycle.

  * **case 1:** The graph is an odd-length cycle;
    * This is trivial;
  * **case 2: ** The graph is an even-length cycle added with a new edge connecting two unconnected points.
    * Excluding the points that are behind or ahead of the new edge will leave a cycle.
  * **case 3:** The graph is an cycle with odd-length added with 2 edges point in different directions of 2 arbitrary edges.
    * Just exclude the 2 new edges;

## Problem 2

* **a)** Prove from left to right that $\text{dist}(u, v) = \text{dist}(u, x) + \text{dist}(x, v)$ iff $x$ is on a shortest path from $u$ to $v$.

  * $\text{dist}(u, v)$ is the shortest path between $u$ and $v$, so if $x$ is part of that path, then $x$ is between $u$ and $v$.

    Therefore the sum of the shortest path between $u$ and $x$ with the shortest path between $x$ and $v$ is equal to the shortest path between $u$ and $v$.

* **b)** Prove from right to left that $\text{dist}(u, v) = \text{dist}(u, x) + \text{dist}(x, v)$ iff $x$ is on a shortest path from $u$ to $v$.

  * As $x$ is between $u$ and $v$ and is also part of the shortest path between $u$ and $v$, the shortest path between $u$ and $v$ is equal to  the sum of the shortest path between $u$ and $x$ with the shortest path between $x$ and $v$.

## Problem 3

## Problem 4

