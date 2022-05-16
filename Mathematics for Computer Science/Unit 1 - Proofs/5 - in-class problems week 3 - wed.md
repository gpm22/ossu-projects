# In-Class Problems Week 3, Wed.

Questions in [MIT](https://openlearninglibrary.mit.edu/assets/courseware/v1/f79ec0319cdfa4393b9b6ead98cf6827/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp6.pdf).

## Problem 1

* **a)** Verify that the propositional formula $(P\ AND\ \overline{Q})\ OR\ (P\ AND\ Q)$ is equivalent to $P$
  $$
  (P\ AND\ \overline{Q})\ OR\ (P\ AND\ Q)
  \\
  P\ AND\ (\overline{Q}\ OR\ Q)
  \\
  P\ AND\ T
  \\
  P
  $$
  

* **b)** Prove that $A = (A - B) \cup (A \cap B)$ for all sets **A** and **B** by showing $x \in A \iff x \in (A - B) \cup (A \cap B)$ for all elements **x**, using the equivalente of part **a)** in a chain of **IFF's**.
  $$
  x \in (A - B) \cup (A \cap B)
  \\
  IFF\ x \in (A-B)\ OR\ x \in (A \cap B)
  \\
  IFF\ (x \in A\ AND\ x \notin B)\ OR\ (x \in A\ AND\ x \in B)
  \\
  IFF\ x \in A\ AND\ (x \notin B\ OR\ x \in B)
  \\
  IFF\ x \in A\ AND\ T
  \\
  IFF\ x \in A
  $$

## Problem 2

Express each of the following assertions about sets by a formula of set theory.

* **a)** $X = \emptyset$
  $$
  (X = \emptyset) ::= \forall z. (z \notin X)
  $$

* **b)** $X = \{Y, Z\}$
  $$
  X = \{Y, Z\} ::= Y \in X\ AND\ Z \in X
  $$

* **c)** $X \subseteq Y. $ 
  $$
  (X \subseteq Y. ) ::= \forall z \in X. z \in Y
  $$

* **d)** $X = Y \cup Z$
  $$
  (X = Y \cup Z) ::= \forall z \in X. (z \in Y)\ OR\ (z \in Z)
  $$

* **e)** $X = Y - Z$
  $$
  (X = Y - Z) ::= \forall z \in X. (z \in Y)\ AND\ (z \notin Z)
  $$

* **f)** $X = pow(Y)$
  $$
  (X = pow(Y)) ::= \forall Z \in X\ \ \forall z \in Z. (z \in Y)
  $$

* **g)** $X = \cup_{Z \in Y}Z$

  * $\cup_{Z \in Y}Z$ means that $Y$ is supposed to be a collection of sets, and $X$ is the union of all them.

  $$
  (X = \cup_{Z \in Y}Z) ::= \forall z \in A. \exists Z \in \cup_{Z \in Y}Z. (z \in Z)
  $$

## Problem 3

* **a)** Explain why representing $(a, b)$ by $\{a, b\}$ won't work.
  * Because the order of the elments matters.
* **b)** Explain why repreenting $(a, b)$ by $\{a, \{b\}\}$ won't work either.
  * Because **{b}** is a set and not the element **b**.
* **c)** Define $pair(a, b) ::= \{a, \{a, b\}\}$, explain why representing $(a, b)$ as $pair(a, b)$ uniquely determines $a$ and $b$.
  * Because a pair has obviously two itens, so you need two distinguishable itens to represent it. You get it using a set formed by one element of the pair and a set containing the elements of the pair. You preserve the order of the pair, by knowing thar the first element is alone as an element of the set.

## Problem 4

Verify, for the subset take-away game, that when $A$ has four elements, the second player still has a winning strategy.

* It does not matter which the first player chooses, as the seconde player will choose the remaining subset and will win.