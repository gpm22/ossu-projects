# In-Class Problems Week 6, Fri.

## Problem 1

* **a)** Go through the **beforehand steps**;
  * $p$: 11
  * $q$: 7 
  * $n = pq$: 77
  * $(p-1)(q-1)$: 60
  * $e$: 17
  * **public key:**
    * $n$: 77
    * $e$: 17
  * $d$ : 53
  * **private key**
    * $n$: 77
    * $d$ : 53
* **b)** Message to sent:
  * 6 = Someone on our team thinks someone on your team is kinda cute.
  * Encrypted message $\hat{m} =\text{rem}(m^e, n)$
    * 41;
* **c)** Message received:
  * 41
  * Decrypted message $m =\text{rem}(\hat{m}^d, n)$
    * 6

## Problem 2

* **a)** Just as RSA would be trivial to crack knowing the factorization into two primes of $n$ in the public key, explain why RSA would also be trivial to crack knowing $\phi(n)$.

  Because you would find $d$, as $d \cdot e \equiv 1 \quad (\text{mod } \phi(n))$.

* **b)** Show that if you knew $n$, $\phi(n)$, and that $n$ was the product of two primes, then you could easily factor $n$.

  We know that 
  $$
  \phi(n) & = & \phi(p_1p_2) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \\
  & = & (p_1-1)(p_2-1)
  $$
  and that
  $$
  n = p1p2
  $$
  $p_1$ and $p_2$ will be the roots of the equation:
  $$
  p^2 + p(\phi(n)-n+1) + n = 0
  $$
  Therefore:
  $$
  p_1 = \frac{(n-1-\phi(n))+\sqrt{(n-1-\phi(n))^2 - 4n}}{2}  \\
  p_1 = \frac{(n-1-\phi(n))-\sqrt{(n-1-\phi(n))^2 - 4n}}{2}
  $$

## Problem 3

* **a)** Explain why $\hat{m}^d ::= (m^e)^d = m \quad (\Z_n)$ follows very simply from Euler's theorem when $m$ is relatively prime to $n$.

  As $m$ is relatively prime to $n$:
  $$
  m^{\phi(n)} = 1 \quad (\Z_n)
  $$
  and we know that
  $$
  d \cdot e \equiv 1 \quad (\text{mod } \phi(n)) \Rightarrow (d \cdot e)=k\phi(n)+1
  $$
  therefore
  $$
  (m^e)^d & = & m^{ed} \ \ \ \ \ \ \ \ \ \  \\ 
   & = & m^{k\phi(n)+1}  \ \  \\
   & = & m \cdot m^{k\phi(n)} \\
   & =&  m \quad (\Z_n) \ \
  $$
  

* **b)**







