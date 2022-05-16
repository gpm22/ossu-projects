# In-Class Problems Week 4, Mon.

Questions available in **[MIT](https://openlearninglibrary.mit.edu/assets/courseware/v1/0e35e888cf416aa729f9177abb0a70c1/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp8.pdf)**.

## Problem 1

Prove by induction, for all $n > 1$:
$$
1 + \frac{1}{4} + \frac{1}{9} + ... + \frac{1}{n^2} < 2 - \frac{1}{n}
$$
**Answer:**

Proof by induction.

**Induction Hypothesis**:  Defining $S(n)$ as $1 + \frac{1}{4} + \frac{1}{9} + ... + \frac{1}{n^2}$, the induction hypothesis is  $P(n) = S(n) < 2 - \frac{1}{n}$

**Base Case**:
$$
P(2) = 1 + \frac{1}{4} < 2 - \frac{1}{2}
\\
P(2) = \frac{5}{4} < \frac{3}{2} = true
$$
**Inductive Step**:

​	Assuming that $P(n)$ is **true**, $P(n+1)$ will be:
$$
P(n+1) = S(n+1) < 2 - \frac{1}{n+1} \ \ \ \ \ \ \ (1)
$$
​	As $P(n+1)$ can be manipulated to become:
$$
P(n+1) = S(n) + \frac{1}{(n+1)^2} < 2 - \frac{1}{n+1} \ \ \ \ \ \ \  (2)
$$
We know that $S(n) < 2 - \frac{1}{n}$, so its maximum possible contribution would be $1 - \frac{1}{n}$, then
$$
P(n+1) = 1 - \frac{1}{n} + \frac{1}{(n+1)^2} < 2 - \frac{1}{n+1}
\\
\\
P(n+1) = \frac{1}{(n+1)^2} + \frac{1}{n+1} - \frac{1}{n} < 1
\\
\\
P(n+1) = \frac{1 + (n+1) + (n+1)²}{n(n+1)^2} < 1
\\
\\
P(n+1) = 1 + (n+1) + (n+1)²< n(n+1)^2 \ \ \ \ \ \ \  (3)
$$
​		(3) will be **true** for all $n > 1$, so $P(m)$ is **true** for all $m > 1$.

## Problem 2

* **a)** Prove by induction that a $2^n \times 2^n$ courtyard with a 1 x 1 statue of Bill in *a corner* can be covered with L-shaped tiles.

  ​	Proof by induction.

  ​	**Induction Hypothesis**: $P(n) ::=$ a $2^n \times 2^n$ courtyard with a 1 x 1 statue of Bill in *a corner* can be covered with L-shaped tiles for all $n \geq 0$.

  ​	**Base Case**: $P(0)$ is **true**, as it would be just Bill.

  ​	**Inductive Step**: Assuming that $P(n)$ is **true**, lets take a $2^{n+1} \times 2^{n+1}$ courtyard with Bill at a corner. So, diving the courtyard in four squares $2^n \times 2^n$, you can put a Bill in the adjacent corner of the three squares without the Bill. If those three Bills are changed by a tile, then $P(n+1)$ is true.

* **b)** Use the result of part **a)** to prove the original claim that there is a tiling with Bill in the middle.

  ​	As a $2^n \times 2^n$ courtyard with a 1 x 1 statue of Bill in *a corner* can be covered with L-shaped tiles, lets take an $2^{n+1} \times 2^{n+1}$ courtyard divided by four squares $2^n \times 2^n$. As $P(n)$ is assumed true, each square $2^{n} \times 2^{n}$ has a bill in its adjacent corner. So a 2 x 2 square would be at the center of the $2^{n+1} \times 2^{n+1}$ square. Putting a L-shaped tile in that 2 x 2 square and a Bill in the remaining space would fill everything.

## Problem 3

Any amount of 12 or more cents postage can be made using only 3¢ and 7¢ stamps. Prove this by *induction* using the induction hypothesis 

​		$S(n) ::= n + 12$ cents postage can be made using only 3¢ and 7¢ stamp

**Proof**. We prove by strong induction that any amount of 12 or more cents postage can be made using only 3¢ and 7¢ stamps. The induction hypothesis, $P(n)$ will be:

​		There is a amount of cent postage whose values is n + 12.

**Base case:** $P(0)$ is true, as four 3¢ would make 12;

**Inductive step**: We assume $P(k)$ holds for all $k \leq n$, and prove that $P(n+1)$ holds. We argue by cases:

* **Case** $(n+1 = 1)$: We have to make $(n+1)+12 = 13¢. We can do this using two 3¢ and one 7¢ stamps.
* **Case $(n+1=2)$**: We have to make $(n+1)+12 = 14¢. We can do this using two 7¢ stamps.
* **Case $(n+1 \geq 3)$**: Then $0 \leq n - 2 \leq n$, so by the strong induction hypothesis, is possible to make cents postage for $(n-2) + 12¢$. Now by adding a 3¢ stamp, they can make cents postage for $(n+1) + 12¢$. Since $P(n+1)$ is true in every case, we can conclude by strong induction that for all $n \geq 0$.

## Problem 4

The unjustified step is ". Since the righthand side of this equality is a product of $n$ terms, we have by induction that $p$ divides one of them". As it is nonsense to conclude that the number of products is the reason. 

## Personal Problem

Prove that  $S(n) = 2^n \times 2^n - 1$ is always divisible by 3 for all nonnegative $n$.

Proof by induction.

​	**Induction Hypothesis**: $P(n) ::= S(n) = 2^n \times 2^n - 1 = 2^{2n}-1$ is always divisible by 3 for all nonnegative $n$.

​	**Base Case**: $P(0)$ is **true**, as zero is divisible by 3.

​	**Inductive Step**: Assuming that $P(n)$ is **true**, lets take $S(n+1)$ :
$$
S(n+1) = 2^{2n+2}- 1
\\\\
S(n+1) = (2^{2n} \times 2^{2}) - 1
\\\\
\frac{S(n+1)+1}{2^{2}} = 2^{2n} = S(n)+1
\\\\
S(n+1)=4S(n)+3
$$

​	As $S(n)$ is divisible by 3, and summing 3 to a number divisible by 3 results in another number divisible by 3, so $P(n+1)$ is **true**.
