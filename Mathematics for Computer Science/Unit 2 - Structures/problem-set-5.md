# Problem Set 5

Questions are available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/f472b410ecb65c7a0ed180b2a8bbd5cb/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_ps5.pdf).

## Problem 1

Extend the binary gcd procedure to obtain a new pulverizer that uses only division by 2 and subtraction in the course textbook.

**Binary GCD state machine:**
$$
\text{states} & ::= & \N^3 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \\
\text{variables} & ::= & (x, y, e) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \\
\text{start state} & ::= & (a, b, 1) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \\
\text{transitions} & ::= & \text{if min}(x, y) > 0, \text{ then } (x, y, e) \to \\
& & (x/2, y/2, 2e) & \quad (\text{if }2|x \text{ and } 2 | y) & \quad (2) \\
& & (x/2, y, e) & \quad (\text{else if }2|x) & \quad (3) \\
& & (x, y/2, e) & \quad (\text{else if }2|y) & \quad (4) \\
& & (x-y, y, e) & \quad (\text{else if }x>y) & \quad (5) \\
& & (y-x, x, e) & \quad (\text{else if }y>x) & \quad (6) \\
& & (1, 0, ex) & \quad (\text{otherwise } (x=y)) & \quad (7) \\
\text{invariant} & ::= & \text{gcd}(x,y)e = \text{gcd}(a,b) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \
$$

**Binary Pulverizer state machine:**
$$
\text{states} & ::= & \N^7 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   \\
\text{variables} & ::= & (x, y,u_x, v_x, u_y, v_y) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   \\
\text{start state} & ::= & (a, b, 1, 0, 0, 1) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   \\
\text{transitions} & ::= & \text{if min}(x, y) > 0, \text{ then } (x, y, u_x, v_x, u_y, v_y) \to \\
& & (x/2, y/2, u_x,v_x,u_y,v_y) & \quad (\text{if }2|x \text{ and } 2 | y) & \quad (2) \\
& & (x/2, y, u_x/2, v_x/2, u_y, v_y) & \quad (\text{else if }2|x \and 2|u_x \and 2|v_x) & \quad (3) \\
& & (x, y/2,u_x, v_x, u_y/2, v_y/2) & \quad (\text{else if }2|y \and 2|u_y \and 2|v_y/) & \quad (4) \\
& & (x-y, y, u_x-u_y,v_x-v_y, u_y, v_y) & \quad (\text{else if }x>y) & \quad (5) \\
& & (y-x, x,u_y-u_x, v_y-v_x, u_x, v_y) & \quad (\text{else if }y>x) & \quad (6) \\
& & (1, 0, u_x, v_x, u_y, v_y) & \quad (\text{otherwise } (x=y)) & \quad (7) \\
\text{invariants} & ::= & \text{gcd}(x,y)= \text{gcd}(a,b) \text{ (after step 2)} \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \\
& & u_xa + v_xb = x \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \\
& & u_ya + v_yb = y \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
$$

## Problem 2

Suppose that $p$ is a prime and $0 < k < p$.

* **a)** $k$ is self-inverse if $k^2 = 1 \quad (\text{mod }p)$. Prove that $k$ is a self-inverse iff either $k =1$ or $k=p-1$.

  * **$k = 1$**

    * This is trivial, as $1 - 1 = 0$ and $0$ is divisible by any number;

  * $k = p - 1$
    $$
    \frac{k^2 - 1}{p} & = & \frac{(k-1)(k+1)}{p} \\
    & = & \frac{(p-1-1)(p-1+1)}{p} \\
    & = & \frac{(p-2)p}{p} \\
    & = & p-2 \\
    $$
    Therefore, $k$ is a self-inverse iff either $k =1$ or $k=p-1$.

* **b)** The English mathematician Edward Waring said that the following theorem would probably be very difficult to prove because there was no adequate notation for primes. Gauss then proved it (while standing on one foot, it is rumored); he suggested that Waring failed for lack of notions, not notations. 

  **Theorem** (Wilson's Theorem). If $p$ is a prime, then
  $$
  (p-1)! \equiv -1 \quad (\text{mod p})
  $$
  Prove Wilson's Theorem.

  

  **Proof**. 

  As the case for $p=2$ is trivial, it is possible to assume that $p$ is an odd prime. So there are even pairs in $(p-1)!$, the pair $(p-1) \times 1$ has the remainder -1, as $(p-1)$ is a self-inverse, and it is possible to rearrange the remaining pairs in a way that each pair will be $\equiv 1 \quad (\text{mod } p)$, as those numbers are relatively prime to $p$, so they have an inverse in $\Z_p$.

## Problem 3

Suppose that $a$ adn $b$ are relatively prime integers greater than 1.

* **a)** Conclude from the Chinese Remainder that the function $f : [0..ab) \to [0..a) \times [0..b) $ defined by
  $$
  f(x) ::= (\text{rem}(x,a), \text{rem}(x, b))
  $$
  is a bijection.

  **Answer**

  The Chinese Remainder Theorem asserts that for all $m, n$ there is a unique number in $[0..ab)$, that when divided by $a$ will have the same remainder as $m$ divided by $a$ and when divided by $b$ will have the same remainder as $n$ divided by $b$. Then the pair $(\text{rem}(x,a), \text{rem}(x, b))$ is unique to each element in $[0..ab)$, and each element in $[0..ab)$ has a unique pair, therefore the function $f$ is a bijection.

* **b)** For any positive integer $k$ let $\Z_k^*$ be the integers in $[0..k)$ that are relatively prime to $k$. Prove that the function $f$ from part **a)** also defines a bijection from $\Z_{ab}^*$ to $\Z_a^* \times \Z_b^*$.

  **Answer**

  Each element in $\Z_{ab}^*$ will have only one pair of remainders and those values are in $\Z_a^* \times \Z_b^*$, as $k_{ab}$ as relatively prime to both $a$ and $b$, it will be related to one number relatively prime to $a$ and other relatively prime to $b$.

* **c)** Conclude from the preceding parts of this problem that $\phi(ab) = \phi(a)\phi(b)$.

  **Answer**

  We have seen that the size of the numbers relatively prime to $a$ and $b$ is the same size of the numbers relatively prime to $a$ multiplied by the numbers relatively prime to $b$, therefore $\phi(ab) = \phi(a)\phi(b)$

* **d)** Prove that for any number $n>1$, if $p_1,\ p_2,\ \dots,\ p_j$ are the distinct prime factors of $n$, then
  $$
  \phi(n) = n \left(1-\frac{1}{p_1}\right)\left(1-\frac{1}{p_2}\right)\dots \left(1-\frac{1}{p_j}\right)
  $$
  **Answer**

  The number $n$ can be showed using its prime factors:
  $$
  n = p_1^{c_1}p_2^{c_2}\dots p_j^{c_j}
  $$
  As $\phi(ab) = \phi(a)\phi(b)$, so
  $$
  \phi(n) & = & \phi(p_1^{c_1}p_2^{c_2}\dots p_j^{c_j}) \ \ \ \ \ \ \ \ \ \ \  \\
  & = & \phi(p_1^{c_1})\phi(p_2^{c_2})\dots \phi(p_j^{c_j})
  $$
  As $\phi(p^c) = p^c - p^{c-1}$:
  $$
  \phi(n) =(p_1^{c_1}-p_1^{c_1-1})(p_2^{c_2}-p_2^{c_2-1})\dots(p_j^{c_1}-p_1^{c_j-1})
  $$
  Putting each prime factor outside of the their parenthesis:
  $$
  \phi(n) & = & p_1^{c_1}p_2^{c_2}\dots p_j^{c_j} \left(1-\frac{1}{p_1}\right)\left(1-\frac{1}{p_2}\right)\dots \left(1-\frac{1}{p_j}\right) \\
  & = & n \left(1-\frac{1}{p_1}\right)\left(1-\frac{1}{p_2}\right)\dots \left(1-\frac{1}{p_j}\right) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 
  $$
  

