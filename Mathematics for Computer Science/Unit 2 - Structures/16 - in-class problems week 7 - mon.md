# In-Class Problems Week 7, Mon.

Problems available in [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/8d28f7366184ca6678568d50f9a09e85/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp16.pdf).

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

* **a)** Say a string is **3-good** if it contains every 3-bit string as 3 consecutive bits somewhere in it. Find a 3-good string of length 10, and explain why this is the minimum length for any string that is 3-good.
  * **00 0 10 1 11 0 0**
    * **000** 1011100
    * 0 **001** 011100
    * 00 **010** 11100
    * 000 **101** 1100
    * 0001 **011** 100
    * 00010 **111** 00
    * 000101 **110** 0
    * 0001011 **100**
  * You have 3 digits and 8 necessary combinations, so the minimal number of combinations are $3^2 + 1 = 10$
* **b)** Explain how any walk that includes every edge in the graph shown in Figure 1 determines a string that is 3-good. Find the walk in the graph that determines your 3-good string from part **a)**.
  * Each step in the walk will create an 3 bit string and any walk passing through all its edges will create a string with all the possible 3-bits in it, meaning it is a 3-good string.
  * 00 1 01
* **c)**
* **d)**

## Problem 4

* **a)** Give an example of a tournament digraph with more than one ranking.
  *  Any graph has at least 4 players;
* **b)** Prove that every finite tournament digraph has a ranking.
  * In a finite tournament digraph each node has $n-1$ edges and it is impossible to have tied games, so it will exist at least $n-2$ players with victories and defeats. Then is always possible to create a path connecting all players, therefore every finite tournament digraph has a ranking.

