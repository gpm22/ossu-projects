# Midterm Exam April 15

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/839af697dd511023b6b1d7896ef7ba1f/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_midterm3.pdf).

## Problem 1

Given DAG:

```
A-->D-->E-->G
	  /^
     / 
   /
B/-->F->H
    /^ 
  /
C
```

* **a)** What are the two maximum size antichains?

  1. $\{A. B, C \}$
  2. $\{G, H\}$

* **b)** If each task takes unit time to complete, what is the minimum parallel time to complete all the tasks?

  * 4 units.
    $$
    \{A, B, C \} \to \{D, F \} \to \{E, H \} \to \{G\}
    $$
    

* **c)** What is the minimum parallel time if no more than two tasks can be completed in parallel?

  * 4 units
    $$
    \{A, B\} \to \{C, D\} \to \{E, F \} \to \{G, H\}
    $$
    

## Problem 2

Let $A$ be a nonempty set.

* **a)** Describe a single relation on $A$ that is both an equivalence relation and a weak partial order on $A$.
  * This relation must be **transitive**, **reflexive**, **antisymmetric**, and **symmetric**.
  * This realtion is the identity relation, which is $\{ (a_1, a_1), (a_2, a_2), \dots \}$.
* **b)** Prove that the relation of part **a)** is the only relation on $A$ with these properties
  * Any other relation cannot be both **antisymmetric** and **symmetric**, this is only possible when you relating the same elements.

## Problem 3

* **a)** Give an example of a simple graph that has two vertices $u \neq v$ and two distinct paths between $u$ and $v$, but no cycle including either $u$ or $v$.

  * Vertices: $\{ 1, 2, 3, 4, 5 \}$

  * Edges: $\{1-2, 2-3, 2-4, 3-4, 4-5\}$

  * Visual:

    ```
    
    
    1 -- 2 -- 3
    	  \ /
    	   4 -- 5
    ```

* **b)** Prove that if there are different paths between two vertices in a simple graph, then the graph has a cycle.

  * Lets assume that has two different paths $P_1$ and $P_2$ between two vertices but without cycles, where $P_1$ is of minimal length.
  * So if $P_1$ and $P_2$ have a third vertex in common, we can get a shorter path connecting one of the other vertices directly to this third vertex, which is a contradiction.
  * Therefore, there is a cycle in this graph. 

## Problem 4

Prove by induction that, using a fixed set of $n > 1$ colors, there are exactly $n \cdot (n-1)^{m-1}$ different colorings
of any tree with $m$ vertices.

We prove by induction that using a fixed set of $n > 1$ colors, there are exactly $n \cdot (n-1)^{m-1}$ different colorings
of any tree with $m$ vertices.

Hyphotesis: $P(m) ::= \{n>1 \ | \ n \cdot (n-1)^{m-1} \}$

Base case: $P(1) :: =n$, this is trivial, as if you only have one vertex and $n$ colors, you can color it in $n$  different ways.

Inductive Step: we assume that it holds for $P(m)$, so
$$
 P(m+1) & ::= & n \cdot (n-1)^{m} \\
 & ::= & P(m)(n-1)
 
$$
So as it also holds for $P(m+1)$, $P(m)$ holds for any positive integer.

## Problem 5

Let Alice be one of the women, and Bob be one of the men. Bold the properties below that are preserved invariants of the Mating Ritual when there are at least as many men as women:

* **a)** Alice has a suitor (man who is serenading her) whom she prefers to Bob.
* **b)** Alice is the only woman on Bob's list.
* **c) Alice has no suitor.**
* **d)** Bob prefers Alice to the women he is serenading.
* **e)** Bob is serenading Alice.
* **f)** Bob is not serenading Alice.
* **g) Bob's list of women to serenade is empty**

## Problem 6

There is a number $a$ such that $\sum_{i=1}^{\infty}i^p$ converges to a finite value iff $ p < a$.

* **a)** What is the value of $a$?

  * First we have to solve the integral of $x^p$

  $$
  I & = & \lim_{n \to \infty} \int_1^n x^pdx \\ 
    & = & \lim_{n \to \infty} \left[ \frac{x^{p+1} }{p+1} \right]_1^n \\
    & = & \lim_{n \to \infty} \frac{n^{p+1}-1}{p+1}
  $$

  * $I$ will converge if  $p < -1$, therefore $a = -1$.

* **b)** Bold all of the following that would be good approaches as part of a proof that this value of a is correct

  1. **Find a closed form for $\int_1^\infty x^pdx$.**
  2. Find a closed form for $\int_1^\infty i^pdp$.
  3. **Induction on $p$.**
  4. Induction on $n$ using the following sum $\sum_{i=1}^n i^p$
  5. **Compare the series term-by-term with the Harmonic series.**