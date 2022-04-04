# In-Class Problems Week 1, Fri.

## Problem 1

Prove that ab = n, then either a or b <= sqrt(n), where a,b, n are whole numbers;

Suppose that  a or b <= sqrt(n) is false, then  a > sqrt(n) and b > sqrt(n);

a² > n² and b² > n²

ab = n -> a²b² = n²

So it is impossible for a² > n² and b² > n², than either a or b must be <= sqrt(n);

## Problem 2

**Statement**: x^(1/y), when x is prime and y>1, is a irrational number;

**Proof:** We use contradiction, so assume that x^(1/y) is a rational number:
$$
x^{\frac{1}{y}} = \frac{n}{d}
$$
Where ***n/d*** are in *lowest terms*, which implies
$$
x = \frac{n^y}{d^y}
\\
xd^y = n^y
$$
Then **x** is a factor of **n^y**, which implies that **x** is a factor of **n**:
$$
n^y = (xk)^y=x^yk^y
$$
Which implies that **x** is also a factor of d:
$$
xd^y = x^yk^y
\\
d^y=xk^y
$$
Then **n/d** are not in *lowest terms*, so this is a **contradiction** then the **root of prime numbers must be an irrational number;**

## Problem 3

Show that an irrational number raised to an irrational power can be rational using sqrt(2)^sqrt(2), which is irrational.
$$
(\sqrt{2}^{\sqrt{2}})^{\sqrt{2}}
\\
\sqrt{2}^{\sqrt{2}{\sqrt{2}}}
\\
\sqrt{2}^2
\\
2
$$
So it is possible to get a rational number from an irrational number to the power of an irrational number;

## Problem 4

$$
a ::= \sqrt{2},\ b::=2\log_{2}3
\\
a^b = \sqrt{2}^{2\log_{2}3} = 3
$$

So, prove that 2log2(3) is irrational;
$$
2log_{2}3 = log_{2}(3^2) = log_{2}(9)
$$
Since the log2(x) returns what number k is necessary to raise 2 to be x, and 9 is not a multiple of 2, then 2log2(3) must be an irrational number;