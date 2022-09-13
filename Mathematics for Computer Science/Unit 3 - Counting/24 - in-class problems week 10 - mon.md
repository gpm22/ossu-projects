# In-Class Problems Week 10, Mon.

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/ffd1a1f74e9a6051cd1e757e28685816/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp24.pdf).

## Problem 1

For each pair of functions below, determine whether $f = \text{O}(g)$ and whether $g = \text{O}(f)$. In cases where one functions is $\text{O}()$ of the other, indicate the **smallest nonnegative integer $c$** and for that $c$, the **smallest corresponding nonnegative integer $n_0$**.

* **a)** $f(n) =n^2, g(n) = 3n$
  * $g = \text{O}(f)$
  * $c = 1$ and $n_0 = 2$. 
* **b)** $f(n) = (3n -7)/(n+4), g(n)=4$
  * $g = \text{O}(f)$
  * $c = 14$ and $n_0 = 3$
* **c)** $f(n) = 1 + (n \text{ sin} (n \pi/2))^2, g(n) = 3n$
  * $g = \text{O}(f)$
  * $c =1$ and $n_0 =3$;

## Problem 2

* **a)** Indicate which of the following asymptotic relations below on the set of nonnegative real-valued functions are equivalence relations (**E**), strict partial orders (**S**), weak partial orders (**W**), or none the above (**N**).
  * $f \sim g$ - **E**
  * $f = \text{o}(g)$ - **S**
  * $f = \text{O}(g)$ - **N**
  * $f = \Theta(g)$ - **E**
  * $f = \text{O}(g) \text{ AND NOT}( g = \text{O}(f))$ - **S**
* **b)** Indicate the implications among the assertions in part **a)**.
  * $f = \text{o}(g) \text{ IMPLIES } f = \text{O}(g)$
  * $f \sim g \text{ IMPLIES } f = \text{O}(g)$
  * $f = \Theta(g) \text{ IMPLIES } f = \text{O}(g)$
  * $f = \text{O}(g) \text{ AND NOT}( g = \text{O}(f)) \text{ IMPLIES NOT}(f = \text{O}(g))$ 

## Problem 3

**False Claim**
$$
2^n = \text{O}(1)
$$
**It is false, as $2^n$ is not a constant.**

*Bogus proof.* The proof id by induction on $n$ where the induction hypothesis, $P(n)$, is $2^n = \text{O}(1)$.

* **Base case**: $P(0)$ holds trivially.

* **Inductive step**: We may assume $P(n)$, so there is a constant $c > 0$ such that $2^n \leq c \cdot 1$. Therefore,
  $$
  2^{n+1} = 2 \cdot 2^n \leq (2c) \cdot 1,
  $$
  which implies that $2^{n+1} = \text{O}(1)$. That is, $P(n+1)$ holds, which completes the proof of the inductive step.

**The problem is that only $c$ is used, but an $n_0$ is also needed**.

## Problem 4

Assign true or false for each statement and prove it.

* $n^2 \sim n^2 +n$ - **true**
  $$
  \lim_{n \to \infty} \frac{n^2}{n^2+1} = \frac{1}{1+1/n}=1
  $$

* $3^n = \text{O}(2^n)$ - **false**
  $$
  lim_{n \to \infty} \frac{3^n}{2^n} = \left(\frac{3}{2} \right)^n = \infty
  $$
  

* $n^{\text{sin}(n \pi /2)+1} = \text{o}(n^2)$ - **false**

  * As $\text{sin}$ varies between -1 and 1, the $\lim$ does not converge to zero.

* $n = \Theta \left( \frac{3 n^3}{(n+1)(n-1)} \right)$ - **true**

  * $f = n, g = \frac{3 n^3}{(n+1)(n-1)}$
  * $f = \text{O}(g)$, as $\limsup_{n \to \infty}|f|/g = 1/3$.
  * $g = \text{O}(f)$, as $\limsup_{n \to \infty}|g|/f = 3$.
  * Therefore, $f = \Theta (g)$

## Problem 5

Give an elementary proof (without appealing to Stirling's formula) that $\text{log}(n!) = \Theta(n \text{ log}(n))$

**Answer**

Lets show that $\text{log}(n!) = \text{O}(n \text{ log}(n))$ and $n\text{ log}(n) = \text{O}(\text{log}(n!))$. 

First $\text{log}(n!) = \text{O}(n \text{ log}(n))$:
$$
\lim_{n \to \infty} \frac{\log (n!)}{n \log n} = \lim_{n \to \infty} \frac{\log (n)}{n \log n} + \frac{\log (n-1)}{n \log n} + \cdots + \frac{\log (1)}{n \log n} = 0
$$
Now $n\text{ log}(n) = \text{O}(\text{log}(n!))$:
$$
\lim_{n \to \infty} \frac{n \log n}{\log (n!)} = \lim_{n \to \infty} \frac{n \log n}{\log n + \log (n-1) + \cdots + \log(1)}\\ = \lim_{n \to \infty} \frac{n \log n}{\log n (1 + \log (n-1)/\log n + \cdots + \log(1)/ \log n )} \\ = \lim_{n \to \infty} \frac{n}{1 + \log (n-1)/\log n + \cdots + \log(1)/ \log n }
$$
For $n \to \infty$, some values of $\frac{\log (n-c)}{\log n}$, $c > 0$, are 1, so the sum  $1 + \log (n-1)/\log n + \cdots + \log(1)/ \log n \sim n/k$, $k > 0$. Then
$$
\lim_{n \to \infty} \frac{n \log n}{\log (n!)} = \lim_{n \to \infty} \frac{n}{n/k} =  k
$$
Therefore $\text{log}(n!) = \Theta(n \text{ log}(n))$.