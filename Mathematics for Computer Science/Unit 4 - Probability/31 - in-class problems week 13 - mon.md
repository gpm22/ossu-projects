# In-Class Problems Week 13, Mon.

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/7f7138d729b6c3b8709acf4e52289c82/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp31.pdf).

## Problem 1

**Describe such a strategy for Team 1 and explain why it works.**

The strategy is to choose one number at random and the other as being the directly next or previous, so the difference between them will be 1.

That way the probability of Team 1 winning is $\frac 12 + \frac {1}{14} = \frac {8}{14} = \frac {4}{7} $.

Therefore, the probability of Team 2 winning is $1 - \frac 4 7 = \frac 3 7$.

## Problem 2

Let $I_A$ and $I_B$ be the indicator variables for events $A$ and $B$. Prove that $I_A$ and $I_B$ are independent iff $A$ and $B$ are independent.

We assume $A^1 ::=A$, $A^0 ::= \overline A$, $B^1 :: = B$, and $B^0 ::+ \overline B$, so the indicator variables are $I_A = c$ and $I_B = c$ for $c \in \{0, 1\}$.

If $A$ and $B$ are independent, then:
$$
\Pr[A^1 \text{ and } B^1] = \Pr[A^1] \Pr[B^1] = \Pr[I_A = 1]\Pr[I_B = 1] =\Pr[I_A = 1 \text{ and } I_B=1] 
$$
Therefore  $I_A$ and $I_B$ are independent iff $A$ and $B$ are independent.

## Problem 3

Let $R_1, R_2, \dots, R_m$, be mutually independent random variables with uniform distribution on $[1, n]$. Let $M ::= \max\{R_i \ | \ i \in [1, m] \}$

* **a)** Write a formula for $\text{PDF}_M(1)$

  * We now that for each $R_m$, the pdf is $f = 1/n$.

  * Therefore, as the max random variable $M$ is a $R_m$:
    $$
    \text{PDF}_M(1) = \frac 1n
    $$
    

* **b)** More generally, write a formula for $\Pr[M \leq k]$.

  * This is basically the cumulative distribution function $\text{CDF}_M(k) = \Pr[M \leq k]$

  * It will be the same as the uniform distribution:
    $$
    \text{CDF}_M(k) = \frac kn
    $$
    

* **c)** For $k \in [1,n]$, write a formula for $\text{PDF}_m(k)$ in terms of expressions of the form $\Pr[M \leq j]$ for $j \in [1,n]$.

  * As $\Pr[M \leq j]$ is the $\text{CDF}_M$, then $\Pr[M \leq j] = \sum_{y \leq j} \text{PDF}_M(y)$

  * Therefore
    $$
    \text{PDF}_m(k) = \Pr[M \leq k] - \Pr[M \leq k-1]
    $$
    

## Problem 4

* **a)** Show that:

  * $\text{PDF}_J(k-1) < \text{PDF}_J(k)$ for $k < np + p$.
  * $\text{PDF}_J(k-1) > \text{PDF}_J(k)$ for $k > np + p$

  **Answer**:

  First we expand $\text{PDF}_J(k)$a and $\text{PDF}_J(k-1)$:
  $$
  \text{PDF}_J(k) & = & \frac{n!p^k(1-p)^{n-k}}{(n-k)!k!} \\
  \text{PDF}_J(k-1) & = & \frac{n!p^{k-1}(1-p)^{n-k+1}}{(n-k+1)!(k-1)!}
  $$
  

  Then
  $$
  f & = &\frac {\text{PDF}_J(k)}{\text{PDF}_J(k-1)} \\ & = & \frac{n!p^k(1-p)^{n-k}}{(n-k)!k!}  \cdot \frac{(n-k+1)!(k-1)!} {n!p^{k-1}(1-p)^{n-k+1}}\\
  & = & \frac {p(n-k+1)}{k(1-p)} \\
  & = & \frac {p(n+1)}{k(1-p)} - \frac{p}{(1-p)}
  $$
  $f$ is less than 1 when
  $$
  \frac {p(n+1)}{k(1-p)} - \frac{p}{(1-p)} < 1 \\
  
  \frac {p(n+1)}{k(1-p)} < 1 + \frac{p}{(1-p)} \\
  
  p(n+1) < k(1-p) + kp \\
  p(n+1) < k-kp + kp \\
  p(n+1) < k
  $$
  $f$ is more than 1 when

  
  $$
  \frac {p(n+1)}{k(1-p)} - \frac{p}{(1-p)} > 1 \\
  
  \frac {p(n+1)}{k(1-p)} > 1 + \frac{p}{(1-p)} \\
  
  p(n+1) > k(1-p) + kp \\
  p(n+1) > k-kp + kp \\
  p(n+1) > k
  $$
  Therefore:

  * $\text{PDF}_J(k-1) < \text{PDF}_J(k)$ for $k < np + p$.
  * $\text{PDF}_J(k-1) > \text{PDF}_J(k)$ for $k > np + p$

* **b)** Conclude that the maximum value of $\text{PDF}_j$ is asymptotically equal to: $(2 \pi n p q)^{-1/2}$.

  First we use the Stirling's Formula in $\text{PDF}_J(k)$:
  $$
  \text{PDF}_J(k) & \sim & \frac{\sqrt{(2 \pi n)}(n/e)^n  p^k(1-p)^{n-k}}{ \sqrt{(2 \pi (n-k)}((n-k)/e)^{n-k}\sqrt{(2 \pi k)}(k/e)^k } \\
  & \sim & \frac{n^n}{\sqrt{ 2 \pi k(n-k)/n}} \left( \frac{1-p}{n-k} \right)^{n-k} \left( \frac{p}{k} \right)^k
  $$
  

  As the maximum value if $\text{PDF}_J(np)$:
  $$
  \text{PDF}_J(np) & \sim & \frac{n^n}{\sqrt{ 2 \pi p(n-np)}} \left( \frac{1-p}{n-np} \right)^{n-np} \left( \frac{p}{np} \right)^{np} \\
  & \sim & \frac{n^n}{\sqrt{ 2 \pi pn(1-p)}} \left( \frac 1n \right)^n \\
  & \sim & \frac{1}{\sqrt{ 2 \pi pn(1-p)}} \\
  & = & \frac{1}{\sqrt{ 2 \pi pnq}}
  $$
  

## Problem 5