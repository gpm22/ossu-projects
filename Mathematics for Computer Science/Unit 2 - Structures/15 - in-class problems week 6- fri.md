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
  
* **b)** Prove if $p$ is prime and $a \equiv 1 \quad (\text{mod p -1})$, then $m^a = m \quad (\Z_p)$.

  **Proof.** We argue by cases that if $p$ is prime and $a \equiv 1 \quad (\text{mod p -1})$, then $m^a = m \quad (\Z_p)$.

  **Case 1:** $p|m$, in that case $m^a = m \quad (\Z_p)$, as $\text{rem}(m^a, p) = \text{rem}(m, p) = 0$.

  **Case 2**: $m$ is relatively prime to $p$. 

  As $\phi(p) = p -1$, $a = c_1(p-1)+1, c_1 \geq 1$. So
  $$
  \text{rem}(m^{a},p) & = & \text{rem}(m^{c_1\phi(p)+1},p) \\
  & = & \text{rem}(m^{c_1\phi(p)}m,p)
  $$
  By Euler theorem $m^{\phi(p)} = 1 \quad \Z_p$, so
  $$
  \text{rem}(m^{a},p) = \text{rem}(m,p)
  $$
  Therefore $m^a = m \quad (\Z_p)$

  

* **c)** Give an elementary proof that if $a \equiv b \quad (\text{mod } p_i)$ for distinct primes $p_i$, then $a \equiv b$ modulo the product of these primes.

  Knowing that 
  $$
  a-b = c_1p_1 \\
  a-b = c_2p_2
  $$
  So as
  $$
  c_1p_1=c_2p_2
  $$
  $c_1$ must be a multiple of $p_2$ and $c_2$ must be a multiple of $p_1$then
  $$
  a - b = c_3p_1p_2
  $$
   Therefore
  $$
  a \equiv b \quad (\text{mod } p_1p_2)
  $$
  

* **d)** Note that $\hat{m}^d ::= (m^e)^d = m \quad (\Z_n)$ is a special case of 

  **Claim.** If $n$ is a product of distinct primes and $a \equiv 1 \quad (\text{mod } \phi(n))$, then $m^a = m \quad (\Z_n)$.

  Use the previous parts to prove the Claim.

  **Proof.** We prove by cases that If $n$ is a product of distinct primes and $a \equiv 1 \quad (\text{mod } \phi(n))$, then $m^a = m \quad (\Z_n)$.

  **Case 1:** $n|m$, in that case $m^a = m \quad (\Z_n)$, as $\text{rem}(m^a, n) = \text{rem}(m, n) = 0$.

  **Case 3**: $p_1|m$ or $p2|m$, as $n = p_1p_2$.

  Let's assume $m = c_1p_1$, where $c_1$ is relatively prime to $n$, so
  $$
  \text{rem}(m, n) = p_1\text{rem}(c_1, p_2)
  $$
  Then as $a = c_2\phi(n)+1, c_2 \geq 1$ :
  $$
  \text{rem}(m^{a},n) & = & \text{rem}(m^{c_2\phi(n)+1},n) \\
  & = & \text{rem}(m^{c_2\phi(n)}m,n) \\
  & = & \text{rem}((c_1p_1)^{c_2\phi(n)}m,p_1p_2) \\
  & = & \text{rem}(c_1^{c_2\phi(n)} p_1^{c_2\phi(n)}m,p_1p_2) \\
  & = & \text{rem}(c_1^{c_2\phi(n)},p_1p_2) \cdot \text{rem}(p_1^{c_2\phi(n)},p_1p_2) \cdot \text{rem}(m,n) \\
  & = & p_1\cdot \text{rem}(p_1^{c_2\phi(n)-1}, p2) \cdot \text{rem}(m,n) \\
  & = & p_1\cdot \text{rem}(p_1^{c_2\phi(n)}p_1^{-1}, p2) \cdot \text{rem}(m,n) \\
  & = & p_1\cdot \text{rem}(p_1^{-1}, p2) \cdot \text{rem}(m,n) \\
  & = & p_1\cdot p_1^{-1} \cdot \text{rem}(m,n) \\
  & = &\text{rem}(m,n)
  $$
  

  **Case 3**: $m$ is relatively prime to $n$. 

  As $a = c_1\phi(n)+1, c_1 \geq 1$. So
  $$
  \text{rem}(m^{a},n) & = & \text{rem}(m^{c_1\phi(n)+1},n) \\
  & = & \text{rem}(m^{c_1\phi(n)}m,n)
  $$
  By Euler theorem $m^{\phi(n)} = 1 \quad \Z_n$, so
  $$
  \text{rem}(m^{a},n) = \text{rem}(m,n)
  $$
  Therefore $m^a = m \quad (\Z_n)$






