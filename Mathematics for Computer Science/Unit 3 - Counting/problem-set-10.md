# Problem Set 10

Questions available on **[MIT](https://openlearninglibrary.mit.edu/assets/courseware/v1/74d94c004b9cfa110fea238e6a346839/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_ps10.pdf)**.

## Problem 1

Let $R$ be the set of seven rainbow colors and $S ::= [1, 6]$ the set of dice values.

* **a)** For how many rolls do exactly two dice have the value 6 and the remaining five dice all have different values?

  * Let $A$ be the set defined in the question.

  * Let $R_2$ be the set of size-2 subsets of $R$, it represents the two dice with value 6.

  * Let $P_{S,5}$ be the set of 5-permutations of $S-6$, it is 5-tuple where the first is the dice valued 1, the second is the dice valued 2, and etc until 5.   

  * Let $B::= P_{S,5} \times R_2$, now by bijection rule $|A| = |B|$, so
    $$
    |B| = 5! \cdot \binom{7}{2}
    $$
    

* **b)** For how many rolls do two dice have the same value and the remaining five dice all have different values?

  * Let $A$ be the set defined in the question.

  * Let $R_2$ be the set of size-2 subsets of $R$, it represents the two dice with the same value.

  * Let $P_{S,1}$ be the set of 1-permutations of $S$, it is 1 value that represents the value of the two same valued dice.

  * Let $P_{S,5}$ be the set of 5-permutations of $S- \text{used value}$, it is 5-tuple following the sorted order of the remaining values, so if the pair same valued dice has value 6, the first is the dice valued 1, the second is the dice valued 2, and etc until 5.   

  * Let $B::= P_{S_1} \times P_{S,5} \times R_2$, now by bijection rule $|A| = |B|$, so
    $$
    |B| = 6! \cdot \binom{7}{2}
    $$
    

* **c)** For how many rolls do two dice have one value, two different dice have a second value, and the remaining three dice a third value?

  * Let $A$ be the set defined in the question.

  * Let $R_3$ be the set of size-3 subsets of $R$, it represents the three dice with the same value.

  * Let $R_2$ be the set of size-2 subsets of $R- \text{used colors}$, it represents the first pair dice with the same value.

  * Let $P_{S,3}$ be the set of 3-permutations of $S$, it is a triple, where the first value is the value of the first pair, the second of the second pair, and the third of the triple.

  * $B ::= R_2 \times R_3 \times P_{S, 3}$, now by bijection rule $|A| = |B|$, so
    $$
    |B| = \binom {7}{3} \cdot \binom {4}{2} \cdot 6 \cdot 5 \cdot 4
    $$
    

## Problem 2

* **a)** How many ways are there to order the 26 letters of the alphabet so that no two of the vowels appear consecutively and the last latter in the ordering is not a vowel?

  * First we consider just the consonants, so we got $21!$.
  * Then we put 21 "slots" between the consonants and before the last one, so we got $\frac{21!}{(21-5)!}$
  * Therefore $\frac{(21!)^2}{16!}$

* **b)** How many ways are there to order the 26 letters of the alphabet so that are at least two consonants immediately following each vowel?

  * First we consider just the consonants, so we got $21!$.
  * Then we put 9 "slots" between the consonant pairs and one more before the last pair, but as we got an odd number of consonants, we got a triple of consonants and there 10 ways to organize this, so we got $10 \cdot \frac{10!}{(10-5)!}$
  * Therefore $\frac{21!10!}{5!}$

* **c)** In how many different ways can $2n$ students be paired up?

  * There $(2n)!$ of possible permutations.
  * There $n!$ ways of reordering the same couples.
  * There $2^n$ repeated couples.
  * So, we got

  $$
  \frac{(2n)!}{2^nn!}
  $$

  

* **d)** Two $n$-digit sequences of digits 0, 1, ..., 9 are said to be of the same type if the digits of one are a permutation of the digits of the other. How many types of $n$-digit sequences are there?

  * $\binom{n+9}{9}$.

## Problem 3

* **a)** Use the multinomial theorem to prove, for all primes $p$, that
  $$
  (x_1 + x_2 + \cdots + x_n)^p \equiv x_1^p + x_2^p + \cdots + x_n^p \ \ (\text{mod }p)
  $$
  

  * $\binom{p}{k_1, k_2, \dots, k_n}$ is divisible by $p$, if all $k_i$'s elements are positive integers les than $p$, as $p!$ is clearly divisible by $p$.

  * So, as each coefficient follow the previous described format, every coefficient will be divisible by $p$.

  * Therefore, as the division of a sum is the sum of the divided parts and all the coefficients will have $(\text{mod }p)$ zero, we got that 
    $$
    (x_1 + x_2 + \cdots + x_n)^p \equiv x_1^p + x_2^p + \cdots + x_n^p \ \ (\text{mod }p)
    $$

* **b)** Explain how **a)** immediately proves Fermat's Little Theorem: $n^{p-1} \equiv 1 \ (\text{mod }p)$ when $n$ is not a multiple of $p$.
  $$
  n^p \equiv n^p \ (\text{mod }p) \\
  n^p \equiv n \ (\text{mod }p)  \\
  n^{p-1} \equiv 1 (\text{mod }p)
  $$
  



