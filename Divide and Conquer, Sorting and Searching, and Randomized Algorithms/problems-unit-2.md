# Chapter 2 - Asymptotic Notation

Questions available in the book **Algorithms Illuminated Part 1: The Basics** by **Tim Roughgarden**.

## Test  Your Understanding

### Problem 2.1

Let $f$ and $g$ be non-decreasing real-valued functions defined on the positive integers, with $f(n)$ and $g(n)$ at least 1 for all $n \geq 1$. Assume that $f(n) = O(g(n))$, and let $c$ be a positive constant. Is $f(n) \cdot \log_n(f(n)^c) = O(g(n) \cdot \log_2(g(m)))$?

**Answer**

a) Yes, for all such $f$, $g$, and $c$

### Problem 2.2

Assume again two positive non-decreasing functions $f$ and $g$ that $f(n) = O(g(n))$. Is $2^{f(n)} = O(2^{g(n)})$?

**Answer**

c) Sometimes yes, sometimes no, depending on the functions $f$ and $g$

d) Yes whenever $f(n) \leq g(n)$ for all sufficiently large $n$.

### Problem 2.3

Arrange the following functions in order of increasing growth rate, with $g(n)$ following $f(n)$ in your list if and only if $f(n) = O(g(n))$.

**Answer**

1. d) $2^{\sqrt{\log_2 n}}$
2. a) $\sqrt{n}$
3. c) $n^{1.5}$
4. e) $n^{5/3}$
5. b) $10^n$

### Problem 2.4

Arrange the following functions in order of increasing growth rate, with $g(n)$ following $f(n)$ in your list if and only if $f(n) = O(g(n))$.

**Answer**

1. e) $n^2$
2. a) $n^2 \log_2 n$
3. d) $n^{\log_2 n}$
4. b) $2^n$
5. c) $2^{2^n}$

### Problem 2.5

Arrange the following functions in order of increasing growth rate, with $g(n)$ following $f(n)$ in your list if and only if $f(n) = O(g(n))$.

**Answer**

1. a) $2^{\log_2 n}$
2. e) $n^2 \log_2 n$ 
3. c) $n^{5/2}$
4. b) $2^{2^{\log_2 n}}$ 
5. d) $2^{n^2}$