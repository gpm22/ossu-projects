# Chapter 6 - Linear-Time Selection

Questions available in the book **Algorithms Illuminated Part 1: The Basics** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 6.1

Let $\alpha$ be some constant, independent of the input array length $n$, strictly between $\frac 1 2$ and $1$. Suppose you are using the `RSelect` algorithm to compute the median element of a length-$n$ array. What is the probability that the first recursive call is passed a subarray of length at most $\alpha \cdot n$?

* **a)** $1 - \alpha$
* **b)** $\alpha - \frac 12$
* **c)** $1 - \frac \alpha 2$
* **d)** $2\alpha - 1$

**ANSWER**

If the pivot $p$ is less than the median, the length will be $n-p$, if it is bigger, the length will be $p$.

As the length is $\leq \alpha n$, we have the condition
$$
(1-\alpha)n \leq p \leq \alpha n
$$
The probability of $(1-\alpha)n \leq p$ is
$$
\frac{(1-\alpha)n}n=1 - \alpha
$$


The probability of $\alpha n \geq p$ is
$$
\frac {n-\alpha n}{n} = 1- \alpha
$$
Therefore, the probability that $(1-\alpha)n \leq p \leq \alpha n$ is
$$
1 - 2(1-\alpha) = 2 \alpha -1
$$
Thus the correct answer is **d)** $2\alpha - 1$.

### Problem 6.2

Let $\alpha$ be some constant, independent of the input array length $n$, strictly between $\frac 1 2$ and $1$. Assume that every recursive call to RSelect makes progress as in the preceding problem—so whenever a recursive call is given an array of length $k$, its recursive call is passed a subarray with length at most $\alpha k$. What is the maximum number of successive recursive calls that can occur before triggering the base case?

* **a)** $- \frac{\ln n}{\ln \alpha}$
* **b)** $- \frac{\ln n}{\alpha}$
* **c)** $- \frac{\ln n}{\ln (1- \alpha)}$
* **d)** $- \frac{\ln n}{\ln (\frac 12- \alpha)}$

**ANSWER**

The base case occurs when
$$
\alpha^B n = 1
$$
or
$$
\alpha^B= \frac 1 n
$$


applying $\ln$ to both sides results in
$$
B \ln \alpha = \ln 1 - \ln n = - \ln n
$$
thus
$$
B = - \frac {\ln n}{\ln \alpha}
$$
Therefore the correct answer is **a)** $- \frac{\ln n}{\ln \alpha}$.

## Challenge Problems

### Problem 6.3

### Problem 6.4

## Programming Problems

### Problem 6.5