# In-Class Problems Week 3, Fri.

Questions in [MIT](https://openlearninglibrary.mit.edu/assets/courseware/v1/62df39bbb4a601c196f93c01c09acc58/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp7.pdf).

## Problem 1

Fill in the remaining entries in this table:

| $R$ is           | iff $R^{-1}$ is |
| ---------------- | --------------- |
| **total**        | a surjection    |
| **a function**   | an injection    |
| **a surjection** | total           |
| **an injection** | a function      |
| **a bijection**  | a bijection     |



## Problem 2

Let $A = \{a_0, a_1, ..., a_{n-1}\}$ be a set of size $n$, and $B = \{b_0, b_1, ..., b_{n-1}\}$ a set of size $m$. Prove that $|A \times B| = mn$ by defining a simple bijection from $A \times B$ to the nonnegative integers from 0 to $nm-1$. 

$A \times B$ is
$$
A \times B = \{ (a_0, b_0), (a_0, b_1), ..., (a_{n-1}, b_{n-1}) \}
$$
The bijection from $A \times B$ to the nonnegative integers from 0 to $nm-1$ will have $nm$ elements, so
$$
|A \times B| = nm
$$

## Problem 3

Assume $f: A \rightarrow B$ is a total function, and $A$ is finite. Replace the $\star$ with one of $\leq$, $=$, $\geq$ to produce the strongest correct version of the following statements:

* **a)** $|f(A)| \star |B|$.
  * $|f(A)| \leq |B|$
  * I do not have any information about the cardinality of B.
* **b)** If $f$ is a surjection, then $|A| \star |B|$ .
  * $|A| \geq |B|$
* **c)** If $f$ is a surjection, then  $|f(A)| \star |B|$.
  * $|f(A)| \geq |B|$
* **d)** If $f$ is an injection, then  $|f(A)| \star |B|$.
  * $|f(A)| \leq |B|$
* **e)** If $f$ is a bijection, then $|A| \star |B|$ .
  * $|A| = |B|$

## Problem 4

Let $R: A \rightarrow B$ be a binary relation. Use an arrow counting argument to prove the following generalization of the Mapping Rule 1 in the course textbook.

**Lemma**. If $R$ is a function, and $X \subseteq A$, then
$$
|X| \geq |R(X)|
$$
$R$ being a function means that it has at most 1 arrow out for each element, so at most $|R(X)| = |X|$, then $|X| \geq |R(X)|$.

## Problem 5

* **a)** Prove that if $A\ surj\ B$ and $B\ surj\ C$, then $A\ surj\ C$.
  * **Surjective** means that all elements of $B$ has at least a pair with a element of $A$. So if all elements of $C$ has at least a pair with a element of $B$, which has at least a pair with a element of $A$, then all elements of $C$ will also have at least a pair with a element of $A$.
* **b)** Explain why $A\ surj\ B$ iff $B\ inj\ A$.
  * As shown in the **problem 1**, the $R^{-1}$ of a function is an injection and the $R^{-1}$ of a surjection is a total relation. So the $R^{-1}$ of a **surjective function**, $surj$, is an **injective total relation**, $inj$.
* **c)** Conclude from **a)** and **b)** that if $A\ inj\ B$ and $B\ inj\ C$, then $A\ inj\ C$
  * An **injective total relation**, $inj$, means that all elements of $A$ has a pair with a element of $B$, but not necesserily all elements of $B$ has a pair with a element of $A$. So if not all elements of $C$ has necessarily a pair with $B$, whereas all elements of $B$ has a pair with a element of $C$, then all elements of $A$ will have also a pair with elements of $C$, but elements of $C$ will not necessarily have a pair with elements of $A$.
* **d)** Explain why $A\ inj\ B$ iff there is a **total injective function** ([= 1 out], [$\leq$ 1 in]) from $A$ to $B$.
  * Because $inj$ is a **injective total relation**, which means that all elements of $A$ has at least a pair with a lement of $B$, but elements of $B$ just can have only one pair, so the relation is also a **function**.