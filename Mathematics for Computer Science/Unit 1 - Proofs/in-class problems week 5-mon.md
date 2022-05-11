## In-Class Problems Week 5, Mon.

Questions available in [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/4fd0c6fb3dd99ee56ba88930f138428f/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp10.pdf).

## Problem 1

* **a)** Prove that the function $1/x$ is an F18.

  * As $log_ 2(x)$ is the inverse of $2^x$, then $log_2(x) \in \text{F18}$. Therefore so is $c \cdot log_2(x)$ for any constant $c$, and hence $2^{c log_2(x)} = x^c$. Now let $c = -1$ to get $x^{-1}=1/x \in \text{F18}$.

* **b)** Prove by Structural Induction on this definition that the Elementary 18.01 Functions are closed under taking derivatives.

  We use structural induction to prove that $f(x) \in \text{F18} \Rightarrow [f' ::= df/dx] \in \text{F18}$.

  **Induction Hypothesis:** $P(f) ::= f(x) \in \text{F18} \Rightarrow [f' ::= df/dx] \in \text{F18}$.

  **Base cases:**

  * **Identity function**: $P(f) ::= id(x) \in \text{F18} \Rightarrow [id'(x) =1] \in \text{F18}$ holds.
  * **Constant function**: $P(k) ::= k \in \text{F18} \Rightarrow [k' = 0] \in \text{F18}$ holds.
  * **Sine function**:
    *  as $sin'(x) = cos(x)$, we have to prove that $cos(x) \in \text{F18}$ .
    *  as $sin(x) = \frac{e^{ix}-e^{-ix}}{2i}$, then $e^{ix}, e^{-ix} \in \text{F18}$.
    *  as  $cos(x) = \frac{e^{ix}+e^{-ix}}{2}$, therefore $cos(x) \in \text{F18}$
    * $P(sin) ::= sin(x) \in \text{F18} \Rightarrow [sin'(x) = cos(x)] \in \text{F18}$ holds.
  
  **Constructor Cases**: For $f, g \in \text{F18}$
  
  * $f + g$; 
  
    Assuming that $P(f)$ and $P(g)$ hold:
    $$
    d(f + g)/dx = f' + g'
    $$
    So it also holds for $P(f + g)$.
  
  * $fg$:
  
    Assuming that $P(f)$ and $P(g)$ hold:
    $$
    d(fg)/dx = f'g + g'f
    $$
    So it also holds for $P(fg)$.
  
  * $2^g$:
  
    Assuming that $P(g)$ holds:
    $$
    d(2^g)/dx = ln(2)g'2^g
    $$
    As $ln(2)$ is a constant and its assumed that $P(g)$ holds, therefore it also holds for $P(2^g)$.
  
  * $f^{-1}$
  
    Assuming that $P(f)$ hold
    $$
    \frac{d(f^{-1})}{dx} & = \frac{d(1/f)}{dx} \ \ 
    \\
    & = \frac{f'}{f^2} \ \ \ \ \ \ \ \ \
    \\
    & = f'(f^{-1})^2
    $$
    So $P(f^{-1})$ also holds.
  
  * $f \circ g$
  
    Assuming that $P(f)$ and $P(g)$ hold:
    $$
    d(f \circ g)/dx = g'(f' \circ g)
    $$
    So it also holds for $P(f \circ g)$.

## Problem 2

## Problem 3

* **a)** The set $S ::= \{2^k3^m5^n \in \N\ |\ k, m, n \in \N  \}$
  * **Base case**: $1 \in S$
  * **Constructor case**: $\forall n \in S.\ 2n, 3n, 5n \in S$
* **b)** The set $T ::= \{2^{k}3^{2k+m}5^{n+m} \in \N\ |\ k, m, n \in \N  \}$
  * **Base case**: $1 \in T$
  * **Constructor case**: $\forall n \in T.\ 18n, 15n, 5n \in T$
* **c)** The set $L ::= \{ (a, b) \in \Z^2\ |\ (a -b) \text{ is multiple of } 3 \}$
  * **Base case**:  $\forall n \in \Z. (n, n) \in L$
  * **Constructor case**: $\forall (a, b) \in L. (a+3, b), (a-3, b), (a, b+3), (a,b-3) \in L$  
* **d)** Prove by structural induction on your definition of $L'$ that $ L' \subseteq L$.
  * We prove by structural induction that $L' \subseteq L$.
  * **Induction Hypothesis:** $P(e) ::= e \in L' \Rightarrow e \in L$;
  * **Base case**: As zero is multiple of 3, so $P((n, n))$ holds;
  * **Constructor case**: Assuming that $P((a, b)$ holds, all the constructors cases will hold as they all results in $(a -b)$ being a multiple of 3.
* **e)** Confirm that you got the definition right by proving that $ L \subseteq L'$.
  * We prove by structural induction that $L \subseteq L'$.
  * **Induction Hypothesis:** $P(e) ::= e \in L \Rightarrow e \in L'$;
  * **Base case**: As zero is multiple of 3, so $P((n, n))$ holds;
  * **Constructor case**: Assuming that $(a, b) \in L$ so $ 3 |(a -b)$, which means that $\forall n, i, j \in \Z.\ a = n + 3i$ and $b = n +3j$. So it is possible to apply the constructor rule, $r \pm 3$, $i$ times and the constructor rule, $r \pm 3$, $j$ times to get $(a, b)$. So $(a, b) \in L'$, which implies $L \subseteq L'$.
* **f)** See if you can give an *unambiguous* recursive definition of $L$.
  * **Base cases**:
    *  $\forall n \in \Z. (n, n) \in L$
    *  $(1, -2), (2, -1), (-1, 2), (-2, 1) \in L$
  * **Constructor cases**:
    * Defining $\text{Sg}(x) ::= \begin{cases}\ \ \ 1       & \quad \text{if } x \geq 0 \\ -1   & \quad \text{if } x <0\end{cases}$ , then
      * if $||a| - |b|| \leq 1$, then $(a + 3\text{Sg}(a),\ b + 3\text{Sg}(b)),\ (a + 3\text{Sg}(a),\ b),\ (a,\ b + 3\text{Sg}(b)) \in L$
      * if $|a| > |b| + 1$, then $ (a + 3\text{Sg}(a),\ b)\in L$
      * if $|b| > |a| + 1$, then $ (a ,\ b + 3\text{Sg}(b))\in L$

## Problem 4

## Extras

### Problem 6.1

Prove that for all strings $r, s, t \in A^*$
$$
(r \cdot s) \cdot t = r \cdot (s \cdot t)
$$
**Answer**

​	We use **structural induction** to prove that $(r \cdot s) \cdot t = r \cdot (s \cdot t)$.

​	**Induction Hypothesis:** For $s \in A^*$ $P(s) ::= \forall r, \forall t \in A^*.\ \ \ (r \cdot s) \cdot t = r \cdot (s \cdot t)$

​	**Base case $s = \lambda$**: 
$$
(r \cdot s) \cdot t & = (r \cdot \lambda) \cdot t
\\
& = (r \cdot t) \ \ \ \ \ 
\\
& = r \cdot (\lambda \cdot t)
\\
& = r \cdot (s \cdot t)
$$
​	**Constructor case:** Suppose $s ::= \langle a, k \rangle$ and assume the induction hypothesis $P(k)$ holds. We must show that $P(s)$ holds:
$$
(r \cdot s) \cdot t & = (r \cdot \langle a, k \rangle) \cdot t
\\
& = \langle a, r \cdot k \rangle \cdot t
\\
& = \langle a, r \cdot k \cdot t \rangle
\\
& = r \cdot \langle a, k \cdot t \rangle
\\
& = r \cdot (\langle a, k \rangle \cdot t)
\\
& = r \cdot (s \cdot t)
$$
​	This proves that $P(s)$ holds as required, completing the constructor case, By structural induction we conclude that $P(s)$ holds for all strings $s \in A^*$.

### Problem 6.2

The reversal of a string is the string written backwards.

* **a)** Give a simple recursive definition of $\text{rev}(s)$ based on the recursive definition of a string of $s \in A^*$ and using the concatenation operation.

  * **Base cases**: 
    * $\text{rev}(\lambda) = \lambda$
    * $\text{rev}(\langle a, \lambda \rangle) = \langle a, \lambda \rangle$
  * **Constructor Case**: $rev(\langle a, s \rangle) = \text{rev}(s) \cdot \langle a, \lambda \rangle$ 

* **b)** Prove that $\text{rev}(s \cdot t) = \text{rev}(t) \cdot \text{rev}(s)$ for all strings $s, t \in A^*$.

  * We use **structural induction** to prove that $\text{rev}(s \cdot t) = \text{rev}(t) \cdot \text{rev}(s)$ for all strings $s, t \in A^*$.

    ​	**Induction Hypothesis:** For $s \in A^*$ $P(s) ::= \forall t \in A^*.\ \ \ \text{rev}(s \cdot t) = \text{rev}(t) \cdot \text{rev}(s)$

    ​	**Base case $s = \lambda$**: 
    $$
    \text{rev}(s \cdot t) & =\text{rev}(\lambda \cdot t)  \ \ \ \ \ \ \ \ 
    \\
    & = \text{rev}(t) \ \ \ \ \ \ \ \ \ \ \ \ \   
    \\
    & =  \text{rev}(t) \cdot \text{rev}(\lambda)
    $$
    ​	**Constructor case:** Suppose $s ::= \langle a, k \rangle$ and assume the induction hypothesis $P(k)$ and $P(t)$  hold. We must show that $P(s)$ holds:
    $$
    \text{rev}(s \cdot t) & = \text{rev}(\langle a, k \rangle \cdot t) \ \ \ \ \  \ \ \ \ \ \ \ \ \ \ \ \
    \\
    & = \text{rev}(\langle a, k \cdot t \rangle )  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 
    \\
    & = \text{rev}(k \cdot t ) \cdot \langle a, \lambda \rangle \ \ \ \ \ \ \ \ \ \  \ \
    \\
    & = (\text{rev}(t) \cdot \text{rev}(k)) \cdot \langle a, \lambda \rangle
    \\
    & = \text{rev}(t) \cdot (\text{rev}(k) \cdot \langle a, \lambda \rangle)
    \\
    & = \text{rev}(t) \cdot \text{rev}(s) \ \ \ \ \ \ \ \ \ \ \ \ \ \  \
    $$
    ​	This proves that $P(s)$ holds as required, completing the constructor case, By structural induction we conclude that $P(s)$ holds for all strings $s \in A^*$.