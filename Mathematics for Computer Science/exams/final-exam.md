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

Here’s a variation of Monty Hall’s game: the contestant still picks one of three doors, with a prize randomly placed behind one door and goats behind the other two. But now, instead of always opening a door to reveal a goat, Monty instructs Carol to randomly open one of the two doors that the contestant hasn’t picked. This means she may reveal a goat, or she may reveal the prize. If she reveals the prize, then the entire game is restarted, that is, the prize is again randomly placed behind some door, the contestant again picks a door, and so on until Carol finally picks a door with a goat behind it. Then the contestant can choose to stick with his original choice of door or switch to the other unopened door. He wins if the prize is behind the door he finally chooses. 

To analyze this setup, we define two events:

* $GP$: The event that the contestant **g**uesses the door with the **p**rize behind it on his first guess.
* $OP$: The event that the game is restarted at least once. 
  * Another way to describe this is as the event that the door Carol first **o**pens has a **p**rize behind it. 

Give the values of the following probabilities: 

* **a)** $\Pr[OP | \overline{GP}]$

  * 1/2

* **b**) $\Pr[OP]$

  * 1/3

* **c**) The probability that the game will continue forever.

  * 0

* **d**) When Carol finally picks the goat, the contestant has the choice of sticking or switching. Let’s say that the contestant adopts the strategy of sticking. Let $W$ be the event that the contestant wins with this strategy, and let $w ::= \Pr[W]$. Express the following conditional probabilities as simple closed forms in terms of $w$. 

  1. $\Pr[W | GP]$
     * 1
  2. $\Pr[W \ | \ \overline{GP} \ \cap \ OP]$
     * w
  3. $\Pr[W \ | \ \overline{GP} \ \cap \ \overline{OP}]$
     * 0

* **e) **What is the value of $\Pr[W]$?

  * Analyzing the tree of outcomes we have that 


$$
  \Pr[W] = \frac 13 + \frac {\Pr[W]} 3
$$

  * Therefore
    $$
    \Pr[W] = 1/2
    $$

* **f)** Let $R$ be the number of times the game is restarted before Carol picks a goat. What is $\text{Ex}[R]$?
  $$
  \text{Ex}[R] = \frac{1}{3} + \frac{2}{3^2} + \frac{3}{3^3} + \cdots = \sum_{i=1}^\infty \frac{i}{3^i} = \frac 34
  $$
  


Probability tree:

```
 Car		Player's  	Door	   Switch		Probability
 location	 Initial 	Revealed	Wins
 			 Guess
    
             1/3  A  --B---.  1/2					1/18
                /   \--C---. 1/2					1/18
               /
             .- 1/3 B --C---. 1/2		1			1/18
            / \       \--A---. 1/2		?            1/18
           /   \      
     1/3  /      1/3 C --B---. 1/2		1			1/18
      A  /            \--A---. 1/2		?			1/18
        /
       /      1/3  A --C---. 1/2	    1			1/18
      /       /	   \ --B---. 1/2 		?			1/18	
     /       /
    .  -B-- .- 1/3 B --A---.1/2						1/18
     \ 1/3   \	   \----C---.1/2					1/18
      \       \
       \     1/3  C --A---. 1/2			1			1/18
      C \          \--B---. 1/2 		?			1/18
    1/3  \  1/3  A --B---. 1/2			1			1/18
          \    /  \--C---. 1/2			?			1/18
           \ /
            \.- 1/3 B --A---. 1/2		1			1/18
             \      \ --C---. 1/2 		?			1/18
              \
           1/3 C --A---.1/2							1/18
                \--C---.1/2							1/18
                  
                  
                  
                  
                  




```

* Probability of **winning** in the first interaction:
  * 1/3
* Probability of **repeating** in the first interaction:
  * 1/3
* Probability of **losing** in the first interaction:
  * 1/3

## Problem 9

A simple graph with $n$ vertices is constructed by randomly placing an edge between every two vertices with probability $p$. These random edge placements are performed independently.

* **a)** What is the probability that a given vertex of the graph has degree two?
  $$
  \Pr[d2] = p^2(1-p)^{n-2}
  $$
  
* **b)** What is the expected number of nodes with degree two?
  $$
  \text{Ex}[d2] = np^2(1-p)^{n-2}
  $$
  

## Problem 10

You have a coin with probability $p$ of flipping heads. For your first try, you flip it once. For your second try, you independently flip it twice. You continue until the $n$th try, where you independently flip it $n$ times. You win a try if you flip all heads. Let $W$ be the number of winning tries. Write a closed-form expression for $\text{Var}[W]$.

**Answer**

$W$ has a $([n(n+1)/2], p)$-distribution, therefore:
$$
\text{Var}[W] = \frac {np(n+1)(1-p)}{2}
$$

## Problem 11

Albert has a gambling problem. He plays 35 hands of draw poker, 30 hands of black jack, and 20 hands of stud poker per day. He wins a hand of draw poker with probability 1/7, a hand of black jack with probability 1/6, and a hand of stud poker with probability 1/5. Let $W$ be the expected number of hands that Albert wins in a day. 

* **a)** What is $\text{Ex}[W]$?
  $$
  \text{Ex}[W] = 35/7 + 30/6 + 20/5 = 14
  $$
  
* **b)** What would the Markov bound be on the probability that Albert will win at least 45 hands on a given day? 
  $$
  \Pr[W \geq 45] \leq \frac {\text{Ex}[W]}{45} = \frac {14}{45}
  $$

* **c)** Assume the outcomes of the card games are pairwise independent. What is $\text{Var}[W]$? 

  * As the $W$'s have binomial distribution, we will have $\text{Var}[W_i]=n_ip_ i(1-p_ i)$.

  * Variance of draw poker
    $$
    \text{Var}[W_{dp}] = 35 \times \frac 17 \times \frac 6 7 = \frac {30}  {7}
    $$
    
  * Variance of black jack
    $$
    \text{Var}[W_{bj}] = 30 \times \frac 16 \times \frac 5 6 = \frac {25} {6}
    $$
    
  * Variance of stud poker
    $$
    \text{Var}[W_{sp}] = 20 \times \frac 15 \times \frac 4 5 = \frac {16}{5}
    $$
    
  * $\text{Var}[W]$
    $$
    \text{Var}[W] = \text{Var}[W_{dp}] + \text{Var}[W_{bj}] + \text{Var}[W_{sp}] = \frac {2447}{210} \approx 11.65
    $$
    
  
* **d)** What would the Chebyshev bound be on the probability that Albert will win at least 45 hands on a given day? 

  * $x = 45 - \text{Ex}[W] = 45- 14= 31$

  * Therefore
    $$
    \Pr[|W-\text{Ex}[W]| \geq 31] = \frac {2447}{210\cdot31} \approx 0.376
    $$
    

## Problem 12

Give simple examples of random walk graphs with the following properties. 

* **a)** A graph with an uncountable number of stationary distributions.

  * $V = \{a,b,c,d \}$
  * $E = \{\langle a \to a \rangle :1, \langle b \to a \rangle :1/2, \langle b \to c \rangle :1/2, \langle c \to b \rangle :1/2, \langle c \to d \rangle :1/2, \langle d \to d \rangle :1 \}$

  ```
               -------------
   1      1/2  |    1/2    ↓	 1/2	 1
  --- a <----- b           c ------> d ---
  | ↗          ↑    1/2    |           ↖ |
               -------------
  ```

  

* **b)** A graph with unique stationary distribution that is not strongly connected.

  * $V = {a, b, c}$
  * $E = \{\langle a \to b \rangle, \langle b \to c \rangle, \langle c \to a \rangle \}$

  ```
       1
  a ------> b 
   ↖       /
  1 \     / 1
     \   ↙
       c
  ```

  

* **c)** A strongly connected graph with an initial distribution that does not converge to the stationary distribution.

  *  $V = \{x, y\}$
  * $E = \{\langle x \to y \rangle, \langle y \to x \rangle\}$
    * both with weight 1.

  ```
  -------------
  |     1     ↓
  X           y
  ↑     1     |
  -------------
  ```

  