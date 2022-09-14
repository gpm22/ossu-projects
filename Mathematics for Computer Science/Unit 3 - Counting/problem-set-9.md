# Problem Set 9

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/7f4ac06846334ddd88be8fdb92b94d31/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_ps9.pdf).

## Problem 1

Assuming the following sum equals a polynomial in n, find the polynomial. Optionally, you might want to use induction to prove that the sum equals the polynomial you find, but no such proof is required for full credit.
$$
\sum_{i=1}^n i^3
$$
We assume:
$$
\sum_{i=1}^n i^3 = a n^4 + bn^3 + cn^2 + dn + e
$$
Getting the first 5 values of the equation:
$$
n & = & 0 & \to & e = 0 \\
n & = & 1 & \to & a + b + c + d + e = 1\\
n & = & 2 & \to & a16 + b8 + c4 + d2 + e = 9\\
n & = & 3 & \to & a81 + b27 + c9 + d3 + e = 36\\
n & = & 4 & \to & a256 + b64 + c16 + d4 + e = 100\\
$$
Resolving this linear system we got the following values:
$$
e = 0 \\
d = 0 \\
c = \frac 1 4 \\
b = \frac 1 2 \\
a = \frac 1 4
$$
Resulting:
$$
\sum_{i=1}^n i^3 = f(n) = \frac{n^4}{4} + \frac{n^3}{2} + \frac{n^2}{4} = \frac{n^4+2n^3+n^2}{4}
$$
Proof:

We will prove by induction that $\sum_{i=1}^n i^3 = f(n)$.

**Base case**: It is trivial $\sum_{i=1}^0 i^3 = f(0) =0$.

**Inductive Step**: We assume that holds for $f(n)$, and we will prove that holds for $f(n+1)$.
$$
\sum_{i=1}^{n+1} i^3 = \sum_{i=1}^{n} i^3 + (n+1)^3
$$
as $f(n)$ holds
$$
\sum_{i=1}^{n+1} i^3 = \frac{n^4+2n^3+n^2}{4} + (n+1)^3 = \frac{4n^4+6n^3+13n^2+12n+4}{4} = \frac{(n+1)^4+2(n+1)^3+(n+1)^2}{4}
$$


So $f(n+1)$ also holds, therefore the equation is correct!

## Problem 2

Show that $\ln (n^2!) = \Theta(n^2 \ln n) $.

Using the Stirling's formula
$$
n! \sim \sqrt{2\pi n}\left( \frac{n}{e} \right)^n
$$
$(n^2)!$ becomes
$$
(n^2)! & \sim &  \sqrt{2\pi n^2}\left( \frac{n^2}{e} \right)^{n^2} \\
& \sim & n\sqrt{2\pi}\left( \frac{n^{2n^2}}{e^{n^2}} \right) \\
& \sim & \sqrt{2\pi}\left( \frac{n^{2n^2+1}}{e^{n^2}} \right)
$$
So $\ln(n^2!)$ is
$$
\ln (n^2!) & \sim & \ln \left( \sqrt{2\pi}\left( \frac{n^{2n^2+1}}{e^{n^2}} \right) \right) \\
& \sim & \ln ( \sqrt{2 \pi} ) + \ln (n^{2n^2 + 1}) - \ln(e^{n^2}) \\
& \sim & \ln ( \sqrt{2 \pi} ) + (2n^2)\ln (n) + \ln(n) - n^2
$$
Now we are going to see if $\ln (n^2!) = \text{O}(n^2 \ln (n))$:
$$
\lim_{n \to \infty} \frac{\ln (n^2!)}{n^2 \ln (n)} = \lim_{n \to \infty} \frac{\ln ( \sqrt{2 \pi} ) + (2n^2)\ln (n) + \ln(n) - n^2}{n^2 \ln (n)} = 2 < \infty
$$
Now we are going to see if $n^2 \ln (n) = \text{O}(\ln (n^2!))$:
$$
\lim_{n \to \infty} \frac{n^2 \ln (n)}{\ln (n^2!)} = \lim_{n \to \infty} \frac{1}{\ln (n^2!)/(n^2 \ln (n))} = \frac 1 2 < \infty
$$
As both are true,  $\ln (n^2!) = \Theta(n^2 \ln n)$. 

## Problem 3

Prove that $\sum_{k=1}^n k^6 = \Theta(n^7)$.

We are going to use the bounds of the sum.

First we calculate the integral $I = \int_1^n x^6dx$:
$$
I = \int_1^n x^6dx = \frac{n^7-1}{7}
$$
The bounds are:
$$
\frac {n^7 + 6}{7} \leq \sum_{k=1}^n k^6 \leq \frac {n^7 + 6n^6 - 1}{7}
$$
Both bounds are $\Theta(n^7)$,  and as $n \to \infty$:
$$
\frac {n^7}{7} \leq \sum_{k=1}^n k^6 \leq \frac {n^7}{7}
$$
Then, for $n \to \infty$:
$$
\sum_{k=1}^n k^6 \sim \frac {n^7}{7}
$$
Therefore $\sum_{k=1}^n k^6 = \Theta(n^7)$.