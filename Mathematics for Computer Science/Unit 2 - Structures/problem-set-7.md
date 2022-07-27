# Problem Set 7

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/928a5fa2e85cef96a30fa3e58dbf5682/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_ps7.pdf)

## Problem 1

Let $R$ and $S$ be transitive binary relations on the same set, $A$. Which of the following new relations must also be transitive? For each part, justify your answer with a brief argument if the new relation is transitive and a counterexample if it is not.

* **a)** $R^{ -1}$
  * Must also be transitive, as like the relation divides and being divisible;
* **b)** $R \cap S$
  * Not must also be transitive, as different properties can might compare different stuff;
* **c)** $ R \circ R$
  * Must also be transitive, as like the relation divides;
*  **d)** $R \circ S$
  * Not must also be transitive, as different properties can might compare different stuff;

## Problem 2

Let $R_1$ and $R_2$ be two equivalence relations on a set, $A$. Prove or give a counterexample to the claims that the following are also equivalence relations:

* **a)** $R_1 \cap R_2$
  * It is not an equivalence relations, as it not assure to keep the symmetry, reflexivity and transitivity; 
* **b)** $R_1 \cup R_2$
  * It is also equivalence relations as it keeps the symmetry, reflexivity and transitivity; 

## Problem 3

Determine which among the four graphs pictured in Figure 1 are isomorphic. 

* Isomorphic pairs:
  * $G_1$ and $G_4$
    * There is the bijection $f : V(G_1) \to V(G_4)$ :
      * $1 \to 1$;
      * $2 \to 2$;
      * $3 \to 3$;
      * $4 \to 8$;
      * $5 \to 9$;
      * $6 \to 10$;
      * $7 \to 6$;
      * $8 \to 4$;
      * $9 \to 5$;
      * $10 \to 7$;
* Nonisomorphic pairs:
  * $G_1$ and $G_3$
    * They have different numbers of edges;
  * $G_2$ and $G_3$
    * They have different numbers of edges;
  * $G_3$ and $G_4$
    * They have different numbers of edges;
  * $G_1$ and $G_2$
    * In $G_2$ there are 5 4-length cycles, which don't exist in $G_1$.
  * $G_2$ and **$G_4$**
    * In $G_2$ there are 5 4-length cycles, which don't exist in $G_4$.

## problem 4

* **a)** Prove that the following theorem is false by drawing a counterexample:

  * **False Theorem.** Every two-ended graph is a line graph.
  * As a two-end graph does not need to be a complete graph, the following is counterexample:
  * ![q-3-problem-set-7](https://raw.githubusercontent.com/gpm22/ossu-projects/main/Mathematics%20for%20Computer%20Science/Unit%202%20-%20Structures/q-3-problem-set-7.png)

* **b)** Point out the first erroneous statement in the following bogus proof of the false theorem and describe the error.

  **Bogus proof**. We use induction. The induction hypothesis is that every two-ended graph with n edges is a path.

  **Base case** $(n = 1)$: The only two-ended graph with a single edge consists of two vertices joined by an edge, which is, sure enough, a line graph.

  **Inductive case**: We assume that the induction hypothesis holds for some $n \geq 1$ and prove that it holds for
  $n + 1$.  Let $G_n$ be any two-ended graph with $n$ edges. **(Erroneous Stament) By the induction assumption, $G_n$ is a line graph.** Now suppose that we create a two-ended graph $G_ {n+1}$ by one more adding edge to $G_n$. This can be done in only one way: the new edge must join an endpoint of $G_n$ to a new vertex; otherwise, $G_{n+1}$ would not be two-ended. Clearly, $G_{n+1}$ is also a line graph. Therefore, the induction hypothesis holds for all graphs with $n+1$ edges, which completes the proof by induction.

  As showed in the question **a)**, not all two-ended graphs are line graphs;

  
