# In-Class Problems Week 9, Mon.

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/88c4180bafc5bd1ededd3973d018f6de/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp21.pdf).

## Problem 1

Vertices of $4 \times 4$ grid:

$V(G) = [0,3]^2 ::= \{(k,j) \ | \ 0 \leq k, j \leq 3 \}$

For $i \in [0, 2]$ and $j \in [0, 3]$, the horizontal and vertical edges are:

$h_ {i,j} ::= \langle (i, j) - (i+1, j) \rangle$

$v_ {i,j} ::= \langle (j, i) - (j, i+1) \rangle$

These edges have the weights:

$w(h_{i, j}) ::= \frac{4i + j}{100}$

$w(v_{i, j}) ::= 1 + \frac{i + 4j}{100}$

* **a)** Construct a minimum weight spanning tree (MST) for $G$ by initially selecting the minimum weight edge, and then successively selecting the minimum weight edge that does not create a cycle with the previously selected edges. Stop when the selected edges form a spanning tree of $G$. (This is Kruskal’s MST algorithm). Explain how the “gray edge” Lemma 11.10.11 justifies this algorithm in the course textbook.
  * The MST contain all the horizontal edges and the $v_{0, i}$ edges and has a total weight of **3.69**;
  * This algorithm is justified, as it chooses the minimum weight edge without creating a cycle, so each chosen edge is always a gray one.
* **b) **Grow an MST for $G$ starting with the tree consisting of the single vertex $(1, 2)$ and successively adding the minimum weight edge with exactly one endpoint in the tree. Stop when the tree spans G. (This is Prim’s MST algorithm.) Explain how the “gray edge” Lemma 11.10.11 justifies this algorithm in the course textbook.
  * The MST contain all the horizontal edges and the $v_{0, i}$ edges and has a total weight of **3.69**;
  * This algorithm is justified, as it chooses the minimum weight edge with exactly one endpoint in the tree, so it will be choosing successively edges that cannot form a cycle. Considering the tree vertices as white and the vertices outside the tree as black, each chosen edge will always be a gray one.
* **c)** Grow an MST for $G$ by treating the vertices $(0, 0), (0, 3), (2, 3)$ as 1-vertex trees and then successively adding, for each tree in parallel, the minimum weight edge among the edges with one endpoint in the tree. Continue as long as there is no edge between two trees, then go back to applying the general gray edge method until the parallel trees merge to form a spanning tree of $G$. (This is 6.042’s parallel MST algorithm.)
  * The MST contain all the horizontal edges and the $v_{0, i}$ edges and has a total weight of **3.69**;
* **d)** Verify that you got the same MST each time
  * They are all the same, the tree with all the horizontal edges and the $v_{0, i}$ edges and has a total weight of **3.69**;

## Problem 2

Prove that a graph is a tree iff it has a unique path between every two vertices.

**Answer**.  If the graph has a unique path between every two vertices, it also does not have cycles and it is connected, therefore it is a tree.

## Problem 3

We prove by contradiction that if $e$ is the smallest weight edge in a graph $G$, then it must be part of the MST of $G$.

Let's first assume that there is a MST without $e$, so in that MST we can have the following situations

1. There is an edge $f$ connecting the same endpoints of $e$, so in that case we got a contradiction and this is not a MST.
2. There is no edge between the endpoints of $e$, but there is one path between them, as it is a tree. But the tree formed by this path will not be indeed a pre-MST, as the true pre-MST must contain $e$. Therefore we got a contradiction and this is not a MST.

Therefore $e$ must be in the MST of $G$.

## Problem 4

* **a)** Prove that every graph with width one is a forest.
  * If you recreate the graph using the list of nodes you will get a forest. You start by the latest nodes, which must be degree 1. Then removing them from list, you got new degrees one. Keep doing it until you got the roots.
* **b)** Prove that every finite tree has width one. Conclude that a graph is a forest iff it has width one.
  * As between every node in a tree there is a unique path, you can create a list of width one by starting by the root, then the root child, the root child child, and etc., until you get to the leaves.
  * As a forest is compound by trees, it can be organized to create a list with width one. Combining this with the fact that every graph with width one is a forest, a graph is a forest iff it has width one.