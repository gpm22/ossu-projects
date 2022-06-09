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

## Problem 4

