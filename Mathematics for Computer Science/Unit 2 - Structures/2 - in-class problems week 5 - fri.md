# In-Class Problems Week 5, Fri.

Questions available in [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/c0665513f68801c7f3c3732cd997fb6e/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp12.pdf).

## Problem 1

* **a)** Use the pulverizer to find integers $x$, $y$ such that $x30 + y22 = \text{gcd}(30, 22)$.
  $$
  x & y & (\text{rem}(x, y)) & = & x - q \times y \\ 
  \hline
  30 & 22 & 8 & = & a - 1 \times b \\
  22 & 8 & 6 & = & 3b - 2a \\
  8 & 6 & 2 & = & 3a-4b\\
  6 & 2 & 0
  $$
  So $x = 3$ and $y = -4$.

* **b) **Now find integers $x'$, $y'$ with $ 0 \leq y' < 30$ such that $x'30 + y'22 = \text{gcd}(30, 22)$
  $$
  x'30 + y'22 & = & 2 \\ 
  x'15 + y'11 & = & 1 \\ 
  $$
  So
  $$
  x' = \frac{1 - y'11}{15}
  $$
  In order to $x'$ be a integer, $'1-y'11$ must be divisible by $15$, so by trial and error we found that this is true when $y' = 11$, then
  $$
  x' & = & \frac{1 - 11 \cdot 11}{15} \\ \\
  x' & = & \frac{1 - 121}{15} \ \ \ \  \\ \\
  x' & = & \frac{-120}{15} \ \ \ \ \ \ \ \ \\ \\
  x' & = & -8 \ \ \ \ \ \ \ \ \ \ \ \ \ \  \\ \\
  $$

## Problem 2

* **a)** let $m=2^9 5^{24} 11^7 17^{12}$ and $n = 2^3 7^{22} 11^{211} 13^1 17^9 19^2$

  * What is the $\gcd(m, n)$? $2^3 11^7 17 ^9$

  * What is the $\text{lcm}(m, n)$? $2^9 5^{24} 7^{22} 11^{211} 13^1 17^{12} 19^2$

  * verify that $\text{gcd}(m, n) \cdot \text{lcm}(m, n) = mn$
    $$
    2^9 5^{24} 11^7 17^{12} \cdot 2^3 7^{22} 11^{211} 13^1 17^9 19^2 & = & 2^3 11^7 17 ^9 \cdot  2^9 5^{24} 7^{22} 11^{211} 13^1 17^{12} 19^2 \\\\
    
    2^{12} 5^{24} 7^{22} 11^{218} 13^1 17^{21} 19^2 & = & 2^{12} 5^{24} 7^{22} 11^{218} 13^1 17^{21} 19^2
    $$
    

* **b)** Describe in general how to fin the $\text{gcd}(m,n)$ and $\text{lcm}(m,n)$ from the prime factorizations of $m$ and $n$. Conclude that equation $\text{gcd}(m, n) \cdot \text{lcm}(m, n) = mn$ holds for all positive integers $m, n$.

  * To find the $\text{gcd}(m, n)$ from the prime factorizations of $m$ and $n$ you pick each prime that appears in both numbers, then, for the picked primes, you put the lowest power value for each one.
  * To find the $\text{lcm}(m, n)$ from the prime factorizations of $m$ and $n$ you pick each different prime that appears and put the largest power value for each one.
  * The equation $\text{gcd}(m, n) \cdot \text{lcm}(m, n) = mn$ holds for all positive integers $m, n$, as in $\text{gcd}(m,n)$ you will have the lowest values of each prime that appears in $m$ and $n$ and in the $\text{lcm}(m,n)$ you will have the largest primes that appears in $m$ and $n$ , so when you multiplying the $\text{gcd}(m,n)$ with the $\text{lcm}(m,n)$ you are putting all these primes together, therefore is the same of multiplying $m$ and $n$.


## Problem 3

Binary GCD state machine:
$$
\text{states} & ::= & \N^3 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \\
\text{start state} & ::= & (a, b, 1) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \\
\text{transitions} & ::= & \text{if min}(x, y) > 0, \text{ then } (x, y, e) \to \\
& & (x/2, y/2, 2e) & \quad (\text{if }2|x \text{ and } 2 | y) & \quad (2) \\
& & (x/2, y, e) & \quad (\text{else if }2|x) & \quad (3) \\
& & (x, y/2, e) & \quad (\text{else if }2|y) & \quad (4) \\
& & (x-y, y, e) & \quad (\text{else if }x>y) & \quad (5) \\
& & (y-x, x, e) & \quad (\text{else if }y>x) & \quad (6) \\
& & (1, 0, ex) & \quad (\text{otherwise } (x=y)) & \quad (7) \\
$$

* **a)** Use the Invariant Principle to prove that if this machine stops, that is, reaches a state $(x, y , e)$ in which no transition is possible, then $e = \text{gcd}(a, b)$.

  **Proof.** We prove, using the Invariant Principle, that if this machine stops, that is, reaches a state $(x, y , e)$ in which no transition is possible, then $e = \text{gcd}(a, b)$.

  **Induction Hypothesis**: $\text{gcd}(x, y) \cdot e = \text{gcd}(a, b)$

  **Start State**: The hypothesis holds for $(a, b, 1)$, as  $\text{gcd}(a, b) \cdot 1 = \text{gcd}(a, b)$.

  **Transitions**: 

  * $(x/2, y/2, 2e)$

    As both $x$ and $y$ are divisible by $2$, so $2$ is part of prime factorization of both and $2\text{gcd}(a/2, b/2) = \text{gcd}(a, b)$.

    Considering the previous state as being $(a, b, 1)$:
    $$
    \text{gcd}(a, b) & = & \text{gcd}(x, y) \cdot e \ \ \ \ \ \ \ \ \\\
     & = & \text{gcd}(a/2, b/2) \cdot 2\\
     & = & \text{gcd}(a, b) \ \ \ \ \ \ \ \ \ \ \ \ \
    $$

  * $(x/2, y, e) $

    As only $x$ is divisible by $2$, so $\text{gcd}(x, y)$ is not divisible by $2$, so $\text{gcd}(x, y) = \text{gcd}(x/2, y)$.

    Considering the previous state as being $(a, b, 1)$:
    $$
    \text{gcd}(a, b) & = & \text{gcd}(x, y) \cdot e \ \ \ \ \ \ \ \ \\\
     & = & \text{gcd}(a/2, b) \cdot 1 \ \ \ \ \\
     & = & \text{gcd}(a, b) \ \ \ \ \ \ \ \ \ \ \ \ \
    $$

  * $(x, y/2, e) $

    As only $y$ is divisible by $2$, so $\text{gcd}(x, y)$ is not divisible by $2$, so $\text{gcd}(x, y) = \text{gcd}(x, y/2)$.

    Considering the previous state as being $(a, b, 1)$:
    $$
    \text{gcd}(a, b) & = & \text{gcd}(x, y) \cdot e \ \ \ \ \ \ \ \ \\\
     & = & \text{gcd}(a, b/2) \cdot 1 \ \ \ \ \\
     & = & \text{gcd}(a, b) \ \ \ \ \ \ \ \ \ \ \ \ \
    $$

  * $ (x-y, y, e) $

    As $x-y$ is a linear combination of $x$ and $y$, so $\text{gcd}(x-y, y) = \text{gcd}(x, x-y) = \text{gcd}(x, y)$.

    Considering the previous state as being $(a, b, 1)$:
    $$
    \text{gcd}(a, b) & = & \text{gcd}(x, y) \cdot e \ \ \ \ \ \ \ \ \\\
     & = & \text{gcd}(a-b, b) \cdot 1 \ \ \\
     & = & \text{gcd}(a, b) \ \ \ \ \ \ \ \ \ \ \ \ \
    $$
    
  * $ (y-x, x, e)$
  
    As $y-x$ is a linear combination of $x$ and $y$, so $\text{gcd}(y-x, x) = \text{gcd}(y, y-x) = \text{gcd}(x, y)$.
  
    Considering the previous state as being $(a, b, 1)$:
    $$
    \text{gcd}(a, b) & = & \text{gcd}(x, y) \cdot e \ \ \ \ \ \ \ \ \\\
     & = & \text{gcd}(b-a, a) \cdot 1 \ \ \\
     & = & \text{gcd}(a, b) \ \ \ \ \ \ \ \ \ \ \ \ \
    $$
  
  * $ (1, 0, ex) $
  
    As $x = y$, so $\text{gcd}(x, y) = x$.
  
    Considering the previous state as being $(a, b, 1)$:
    $$
    \text{gcd}(a, b) & = & \text{gcd}(x, y) \cdot e \\\
     & = & \text{gcd}(1, 0) \cdot a\\
      & = & a \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \\\
     & = & \text{gcd}(a, b) \ \ \ \ \
    $$
  
* **b)** Prove that the move $(x, y, e) \to (x/2, y/2, 2e)$ never occurs after any of the other rules is executed.

  The condition of this move if that both $x$ and $y$ are divisible by 2, this will never occur after any other movement, as for movements (3) and (4) only the even number is divided, so the other one stills odd. In the case of movements (5) and (6), one odd number remains and other even number is created, as adding or subtracting odd numbers results in a even number.

* **c)** Prove that the machine reaches a final state in at most $1 + 3(\text{log}(a) + \text{log}(b))$ transitions.

  * At each step the some number will be divided by 2, so in the worst case both numbers will have to be dived by two then $\text{log}(a) + \text{log}(b)$.
  * In the worst case 3 divisions are made, so  $3(\text{log}(a) + \text{log}(b))$.
  * The last movement just execute 1 multiplication, so $ 1 + 3(\text{log}(a) + \text{log}(b))$

## Problem 4

* **a)** Every common divisor of $a$ and $b$ divides $\text{gcd}(a, b)$

  If $c$ divides $a$ and $b$, then $c$ divides every linear combination of $a$ and $b$, so as the GCD of $a$ and $b$ is an integer linear combination of $a$ and $b$, therefor every common divisor of $a$ and $b$ divides $\text{gcd}(a, b)$.

* **b)** If $a | bc$ and $gcd(a, b) = 1$, then $a | c$.

  As $1$ is the only integer that divides all numbers, then $\text{gcd}(a, b)=1$ means that $a$ does not divides $b$, so $a | bc$ is only possible if $a|c$, therefore $ a|bc \and \text{gcd}(a,b) = 1 \Rightarrow a|c$.

* **c)** If $p|bc$ for some prime, $p$, then $p|b$ or $p|c$.

  Suppose for contradiction proof that $p|bc$, $\overline{p|b}$, and  $\overline{p|c}$.

  As $\overline{p|b}$, then $\text{gcd}(p, b) = 1$, so as consequence of the question **b)** $p|c$ must be true, then we have a contradiction, therefore If $p|bc$ for some prime, $p$, then $p|b$ or $p|c$.

* **d)** Let $m$ be the smallest integer linear combination of $a$ and $b$ that is positive. Show that $m = \text{gcd}(a, b)$.

  Corollary 8.2.3 says that an integer is a linear combination of $a$ and $b$ iff it is a multiple of $\gcd(a, b)$, as the smallest multiple of $\text{gcd}(a,b)$ is $\text{gcd}(a, b)$ itself, therefore $\text{gcd}(a, b)$ is the smallest integer linear combination of $a$ and $b$ that is positive.

  
