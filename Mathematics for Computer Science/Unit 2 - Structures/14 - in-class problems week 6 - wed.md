# In-Class Problems Week 6, Wed.

Questions are available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/41dfcedaf37dca34247a5e5b1c81fab2/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp14.pdf).

## Problem 1

Find the remainder of $26^{1818181}$ divided by 297.

Knowing that:
$$
\text{rem}(26, 297) & = & 26 \\
\text{rem}(26^2, 297) & = & 82 \\
\text{rem}(26^3, 297) & = & 53 \\
\text{rem}(26^4, 297) & = & 190 \\
\text{rem}(26^5, 297) & = & 188 \\
\text{rem}(26^6, 297) & = & 136 \\
\text{rem}(26^7, 297) & = & 269 \\
\text{rem}(26^8, 297) & = & 163 \\
\text{rem}(26^9, 297) & = & 80 \\
\text{rem}(26^{10}, 297) & = & 1 \\
$$
And that:
$$
1818181 = 10 \cdot 181818 + 1
$$
Then:
$$
\text{rem}(26^{1818181}, 297) & = & \text{rem}(26, 297)  \\
& = & 26
$$

## Problem 2

* **a)** Prove that $2012^{1200}$ has a multiplicative inverse modulo $77$.

  As $2012$ is relatively prime to $77$, so $2012^{1200}$ is also relatively prime to $77$.

  Therefore $(2012^{1200})^{\phi(77)-1}$ is a multiplicative inverse module $77$.

* **b)** What is the value of $\phi(77)$?
  $$
  \phi(77) = \phi(7 \cdot 11) = (7-1)(11-1) = 60
  $$

* **c)** What is the remainder of $2012^{1200}$ divided by 77?

  Knowing that:
  $$
  \text{rem}(2012^ 1 ,77) & = &  10 \\
  \text{rem}(2012^ 2 ,77) & = &  23 \\
  \text{rem}(2012^ 3 ,77) & = &  76 \\
  \text{rem}(2012^ 4 ,77) & = &  67 \\
  \text{rem}(2012^ 5 ,77) & = &  54 \\
  \text{rem}(2012^ 6 ,77) & = &  1 \\
  $$
  And that:
  $$
  1200 = 200 \cdot 6
  $$
  

  Then:
  $$
  \text{rem}(2012^{1200}, 77) & = & \text{rem}(1, 77)  \\
  & = & 1
  $$

## Problem 3

Prove that for any prime, $p$, and integer, $k \geq 1$, $\phi(p^k) = p^k - p^{k-1}$.

As $p$ is a prime number, the only numbers which are divisible by $p$ in $[0..p^k]$ are the $p$th numbers, that is, $p,\ 2p,\ 3p,\ \dots$.

So there are $\frac{p^k}{p}$ numbers divisible by $p$, therefore
$$
\phi(p^k) & = & p^k - \frac{p^k}{p} \\
& = & p^k - p^{k-1}
$$

##  Problem 4

* **a)** Explain why $n^{13} \equiv n \quad (\text{mod } 10)$ does not follow immediately from Euler's Theorem.

  * As it is not guaranteed that $n$ is not relatively prime to $10$.

* **b)** Prove that $d^{13} \equiv d \quad (\text{mod } 10)$ for $0 \leq d < 10$;

  We just need to prove that $\text{rem}(d^{13}-d, 10)=0$ to each value.

  * For $0$ and $1$ is trivial:

  $$
  \text{rem}( 0 ^{13}- 0 ,10) =  0 \\
  \text{rem}( 1 ^{13}- 1 ,10) =  0 \\
  $$

  * For $2$:

  $$
  \text{rem}( 2 ^{13}- 2 ,10) =  0
  $$

  ​		First we calculate the remainders of the powers of $2$:
  $$
  \text{rem}(2^{ 1 },10) =  2 \\
  \text{rem}(2^{ 2 },10) =  4 \\
  \text{rem}(2^{ 3 },10) =  8 \\
  \text{rem}(2^{ 4 },10) =  6 \\
  \text{rem}(2^{ 5 },10) =  2 \\
  $$
  ​		Then:
  $$
  \text{rem}( 2 ^{13}- 2 ,10) & = & \text{rem}( 2 ^{3*4+1}- 2 ,10) \\
  & = & \text{rem}( 2 - 2 ,10) \ \ \ \ \ \ \ \  \\
  & = & \text{rem}( 0 ,10) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \\
  & = & 0  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \\
  $$
  

  * For $3$:

    First we calculate the remainders of the powers of $3$:
    $$
    \text{rem}( 3 ^{ 0 },10) =  1 \\
    \text{rem}( 3 ^{ 1 },10) =  3 \\
    \text{rem}( 3 ^{ 2 },10) =  9 \\
    \text{rem}( 3 ^{ 3 },10) =  7 \\
    \text{rem}( 3 ^{ 4 },10) =  1 \\
    $$
    Then:
    $$
    \text{rem}( 3 ^{13}- 3 ,10) & = & \text{rem}( 3 ^{3*4+1}- 3 ,10) \\
    & = & \text{rem}( 3 - 3 ,10) \ \ \ \ \ \ \ \  \\
    & = & \text{rem}( 0 ,10) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \\
    & = & 0  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \\
    $$

  * For $4$:

    First we calculate the remainders of the powers of $4$:
    $$
    \text{rem}( 4 ^{ 1 },10) =  4 \\
    \text{rem}( 4 ^{ 2 },10) =  6 \\
    \text{rem}( 4 ^{ 3 },10) =  4 \\
    $$
    Then:
    $$
    \text{rem}( 4 ^{13}- 4 ,10) & = & \text{rem}( 4 - 4 ,10) \\
    & = & \text{rem}( 0 ,10) \ \ \ \ \ \ \  \\
    & = & 0  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \\
    $$
    

  * For $5$:

    First we calculate the remainders of the powers of $5$:
    $$
    \text{rem}( 5 ^{ 1 },10) =  5 \\
    \text{rem}( 5 ^{ 2 },10) =  5 \\
    $$
    Then:
    $$
    \text{rem}( 5 ^{13}- 5 ,10) & = & \text{rem}( 5 - 5 ,10) \\
    & = & \text{rem}( 0 ,10) \ \ \ \ \ \ \  \\
    & = & 0  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \\
    $$
    

  * For $6$:

    First we calculate the remainders of the powers of $6$:
    $$
    \text{rem}( 6 ^{ 1 },10) =  6 \\
    \text{rem}( 6 ^{ 2 },10) =  6 \\
    $$
    Then:
    $$
    \text{rem}( 6 ^{13}- 6 ,10) & = & \text{rem}( 6 - 6 ,10) \\
    & = & \text{rem}( 0 ,10) \ \ \ \ \ \ \  \\
    & = & 0  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \\
    $$
    

  * For $7$:

    First we calculate the remainders of the powers of $7$:
    $$
    \text{rem}( 7 ^{ 0 },10) =  1 \\
    \text{rem}( 7 ^{ 1 },10) =  7 \\
    \text{rem}( 7 ^{ 2 },10) =  9 \\
    \text{rem}( 7 ^{ 3 },10) =  3 \\
    \text{rem}( 7 ^{ 4 },10) =  1 \\
    $$
    Then:
    $$
    \text{rem}( 7 ^{13}- 7 ,10) & = & \text{rem}( 7 ^{3*4+1}- 7 ,10) \\
    & = & \text{rem}( 7 - 7 ,10) \ \ \ \ \ \ \ \  \\
    & = & \text{rem}( 0 ,10) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \\
    & = & 0  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \\
    $$
    

  * For $8$:

    First we calculate the remainders of the powers of $8$:
    $$
    \text{rem}( 8 ^{ 1 },10) =  8 \\
    \text{rem}( 8 ^{ 2 },10) =  4 \\
    \text{rem}( 8 ^{ 3 },10) =  2 \\
    \text{rem}( 8 ^{ 4 },10) =  6 \\
    \text{rem}( 8 ^{ 5 },10) =  8 \\
    $$
    Then:
    $$
    \text{rem}( 8 ^{13}- 8 ,10) & = & \text{rem}( 8 ^{3*4+1}- 8 ,10) \\
    & = & \text{rem}( 8 - 8 ,10) \ \ \ \ \ \ \ \  \\
    & = & \text{rem}( 0 ,10) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \\
    & = & 0  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \\
    $$
    

  * For $9$:

    First we calculate the remainders of the powers of $9$:
    $$
    \text{rem}( 9 ^{ 0 },10) =  1 \\
    \text{rem}( 9 ^{ 1 },10) =  9 \\
    \text{rem}( 9 ^{ 2 },10) =  1 \\
    $$
    Then:
    $$
    \text{rem}( 9 ^{13}- 9 ,10) & = & \text{rem}( 9 - 9 ,10) \\
    & = & \text{rem}( 0 ,10) \ \ \ \ \ \ \  \\
    & = & 0  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \\
    $$

* **c)** Now prove the congruence $n^{13} \equiv n \quad (\text{mod } 10)$.

  The only possible remainders for any number divided by $10$ are in $[0..10)$, so as we proved it for $0 \leq n < 10$, we also have proved $n^{13} \equiv n \quad (\text{mod } 10)$.
