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

* set from $A$ $v_k(A) ::= \{v_k(a) \ | \ a \in A  \}$

* **c)** Express $v_k(\text{GCD}(A))$ in terms of $v_k(A)$.


  * $\text{min}(v_k(A))$

* **d)** Let $p$ be a prime number. Express $v_p(\text{LCM}(A))$ in terms of $v_p(A)$


  * $\text{max}(v_p(A))$

* **e)** Give an example of integers $a, b$ where $v_6(\text{LCM}(a,b)) > \text{max}(v_6(a), v_6(b))$.


  * Any $a = 2 \cdot 6^x , b =3 \cdot 6^x$, where $x \geq 0$


## Problem 5

Prove that if $a \equiv b \ (\text{mod } 14)$ and $a \equiv b \ (\text{mod } 5)$, then $a \equiv b \ (\text{mod } 70)$;

$a \equiv b \ (\text{mod } 14)$ means that $14 | a -b$. So $a-b = 14A$.

$a \equiv b \ (\text{mod } 5)$ means that $5 | a - b$. So $a - b = 5B$.

Then $a-b = 14A = 5B = 14 \cdot 5 C = 70 C$, therefore $a \equiv b \ (\text{mod } 70)$.

## Problem 6

Let $\phi$ be Euler's function.

* **a)** What is the value of $\phi(2)$? 

  * 1

* **b)** What are three nonnegative integers $k > 1$ such that $\phi(k) = 2$?

  * $3, 4, 6$

* **c)** Prove that $\phi(k)$ is even for $k> 2$

  We prove by cases that $\phi(k)$ is even for $k> 2$:

  * $k$ is prime
    * In this case $\phi(k) = k-1$ and all prime numbers, but 2, are odd, therefore the claim holds for this case.
  * $k$ is $p^n$, where $p$ is prime
    * In this case $\phi(p^n) = p^n-p^{n-1}$ and all prime numbers, but 2, are odd, so $p^n$ and $p^{n-1}$ are also odd. As the subtraction between two odds results in an even number, the claim holds for this case.
  * $k$ is $p^{n_1}_1 \cdot p^{n_2}_2 \dots p^{n_i}_i$, where $p_i$ are the prime factors of $k$.
    * In this case $\phi(k) = \phi(p^{n_1}_1) \phi(p^{n_2}_2) \dots \phi(p^{n_i}_i)$, we proved before that each $\phi(p^n)$ is even and the multiplication between even numbers results in another even number, therefore the claim holds for this case.

  As we proved the claim holds for all 3 cases, $\phi(k)$ is even for $k> 2$.

