# Midterm Exam March 18

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/7f01cc19c6834142f99f0414eea6fc35/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_midterm2.pdf);

## Problem 1

Prove by structural induction that RAF is closed under composition.

We prove by structural induction that RAF is closed under composition.

**Induction Hypothesis**: $P(h) ::= \forall g \in \text{RAF. } h \circ g \in \text{RAF}$

**Base cases**:

1. **Identity function**

   This case is trivial, as the composition $\text{id}(g) = g$ and $g \in \text{RAF}$.

2. **Constant function**

   This case is also trivial, as the composition $\text{cte}(g) = \text{cte}$ and $\text{cte} \in \text{RAF}$, considering $\text{cte}$ as any constant function.

**Constructor cases**:

Lets define $h = f \text{ op } i$, $f, i \in \text{RAF}$ and lets assume that $P(f)$ and $P(i)$ holds.

So $h \circ g = (f \text{ op } i) \circ g = (f \circ g) \text{ op } (i \circ g)$.

As $P(f)$ and $P(i)$ holds, $(f \circ g)$ and $(i \circ g)$ are RAF, by the constructor case definition, $h \circ g$ is also RAF and therefore $P(h)$ also holds.

Then, RAF is closed under composition.

## Problem 2

* **a)** We informally describe some of the legal operations tourists can perform below. Represent each of the following operations as a transition of the state machine. The first is done for you as an example.

  1. Fill the big bucket. $(b, l) \to (25, l)$;
  2. Empty the little bucket. $(b, l) \to (b, 0)$;
  3. Pour the big bucket into the little bucket
     1. $b + l > 10$ : $(b, l) \to (b+l-10, 10)$ 
     2. $b+l \leq 10$ : $(b, l) \to (0, b+l)$  

* **b)**  Use the Invariant Principle to show that, starting with empty buckets, the Stata Center will never collapse. That is, the state (13, x) in unreachable;

  * As the $\text{GCD}(25, 10) = 5$, it is impossible to reach $13$. The **preserved invariant** is that all the values $b$ and $l$ are multiples of $5$.

  * **Start Case:** holds for $(0, 0)$, as 0 is multiple of any integer.

  * **Filling the big bucket.** $(0, 0) \to (25, 0)$, 25 is multiple of 5, then holds.

  * **Emptying the little bucket** $(0, 0) \to (0, 10)$, 10 is multiple of 5, then holds.

  * **Pouring the big bucket into the little bucket**

    1. $(25, 0) \to (15, 10)$ 
    2. $(15, 10) \to (15, 0)$
    3. $(15, 0) \to (5, 10)$
    4. $(5, 10) \to (5, 0)$
    5. $(5, 0) \to (0, 5)$
    6. $(0, 5) \to (25, 5)$
    7. $(25, 5) \to (20, 10)$

    * Holds for any showed case, as all of them are multiple of $5$.

## Problem 3

Prove that if $A$ is an infinite set and $B$ is a countably infinite set that has no elements in common with A, then $A \text{ bij } (A \cup B)$.

As $B$ is countably, it can be ordered, so, by lemma 7.1.7, adding $B$ to $A$ in a ordered order will not change the size of $A$. As $A$ has a bijection with itself and $A \cup B$ has the same size of $A$, therefore $A \text{ bij } (A \cup B)$.

## Problem 4

Let
$$
m & = & 2^95^{24}7^411^7 \\
n & = & 2^37^{22}11^{211}19^7 \\
p & = & 2^53^47^{6042}19^{30}  
$$


* **a)** What is the $\text{GCD}(m, n, p)$?
  $$
  \text{GCD}(m, n, p) & = & 2^{3}3^{0}5^{0}7^{4}11^{0}19^{0} \\
  & = & 2^37^4
  $$
  

* **b)** What is the least common multiple $\text{LCM}(m, n, p)$?
  $$
  \text{LCM}(m, n, p) = 2^{9}3^{4}5^{24}7^{6042}11^{211}19^{30}
  $$
  

* $v_k(n) ::= \text{max} \{ i \ | \ k^i \text{ divides } n \}$.

* **c)**

* **d)**

* **e)**

## Problem 5

## Problem 6

