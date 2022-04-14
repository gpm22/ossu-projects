# Problem set 1

## Problem 1

**Prove that $log_{4}(6)$ is irrational**

1. By definition, $log_4(6)$ is the value $x$ such:
   $$
   4^x = 6
   $$

2. As both numbers are even
   $$
   4^x = 6
   \\
   2^{2x} =  2 \bullet 3
   \\
   2^{2x-1} = 3
   $$

3. Applying $log_2$ in both sides
   $$
   log_2(2^{2x-1}) = log_2(3)
   \\
   2x-1 = log_2(3)
   \\
   x = \frac{log_2(3)+1}{2}
   $$

4. So, to $x$ be rational, $log_2{3}$ must also be rational, but this is false, since 3 is a prime number and $log_2$ of prime numbers different than 2 is always irrational. Then $log_4(6)$ is **irrational**.

## Problem 2

**Use the Well Ordering Principle to prove that $n \leq 3^{\frac{n}{3}}$.**

1. Let $C$ be the set of counterexamples to $n \leq 3^{\frac{n}{3}}$, namely
   $$
   C ::= \{n\ |\ n > 3^{\frac{n}{3}}\}
   $$

2. Assume for the purpose of obtaining a contradiction that $C$ is nonempty. Then by the WOP, there is a smallest number, $m \in C$. This $m$ must be positive, as $0 \leq 1$.

3. So $(m-1)$ is not part of $C$, as the $m$ is the smallest number, so:
   $$
   (m-1) \leq 3^{\frac{m-1}{3}}
   $$

4. multiplying both sides by $3^{\frac{1}{3}}$:
   $$
   (m-1)3^{\frac{1}{3}} \leq 3^{\frac{m}{3}}
   $$

5. But $m > 3^{\frac{m}{3}}$, so
   $$
   (m-1)3^{\frac{1}{3}} < m
   \\
   m-1 < m3^{\frac{-1}{3}}
   \\
   -1 < m3^{\frac{1}{3}}-m = m(3^{\frac{1}{3}}-1)
   \\
   m(3^{\frac{1}{3}}-1) < 1
   \\
   m < \frac{1}{(3^{\frac{1}{3}}-1)}
   \\
   m < 2.27
   $$

6. But can be easily verified that $m$ cannot be 1 or 2:

   1. $1 \leq 3^{\frac{1}{3}} \sim 1.44$
   2. $2 \leq 3^{\frac{2}{3}} \sim 2.08$

7. Since we get a contradiction, we conclude that **$C$ must be empty and therefore $n \leq 3^{\frac{n}{3}}$ for all nonnegative integers**.

## Problem 3

* **a)** Verify by truth table that $(P \Rightarrow Q)\ OR\ (Q \Rightarrow P)$ is valid.

  | P    | Q    | $(P \Rightarrow Q)\ OR\ (Q \Rightarrow P)$ |
  | ---- | ---- | ------------------------------------------ |
  | T    | T    | T - **T** - T                              |
  | F    | T    | T - **T** - F                              |
  | T    | F    | F - **T** - T                              |
  | F    | F    | T - **T** - T                              |
  | T    | T    | T - **T** - T                              |
  | F    | T    | T - **T** - F                              |
  | T    | F    | F - **T** - T                              |
  | F    | F    | T - **T** - T                              |

* **b)** Let $P$ and $Q$ be propositional formulas. Describre a single formula, $R$, using only $AND$'s, $OR$'s, $NOT$'s, and copies of $P$ and $Q$, such that $R$ is valid iff $P$ and $Q$ are equivalent.
  $$
  R ::= (P\ AND\ Q)\ OR\ (NOT(P)\ AND\ NOT(Q))
  $$

* **c)** A propositional formula is *satisfiable* iff there is an assignment of truth values to its variables - *an enviroment* - which makes it true. Explain why $P$ is valid iff $NOT(P)$ is *not* satisfiable.

  If $NOT(P)$ is not satisfiable, that means that $P$ is never false, so it is always true. Therefore $P$ is valid.

* **d)** A set of propositional formulas $P_1.....P_k$ is *consistent* iff there is an environment in which they are all true. Write a formula, $S$, so that the set $P_1.....P_k$ is *not* consistent iff *S* is valid;

  They are consistent if $P_1\ AND\ P_2\ ...\ P_{K-1}\ AND\ P_K$, so
  $$
  S :: = NOT(P_1)
  $$
  So if $S$ is valid, they are not consistent.

## Problem 4

* **a)**) A 1-bit $add1$ module just has input $a_0$. Write propositional formulas for its outputs $c$ and $p_0$. 
  $$
  p_0 = T\ XOR\ a_0
  \\
  c = p_0 AND\ a_0
  $$

* **b)**
  $$
  p_i = c_{i-1} XOR\ a_i
  \\
  c_i = p_i\ AND\ a_i
  $$
  

* **c)**

* **d)**



