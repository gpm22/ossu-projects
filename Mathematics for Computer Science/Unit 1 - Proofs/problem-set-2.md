# Problem Set 2

Questions in [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/a56c7e8c4c265baf3549ab786dc1fdc5/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_ps2.pdf).

## Problem 1

* **a)** Explain how to write a formula $Members(p, a, b)$ of set theory that means $p = \{a, b\}$
  $$
  Members(p, a, b) ::= \forall x \in p. (x = a\ OR\ x=b)
  $$

* **b)** Explain how to write a formula $Pair(p, a, b)$, of set theory that means $p = pair(a, b)$

  Defining a $pair(a, b)$ as $p = \{a, \{a, b\}\}$:
  $$
  Pair(p, a, b) ::= Members(p, a, \{a, b\})
  $$

* **c)** Explain how to write a formula $Second(p, b)$, of set theory that means $p$ is a pair whose second item is $b$.
  $$
  Second(p, b) = Z \in p.(b \notin p\ AND\ b \in Z)\ AND\ Pair(p, a, b)
  $$
  

## Problem 2

​	Prove De Morgan's Law for set equality
$$
\overline{A \cap B} = \overline{A} \cup \overline{B}\ \ \ \ \ \ (2)
\\
\\
\overline{A \cap B} 
\\
iff\ x \notin (A \cap B)
\\
iff\ NOT(x \in A\ AND\ x\in B)
\\
iff\ NOT(x \in A)\ OR\ NOT(x \in B)
\\
iff\ (x \notin A)\ OR\ (x \notin B)
\\
iff\ (x \in \overline{A})\ OR\ (x \in \overline{B})
\\
iff\ x \in (\overline{A} \cup \overline{B})
\\
iff\ \overline{A} \cup \overline{B}
\\
Q.E.D
$$

## Problem 3

* **a)** Show that if $R$ and $S$ are $c$-$d$, then so is $R \cap S$.
  * As $R \cap S \iff x \in R\ \and x \in S$, so if all the elements of $R$ and $S$ are concatenation-definable, the elements of $R \cap S$ must also be concatenation-definable;
* **b)** Show that the language consisting of the binary words that start with **0** and end with **1** is $c$-$d$.
  * This language is defined as $\forall x. y = 0x1$, so this language can be formed by te concatenation of 0 and 1 to the language of the $x$ words.
* **c)** Show that $0^*$ is $c$-$d$.
  * 
* **d)** Show that $\{01\}^*$ is  $c$-$d$.
  * 
* **e)** Explain why $\{00\}^*$ is not boring.
  * As $\{00^*\} \cap 0^*$ does not have a finite set of words.
* **f)** Verify that if $R$ and $S$ are boring, then so is $R \cup S$.
  * As both $R$ and $S$ has a finite set of number where all are 0's, so their union also will have a finite set of number where all are 0's.
* **g)** Verify that if $R$ and $S$ are boring, then so is $R \cdot S$.
  * As both $R$ and $S$ has a finite set of number where all are 0's, so their concatenation also will have a finite set of number where all are 0's.
* **h)** Explain why all  $c$-$d$ languages are boring.
  * 