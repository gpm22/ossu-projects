# In-Class Problems week 6, Mon.

Questions available in [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/0a36540419b4da3d3ef83fda02d35fe1/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp13.pdf),

## Problem 1

Find $\text{rem}(9876^{3456789}(9^{99})^{5555}-6789^{3414259},\ 14)$.

Substituting the base numbers for their remainders:
$$
\text{rem}(9876^{3456789}(9^{99})^{5555}-6789^{3414259},\ 14) = \text{rem}(6^{3456789}(9^{99})^{5555}-13^{3414259} ,\ 14)
$$
The remainders for the exponentiations are:
$$
\text{rem}(6^{1}, 14) & = & 6\\ 
\text{rem}(6^{2}, 14) & = & 8\\ 
\text{rem}(6^{3}, 14) & = & 6\\ 
\text{rem}(6^{4}, 14) & = & 8\\
\\
\text{rem}(9^{1}, 14) & = & 9\\ 
\text{rem}(9^{2}, 14) & = & 11\\ 
\text{rem}(9^{3}, 14) & = & 1\\ 
\text{rem}(9^{4}, 14) & = & 9\\
\\
\text{rem}(13^{1}, 14) & = & 13\\ 
\text{rem}(13^{2}, 14) & = & 1\\ 
\text{rem}(13^{3}, 14) & = & 13\\ 
\text{rem}(13^{4}, 14) & = & 1\\
$$
Using these values:
$$
\text{rem}(9876^{3456789}(9^{99})^{5555}-6789^{3414259},\ 14) & = & \text{rem}(6(1)^{5555}-13 ,\ 14) \\
& = & \text{rem}(-7, 14) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \\
& = & -7 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 
$$


## Problem 2

Chinese Remainder Theorem:

​	For $a$ and $b$ being relatively prime, for all $m$, $n$, there is an "x" such that 
$$
x & \equiv & m \text{ mod }(a) \\
x & \equiv & n \text{ mod }(b)
$$
​	Moreover, $x$ is unique up the congurence modulo $ab$, namely, if $x'$ also satisfies the above conditions, then
$$
x' \equiv x \text{ mod }(ab)
$$

* **a)** Prove that for any $m$, $n$, there is some $x$ satisfying the above conditions.

  As $a$ and $b$ are relatively prime, $\text{gcd}(a, b) = 1$
  $$
  x & \equiv & m \text{ mod }(a) & \Rightarrow & x-m = q_1a \\
  x & \equiv & n \text{ mod }(b) & \Rightarrow & x-n = q_2b
  \\
  $$

  So
  $$
  m + q_1a = q2b+n
  $$
  Which can organized as
  $$
  m-n = q_1a - q_2b
  $$
  Then $m-n$ is linear relation of $a$ and $b$, as $q_1$ and $q_2$ are integers. Therefore, as any linear relation of $a$ and $b$ are multiples of $1$, there is a $x$ satisfying the above conditions for any $m$ and $n$.
  
* **b)** Prove that $[x \equiv 0 \text{ mod} (a) \and x \equiv 0 \text{ mod}(b)] \Rightarrow x \equiv 0 \text{ mod}(ab)$;

  We know that
  $$
  x \equiv 0 \text{ mod} (a) & \iff & x = k_1a \\
  x \equiv 0 \text{ mod} (b) & \iff & x = k_2b \\
  $$
  So 
  $$
  x^2 & = & k_1k_2ab \\
  & = & k_3a^2b^2
  $$
  Resulting in
  $$
  x & = & \sqrt{k_3}ab \\
  & = & k_4ab
  $$
  Therefore 
  $$
  x \equiv 0 \text{ mod}(ab)
  $$
  

* **c)** Conclude that $[x \equiv x' \text{ mod} (a) \and x \equiv x' \text{ mod}(b)] \Rightarrow x \equiv x' \text{ mod}(ab)$;

  Following the same logic from the previous exercise:

  We know that
  $$
  x \equiv x' \text{ mod} (a) & \iff & x - x' = k_1a \\
  x \equiv x' \text{ mod} (b) & \iff & x - x' = k_2b \\
  $$
  So 
  $$
  (x-x')^2 & = & k_1k_2ab \\
  & = & k_3a^2b^2
  $$
  Resulting in
  $$
  (x - x') & = & \sqrt{k_3}ab \\
  & = & k_4ab
  $$
  Therefore 
  $$
  x \equiv x' \text{ mod}(ab)
  $$
  

* **d)** Conclude that the Chinese Remainder Theorem is true.

  We conclude that the Chinese Remainder Theorem is true as we prove that exist some $x$ which satisfies the above conditions and that it is unique up to congruence modulo $ab$.

* **e)** What about the converse of the implication in part **c)**?

  The converse says that if $x$ is not congruent to $x'$ modulo $ab$, then $x$ is not congruent to $x'$ modulo $a$ or modulo $b$. 


## Problem 3

* **a)** Using the given recursive definition of integer polynomials, prove by structural induction that for all $q \in P. j \equiv k \text{ mod}(n) \Rightarrow q(j) \equiv q(k) \text{ mod}(n)$

  **Proof.** We prove by structural induction that for all $q \in P. j \equiv k \text{ mod}(n) \Rightarrow q(j) \equiv q(k) \text{ mod}(n)$ for all integers $j$, $k$, $n > 1$.

  **Induction Hypothesis**: $R(q) ::= j \equiv k \text{ mod}(n) \Rightarrow q(j) \equiv q(k) \text{ mod}(n)$ for all integers $j$, $k$, $n > 1$. 

  **Base Cases**:

  * **Identity Function**: $R(Id_{\Z})$ holds as $j \equiv k \text{ mod}(n) \Rightarrow j \equiv k \text{ mod}(n)$ is true;
  * **Constant Function**: $R(c_m)$ holds as $j \equiv k \text{ mod}(n) \Rightarrow m \equiv m \text{ mod}(n)$ is true;

  **Constructor Cases:**

  * $r + s$:

    Assuming that $R(r)$ and $R(s)$ holds:
    $$
    r(j) + s(j) - (r(k)+s(k)) & = & c_1n  \\
    (r(j)-r(k)) + (s(j)-s(k)) & = & c_1n \\
    c_2n + c_3n & = & c_1n
    $$
    Therefore $R(r+s)$ holds.

  * $r \cdot s$:

    $r(j)s(j) \equiv r(k)s(k) \text{ mod}(n)$ means:
    $$
    r(j)s(j) - r(k)s(k) & = & c_1n  \\
    $$
    Assuming that $R(r)$ and $R(s)$ holds:
    $$
    r(j) = c_2n+r(k) \\
    s(j) = c_1n+s(k)
    $$
    Using the above equations with the first one:
    $$
    (c_2n+r(k))(c_3n+s(k))-r(k)s(k) & = & c_1n \\
    c_2c_3n^2 + c_2ns(k)+c_3nr(k)+r(k)s(k) - r(k)s(k) & = & c_1n \\
    c_2c_3n^2 + c_2ns(k)+c_3nr(k) & = & c_1n
    $$
    Therefore $R(r\cdot s)$ holds.

  Therefore $R(q)$ holds for any $q \in P$.

* **b)** Prove that if $q$ has positive degree and positive leading coefficient, then $q$ produces multiples. 

  **Proof.** We prove by cases that if $q$ has positive degree and positive leading coefficient, then $q$ produces multiples. 

  **First Case**: $q$ must have positive degree.

  ​	If $q$ has as negative degree it is impossible to produces multiples, as it is going to produce smaller rational values and you need bigger integer values. So $q$ must have a positive degree.

  **Second Case**: $q$ must have a positive leading coefficient.

  ​	If $q$ has a negative leading coefficient, you will not have positive integers for larger values, so $q$ must have a positive leading coefficient.

  Both cases are enough to prove that if $q$ has positive degree and positive leading coefficient, then $q$ produces multiples. 



