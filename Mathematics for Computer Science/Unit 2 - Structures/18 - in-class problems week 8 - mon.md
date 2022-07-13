# In-Class Problems Week 8, Mon.

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/fd07cae350b7c5f7e4a745704b7f7845/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp18.pdf).

## Problem 1

For each of the binary relations below, state whether it is a strict partial order, a weak partial order, an equivalence relation, or none of these. If it is a partial order, state whether it is a linear order. If it is none, indicate which of the axioms for partial-order and equivalence relations it violates.

* **a)** The superset relation $\supseteq$ on the power set $\text{pow}\{ 1,2,3,4,5 \}$.
  * It is a weak partial order.
  * It is not a linear order.
* **b)** The relation between any two nonnegative integers $a$ and $b$ such that $ a \equiv b \quad (\text{mod } 8)$.
  * Equivalence relation.
* **c)** The relation between propositional formulas $G$ and $H$ such that $[G \Rightarrow H]$ is valid.
  * none
  * It is reflexive and not antisymmetric, so cannot be a partial order.
  * It is not necessarily symmetric, so cannot be a equivalence relation. 
* **d)** The relation between propositional formulas $G$ and $H$ such that $[G \iff H]$ is valid.
  * Equivalence relation.
* **e)** The relation ‘beats’ on Rock, Paper, and Scissors.
  * none.
  * It is not transitive, so it cannot be any of the options.
* **f)** The empty relation on the set of real numbers.
  * strict partial order;
  * It is not a linear order;
* **g)** The identity relation on the set of integers.
  * weak partial order;
  * it is not a linear order;
* **h)** The divisibility relation on the integers, $\Z$.
  * none;
  * Is not reflexive or irreflexive, therefore cannot be any of the possible options;

## Problem  2

The proper subset relation, $\subset$ , defines a strict partial order on the subsets of $[1..6]$, that is, on $\text{pow}([1..6])$.

* **a)** What is the size of a maximal chain in this partial order? Describe one. 

  * 6;
  * $\empty \subset \{1\} \subset \{1, 2\} \subset \{1, 2, 3\} \subset \{1, 2, 3 ,4\} \subset \{1,2,3,4,5\} \subset \{1,2,3,4,5,6\}$

* **b)** Describe the largest antichain you can find in this partial order. 
  $$
  \{\{1, 2 ,3 \}, \{1, 2, 4\}, \{1, 2, 5\}, \{1, 2, 6\}, \{1, 3, 4\}, \\
  \{1, 3, 5\}, \{1, 3, 6\}, \{1, 4, 5\}, \{1, 4, 6\},  \{1, 5, 6\}, \\ 
  \{2, 3, 4\}, \{2,3,5 \}, \{2, 3, 6 \} , \{2,4,5 \}, \{2, 4, 6 \}, \\
   \{2, 5, 6\}, \{3, 4, 5\}, \{3, 4, 6\}, \{3,5, 6\}, \{4, 5, 6\} \}
  $$
  

* **c)** What are the maximal and minimal elements? Are they maximum and minimum?

  * The minimal is the empty set and the maximal is the set $[1..6]$
  * Yes, they are respectively the minimum and the maximum elements. 

* **d)** Answer the previous part for the $\subset$ partial order on the set $\text{pow}[1..6] - \empty$.

  * The minimals elements are $\{1\}, \{2\}, \{3\}, \{4\}, \{5\}, \{6\} $and the maximal is the set $[1..6]$;
  * The set $[1..6]$ is the maximum elements and there are no minimum elements. 

## Problem 3

## Problem 4

For any total function $f : A \to B$ define a relation $\equiv_f$ by the rule:
$$
a \equiv_f a' \iff f(a) = f(a')
$$

* **a)** Observe (and sketch a proof) that $\equiv_f$ is an equivalence relation on $A$.

  * $\equiv_f$ is **reflexive**, as $f(a) = f(a)$
  * $\equiv_f$ is **symmetric**, as if $f(a) = f(a') \iff f(a') = f(a)$;
  * $\equiv_f$ is **transitive**, as if $f(a) = f(b)$ and $f(b) = f(c)$, then $f(a) = f(c)$.
  * As $\equiv_f$ has these 3 properties, therefore it is a equivalence relation on $A$.

* **b)** Prove that every equivalence relation, $R$, on a set, $A$, is equal to $\equiv_f$ for the function $ f : A \to \text{pow}(A)$ defined as
  $$
  f(a) ::= \{ a' \in A\ |\ a\ R\ a' \}
  $$
  That is, $f(a) = R(a)$.

  **Answer**:

  $f$ is defined as for any $a$ there is a $a'$ such $a\ R\ a'$. Also the codomain is defined as $\text{pow}(A)$, so it is clear that, as $R$ is a equivalence relation, that the relation $\equiv_f$ will be $R$.
  $$
  f(a) & = & f(a') \\
  & = & \{a \in A\ |\ a'\ R\ a   \} \\
  & = & R(a)
  $$
  

