# In-Class Problems Week 8, Fri.

Problems available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/5a63aa03ffc9cbbf7df354da0c8f8348/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp20.pdf);

## Problem 1

* **a)**  Recast the register allocation problem as a question about graph coloring. 

  * What do the vertices correspond to? 

    * **The vertices are the variables.**

  * Under what conditions should there be an edge between two vertices? 

    * **When they cannot be allocated to the same register.**

  * Construct the graph corresponding to the example above.

    * $V(G) = \{a, b, c, d, e, f, g, h  \}$

    * $$
      E(G) = \{ \langle a-b \rangle, \langle a-c \rangle, \langle a-d \rangle, \langle a-e \rangle, \langle a-f \rangle, \langle c-d \rangle,  \langle c-e \rangle, \langle d-e \rangle, \langle d-f \rangle, \langle d-g \rangle, \langle d-h \rangle, \langle f-g \rangle, \langle f-h \rangle, \langle g-h \rangle, \}
      $$

* **b)**  Color your graph using as few colors as you can. Call the computer's registers R1, R2, etc. Describe the assignment of variables to registers implied by your coloring. How many registers do you need?

  * I need 4 Registers
  * $R_1 = \{ a, h \}$
  * $R_2 = \{b, d\}$
  * $R_3 = \{c, f \}$
  * $R_4 = \{e, g \}$

* **c)**  Suppose that a variable is assigned a value more than once, how might you cope with this complication?

  * Use the same register to that variable;

## Problem 2

* **a)** Prove that "If every vertex in a graph has positive degree, then the graph is connected." is false by providing a counter example;

  * $V(G) = \{a, b, c,d, e\}$
  * $E(G) = \{ \langle a-b \rangle,  \langle b-c \rangle,  \langle c-a \rangle,  \langle d-e \rangle,  \}$

* **b)**

* Since the Claim is false, there must be a logical mistake in the following bogus proof. Pinpoint the 1rst
  logical mistake (unjustified step) in the proof.

  * **Bogus proof.** We prove the Claim above by induction. Let $P(n)$ be the proposition that if every vertex in an $n$-vertex graph has positive degree, then the graph is connected.

  * **Base case**: $( n \leq 2)$ In a graph with 1 vertex, that vertex cannot have positive degree, so $P(1)$ holds vacuously. 

    $P(2)$ holds because there is only one graph with two vertices of positive degree, namely, the graph with an edge between the vertices, and this graph is connected.

  * **Inductive step**: We must show that $P(n)$ implies $P(n + 1)$ for all $n \geq  2$. Consider an $n$-vertex graph in which every vertex has positive degree. By the assumption $P(n)$, this graph is connected; that is, there is a path between every pair of vertices. Now we add one more vertex $x$ to obtain an $(n + 1)$-vertex graph.

    **The logical mistake is to assume that $P(n)$ is connected**.

    All that remains is to check that there is a path from $x$ to every other vertex $z$. Since $x$ has positive degree, there is an edge from $x$ to some other vertex, $y$. Thus, we can obtain a path from $x$ to $z$ by going from $x$ to $y$ and then following the path from $y$ to $z$. This proves $P(n + 1)$. 

    By the principle of induction, $P(n)$ is true for all $n \geq 0$, which proves the Claim.

## Problem 3

* **a)** Prove that there exists a 3-coloring of the graph iff neither $P$ nor $Q$ are colored $N$.

  * As $P$ or $Q$ cannot be $N$, the following is the base case.

  * ![q-3-in-class-problems-20](https://raw.githubusercontent.com/gpm22/ossu-projects/main/Mathematics%20for%20Computer%20Science/Unit%202%20-%20Structures/q-3-in-class-problems-20.png)

  * From the previous image, we can create a Table of possible values

    | $P$  | $Q$  | $L$  | $R$  |
    | ---- | ---- | ---- | ---- |
    | T    | T    | N/F  | F/N  |
    | T    | F    | F    | N    |
    | F    | T    | N    | F    |

  * So there is more than one 3-coloring of the graph iff neither $P$ nor $Q$ are colored $N$.

* **b)** Argue that the graph in Figure 1 acts like a two-input OR-gate: a valid 3-coloring of the graph has the vertex labelled $(P \text{ OR } Q)$ colored $T$ iff at least one of the vertices labelled $P$ and $Q$ are colored $T$.

  * It acts indeed as a two-input OR-gate as it has a $(P \text{ OR } Q)$ node that must be **T**, as we can see in the previous image.

* **c)** Changing the endpoint of one edge in Figure 1 will turn it into a two-input AND simulator. Explain.

## Problem 4

* **a)** Verify that for any two vertices $x \neq y$ of $H_3$, there are 3 paths from $x \to y$ in $H_3$, such that, besides $x$ and $y$, no two of those paths have a vertex in common.

  * $V(H_3) = \{ 000, 001, 010, 011, 100, 101, 110, 111 \}$

  * $$
    E(H_3) & = & \{ \langle 000-001 \rangle, \langle 000-010 \rangle, \langle 000-100 \rangle \\
    & & \ \langle 010-011 \rangle, \langle 010-110 \rangle, \langle 110-100 \rangle \\
    & & \ \langle 011-111 \rangle, \langle 011-001 \rangle, \langle 100-101 \rangle \\
    & &  \ \ \langle 111-101 \rangle, \langle 111-110 \rangle, \langle 101-001 \rangle \}
    $$

  * All vertices in $H_3$ has 3 edges connected to vertices where the difference is 1 digit, therefore showing that property for two vertices is enough:
    $$
    000 \to 001 & : & \langle 000 - 001 \rangle \\ & & \langle 000 - 100 \rangle \langle 100 - 101 \rangle \langle 101 - 001 \rangle \\ & &  \langle 000 - 010 \rangle \langle 010 - 011 \rangle \langle 011 - 001 \rangle \\
    $$

  * The logic of the path here is that to go to any other ticket you will at most need 3 edges, as you need to change at most 3 digits.

* **b)** Conclude that the connectivity of $H_3$ is 3.

  * As to go to any node you need at most 3 edges and each node has degree 3, you need to remove at least 3 edges to divide the graph in 2 isolated subgraphs.

* **c)** Try extending your reasoning to $H_4$.

  * The idea is the same for any $H_n$, as you have nodes with degree $n$ and you need at most $n$ edges to go from any node to any other different node. So the connectivity of $H_n$ is $n$, therefore the connectivity of $H_4$ is 4.

