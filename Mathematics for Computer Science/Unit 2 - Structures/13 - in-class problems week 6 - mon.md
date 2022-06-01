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
  x & \equiv & m \text{ mod }(a) & \iff & \text{rem}(x, a) & = & \text{rem}(m, a) \\
  x & \equiv & n \text{ mod }(b) & \iff & \text{rem}(x, b) & = &  \text{rem}(n, b)
  \\
  \\
  x-aq_1 = m - aq_2 \to x = m + a(q_1-q_2) \\
  x-bq_3 = n - bq_4 \to x = n + b(q_3-q_4) \\
  m + a(q_1-q_2) = n + b(q_3-q_4)
  $$
  

* **b)**

## Problem 3



