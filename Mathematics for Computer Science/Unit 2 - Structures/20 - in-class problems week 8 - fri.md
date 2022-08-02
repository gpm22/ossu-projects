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

## Problem 4

