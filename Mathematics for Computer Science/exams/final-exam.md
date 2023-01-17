# Final Examination

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/83241aa15cdaf4efc85834262b2a8999/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_finalexam.pdf).

## Problem 1

Truth values for propositional variables $P, Q, R$ are chosen independently, with
$$
\Pr[P = T] = 1/2, \Pr[Q = T] = 1/3, \Pr[R=T] = 1/5
$$
What is the probability that the formula $(P \to Q) \to R$ is true?

**Answer**

The formula is true in the following cases:

| P    | Q    | R    | $P \to Q$ | $(P \to Q) \to R$ | $\Pr$ |
| ---- | ---- | ---- | --------- | ----------------- | ----- |
| T    | T    | T    | T         | T                 | 1/30  |
| T    | T    | F    | T         | F                 | 2/15  |
| T    | F    | T    | F         | T                 | 1/15  |
| T    | F    | F    | F         | T                 | 4/15  |
| F    | T    | T    | T         | T                 | 1/30  |
| F    | T    | F    | T         | F                 | 2/15  |
| F    | F    | T    | T         | T                 | 1/15  |
| F    | F    | F    | T         | F                 | 4/15  |

Therefore the formula is true with probability 7/15.

## Problem 2

A simple graph, $G$, is said to have width 1 iff there is a way to list all its vertices so that each vertex is adjacent to at most one vertex that appears earlier in the list. 

Prove that every finite tree has width one. 

**Answer**

A tree is a graph where any two vertices are connected by **exactly one path**.

Therefore if you put first the root, then its children, then the children's children and etc, you will got a list which each vertex is adjacent to at most one vertex that appears earlier in the list. Therefore, every finite tree has width one. 

## Problem 3

Indicate whether the following statements are true or false. For each of the false statements, give counterexamples. All variables range over the integers, $\Z$.

* **a)** For all $a$ and $b$, there are $x$ and $y$ such that: $ax + by = 1$.
  * False, if $a = b = 0$ this cannot be true.
* **b)** $\text{gcd}(mb + r, b) = \text{gcd}(r, b)$ for all $m$, $r$ and $b$.
  * true
* **c)** $k^{p-1} \equiv 1 \text{ (mod $p$)}$ for every prime $p$ and every $k$. 
  * true
* **d)** For primes $p \neq q$, $\phi(pq) = (p-1)(q-1)$, where $\phi$ is the Euler's totient function.
  * true
* **e)** If $a$ and $b$ are relatively prime to $d$, then $[ac \equiv bc \text{ mod } d] \to [a \equiv b \text{ mod } d] $
  * true

## Problem 4

In order to complete all $n$ tasks in $t$ weeks, where $1 \leq t \leq n$, Sauron will need to have crew of Ringwraiths working in parallel. 

* **a)** Write a simple formula involving $n$ and $t$ for the smallest number of Ringwraiths that Sauron could possibly need.
  * The number of ringwraiths is defined by the largest antichain, so the smallest number of ringwraiths is $n/t$
* **b)** On the other hand, if Sauron is unlucky, he may need a crew of Ringwraiths as large as $n - t+ 1$ in order to conquer Middle Earth in $t$ weeks. Describe a partial order with $n$ tasks and maximum length chain of $t$ that would require this many Ringwraiths. 
  * Any partial order where there is a chain greater than $t$.

## Problem 5

The **degree sequence** of a simple graph $G$ with $n$ vertices is the length-$n$ sequence of the degrees of the vertices listed in weakly increasing order.
Briefly explain why each of the following sequences is not a degree sequence of any connected simple graph. 

* **a)** (1, 2, 3, 4, 5, 6, 7)

  * It is impossible to create it:

    ```
        1
        |
        2
       / \
      4 - 3
     /  \ /
    *6 - 5*
     \    \
      \--- 7*
    ```

* **b)** (1, 3, 3, 4, 4, 4, 4)

  * It is not possible to create it:

    ```
        1
        |
        3
       / \
      4 - 4
     / \ / \
    3 - 4 - 4*
    ```

* **c)** (1, 1, ,1 ,1)

  * As it is connected, for an 4-vertex graph, the minimum line graph would (1, 1, 2, 2). 

* **d)** (1, 2, 3, 4, 4)

  * It is not possible to create this:

    ```
       1
       |
       2
       |
       3
      / \
    *4 - 4*  
    ```

  * It is impossible to put the 2 nodes with order 4

## Problem 6

Define two functions $f, g$ that are incomparable under big Oh:
$$
f \neq O(g) \and g \neq O(f)
$$
$f = \ln(x)$

$g = x$

## Problem 7

In a standard 52-card deck (13 ranks and 4 suits), a hand is a 5-card subset of the set of 52 cards. Express the answer to each part as a formula using factorial, binomial, or multinomial notation.

* **a)**  Let $H_{NP}$ be the set of all hands that include no pairs; that is, no two cards in the hand have the same rank. What is $|H_{NP}|$?

  * A hand without pair is a hand of 5 different ranks cards, which is $\binom {13}{5}$, with $4^5$ possible different suits, therefore:
    $$
    \binom{13}{5} \times 4^5
    $$
    

* **b)** Let $H_S$ be the set of all hands that are straights, i.e. the ranks of the five cards are consecutive. What is $|H_S|$?

  * As there 10 possible sequences and $4^5$ ways to choose the suits of the cards in each sequence:
    $$
    |H_S| = 10 \times 4^5 = 10240
    $$
     

* **c)** Let $H_F$ be the set of all hands that are flushes; that is, the suits of the five cards are identical. What is $|H_F|$?

  * Each suit have $\binom {13}{5}$ possible five-cards hands, therefore:
    $$
    |H_F| = 4 \times \binom {13}{5} = 5148
    $$

* **d)** Let $H_{SF}$ be the set of all straight flush hands; that is, the hand is both a straight and a flush. What is $|H_{SF}|$?

  * As there 10 possible sequences and 4 ways to choose the suits of the cards:
    $$
    |H_{SF}| = 10 \times 4 = 40
    $$
    

* **e) **Let $H_{HC}$ be the set of all high-card hands; that is, hands that do not include pairs, are not straights, and are not flushes. What is  $|H_{HC}|$ ?
  $$
  \begin{align*}
  	|H_{HC}| & =  \binom{13}{5} \times 4^5 - 10240 - 4 \times \binom {13}{5} + 40 \\
  	
  \end{align*}
  $$
  

## Problem 8

## Problem 9

## Problem 10

## Problem 11

## Problem 12