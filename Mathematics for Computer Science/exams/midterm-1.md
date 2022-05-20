# Midterm Exam February 25

Questions in [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/958beb72e297ae53b13636f4e77f3f08/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_midterm1.pdf).

## Problem 1

Prove that $\sqrt[7]{35}$ is irrational.

**Proof.** We prove by contradiction that $\sqrt[7]{35}$ is irrational.

Assume that $\sqrt[7]{35}$ is rational, then 
$$
\sqrt[7]{35} = \frac{n}{m}
$$
Where $n$ and $m$ are integers. So
$$
n = m \sqrt[7]{35}
$$
As $m$ is assumed to be an integer, to $n$ be an integer, $\sqrt[7]{35}$ must also be an integer, but it is not, as $35 = 5 \times 7$. So, as $n%$ cannot be an integer, $\sqrt[7]{35}$ cannot be rational, there it is irrational.



## Problem 2

Use the Well Ordering Principle to prove that the equation $3a^4 + 9b^4 = c^4$ has no positive integer solutions.

Suppose the existence of a set composed of the integer positive solutions of $3a^4 + 9b^4 = c^4$, therefore it must has a minimum element $a$.

$c$ must be a multiple of 3, so $c= 3c_2$: 
$$
3a^4 + 9b^4 = (3c_2)^4 \\
3a^4 + 9b^4 = 81c_2^4 \\
a^4 + 3b^4 = 27c_2^4
$$
$a$ must be a multiple of 3, so $a = 3a_2$: 
$$
(3a_2)^4 + 3b^4 = 27c_2^4  \\
81a_2^4 + 3b^4 = 27c_2^4\\
27a_2^4 + b^4 = 9c_2^4
$$
$b$ must be a multiple of 3, so $b = 3b_2$:
$$
27a_2^4 + (3b_2)^4 = 9c_2^4\\
27a_2^4 + 81b_2^4 = 9c_2^4\\
3a_2^4 + 9b_2^4 = c_2^4 
$$
So, $a_2 = a$, $b = b_2$, $c=c_2$ which is a contradiction, then the set of solutions is empty and therefore the equation $3a^4 + 9b^4 = c^4$ has no positive integer solutions.

## Problem 3

Express each of the following predicates and propositions in formal logic notation. 

* **a)** $x = 1$
  * $\forall y. y \times x = y$
* **b)** $m | n$
  * $\exists x. x \times m = n$
* **c)** $n$ is a prime number
  * $\forall y. y \neq n \and y \times n \neq n \rightarrow \text{NOT}(y | n)$
* **d)** $n$ is a power of a prime
  * $\exist x. \text{PRIME}(x) \and x \times x =n$

## Problem 4

* **a)** $a(x) ::= x^2$ 
  * **N**
* **b)** $b(x) ::= x + 2$ 
  * **B**
* **c)** $c(x) ::= 2x$
  * **I**
* **d)** $d(x) ::= -x$
  * **B**
* **e)** $ e(x) ::= [x/2]$, that is, the quotient of $x$ divided by 2;
  * **S**

## Problem 5

A class of any size of 18 or more can be assembled from student teams of sizes 4 and 7. Prove this by induction (of some kind), using the induction hypothesis:
$$
S(n) :: = \text{a class of } n + 18 \text{ students can be assembled from teams of sizes 4 and 7}
$$
**Proof.** We prove by ordinary induction that a class of any size of 18 or more can be assembled from student teams of sizes 4 and 7.

**Induction Hypothesis**: $S(n) :: = \text{a class of } n + 18 \text{ students can be assembled from teams of sizes 4 and 7}$

**Base Case** $S(0)$ holds as $7 \times 2 + 4 = 18$.

**Induction step**. Assume that $S(n-18) = n$ hold, so $S(n+1)$:
$$
S(n+1) & = & n + 1 + 18 \\
& = & n + 19 \ \ \ \ \ \ \
$$
$19 = 7 + 4 \times 3$, and as $n$ can be assembled from 4 and 7, $S(n+1)$ holds.