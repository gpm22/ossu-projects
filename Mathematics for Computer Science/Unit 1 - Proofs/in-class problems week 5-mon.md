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

* **a)** Use structural induction to prove that $\text{RecMatch } \subseteq \text{ Erasable}$.

  * **Definition of RecMatch**:

    * **Base Case**: $\lambda \in \text{RecMatch}$.
    * **Constructor Case:** If $s, t \in \text{RecMatch}$, then $[s]t \in \text{RecMatch}$.

  * **Answer**:

    * We prove by structural induction that $\text{RecMatch } \subseteq \text{ Erasable}$.

    * **Induction Hypothesis:** $P(s) ::= \forall s \in \text{RecMatch} \Rightarrow s \in \text{Erasable}$

    * **Base Case**: $P(\lambda)$ holds, as $\lambda \in \text{Erasable}$.

    * **Constructor Case**: Assuming that $P(t)$ holds, we have to prove that $P([s]t)$ holds. To prove it we have to prove that $[s]t \in \text{Erasable}$:
      $$
      [s]t \rightarrow t
      $$
      as $P(t)$ holds, so $t \rightarrow \lambda$ and therefore $P([s]t)$ holds. So $\text{RecMatch } \subseteq \text{ Erasable}$.

* **b)** Supply yhe missing parts of the following proof that $\text{Erasable } \subseteq \text{ RecMatch}$:

  * **Proof**. We Prove by strong induction that every length $n$ string in **Erasable** is also in **RecMatch**. The induction hypothesis is
    $$
    P(n) ::= \forall x \in \text{Erasable. } |x| = n \Rightarrow x \in \text{RecMatch}
    $$

  * **Base case**: $P(0)$ holds, as $\lambda$, which has $|\lambda| = 0$, is in both Erasable and RecMatch.

  * **Inductive step**: To prove $P(n + 1)$, suppose $|x| = n + 1$ and $x \in \text{Erasable}$. We need to show that $x \in \text{RecMatch}$.

    Let's say that a string $y$ is an $erase$ of a string $z$ iff $y$ is the result of erasing a **single** occurrence of $p$ in $z$.

    Since $x \in \text{Erasable}$ and has positive length, there must be an erase, $y \in \text{Erasable}$, of $x$. So $|y| = n-1 \geq 0$, and since $y \in \text{Erasable}$, we may assume by induction hypothesis that $y \in \text{RecMatch}$.

    Now we argue by cases:

    *  **Case ($y$ is $\lambda$)**:

      As the base case shows, $\lambda \in \text{RecMatch}$, so $x$ will be a string with 2 characters, the only one possible is $[] = [\lambda]\lambda$, therefore $x \in RecMatch$.

    * **Case ($y = [s]t$ for some string $s, t \in \text{RecMatch}$)**: Now we argue by subcases.

      * **Subcase($x=py$)**:

        By the definition of $y$, $p$ must be in RecMatch. So as both $y$ and $p$ are in RecMatch, so is $x$.

      * **Subcase($x$ is of the form $[s']t$ where $s$ is an erase of $s'$)**:

        Since $s \in \text{RecMatch}$, it is erasable by part **b)**, which implies that $s' \in \text{Erasable}$. But $|s'| < |x|$, so by induction hypothesis, we may assume that $s' \in \text{RecMatch}$. This shows that $x$ is the result of the constructor step of RecMatch, and therefore $x \in RecMatch$.

      * **Subcase($x$ is of the form $[s]t'$ where $t$ is an erase of $t'$)**:

        Since $t \in \text{RecMatch}$, it is erasable by part **b)**, which implies that $t' \in \text{Erasable}$. But $|t'| < |x|$, so by induction hypothesis, we may assume that $t' \in \text{RecMatch}$. This shows that $x$ is the result of the constructor step of RecMatch, and therefore $x \in RecMatch$.

    The above cases are sufficient, as they cover all possible situations.

    This completes the proof by strong induction on $n$, so we conclude that $P(n)$ holds for all $n \in \N$. Therefore $x \in \text{RecMatch}$ for every string $x \in \text{Erasable}$. That is, $\text{Erasable} \subseteq \text{Recmatch}$. Combined with part **a)**, we conclude that 
    $$
    \text{Erasable = RecMatch}
    $$

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

**Definition.** The recursive data type, binary-2PTG, of *binary trees* with leaf labels, $L$, is defined recursively as follows:

* **Base Case:** $\langle \text{leaf}, l \rangle \in \text{binary-2PTG}$, for all labels $l \in L$.
* **Constructor case:** If $G_1, G_2 \in \text{binary-2PTG}$, then $\langle \text{bintree}, G_1, G_2 \rangle \in \text{binary-2PTG}$

The size, $|G|$, of $G \in \text{binary-2PTG}$ is defined recursively on this definition by:

* **Base Case:** $| \langle \text{leaf}, l \rangle | ::= 1, \quad \text{ for all } l \in L$.
* **Constructor Case:** $| \langle \text{bintree}, G_1, G_2 \rangle | ::= |G_1| + |G_2| + 1$

* **a)** Write out the binary-2PTG, $G$, pictured in Figure 1.

  * $\langle G, \langle G_1, win, \langle G_{1,2}, lose, win \rangle \rangle, win \rangle$ 

* **b)** The value of $\text{flatten}(G)$ for $G \in \text{binary-2PTG}$ is the sequence of labels in $L$ of the leaves of $G$. For example, for binary-2PTG, $G$, Pictured in Figure 1,
  $$
  \text{flatten}(G) = (win, lose, win, win)
  $$
  Give a recursive definition of flatten.

  * **Base Case**: $\text{flatten}(\langle \text{leaf}, l \rangle) = (l), \quad \text{ for all } l \in L$
  * **Constructor Case**: $\text{flatten}(\langle \text{bintree}, G_1, G_2 \rangle) = \text{flatten}(G_1) \cdot \text{flatten}(G_2) $ 

* **c)** Prove by structural induction on the definitions of flatten and size that $2 \cdot \text{length}(\text{flatten}(G)) = |G| + 1$

  **Proof.** We prove by structural induction that $2 \cdot \text{length}(\text{flatten}(G)) = |G| + 1$.

  **Induction Hypothesis**: $P(G) ::= [ 2 \cdot \text{length}(\text{flatten}(G)) = |G| + 1]$

  **Base Case**: 
  $$
  P( \langle \text{leaf}, l \rangle ) & = [ 2 \cdot \text{length}(\text{flatten}(\langle \text{leaf}, l \rangle)) = |\langle \text{leaf}, l \rangle| + 1]
  \\
  & = [ 2 \cdot \text{length}((l)) = 1 + 1] \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
  \\
  & = [ 2 \cdot 1 = 2] \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 
  \\
  & = [ 2 = 2] \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 
  \\
  & = \text{true} \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
  $$
  Then $P( \langle \text{leaf}, l \rangle )$ holds.

  **Constructor Case**:

  Assuming that $P(G_1)$ and $P(G_2)$ hold:
  $$
  P( \langle \text{bintree}, G_1, G_2 \rangle) & = [ 2 \cdot \text{length}(\text{flatten}(\langle \text{bintree}, G_1, G_2 \rangle)) = |\langle \text{bintree}, G_1, G_2 \rangle| + 1] \ \ \ \ \ \ \ \
  \\ 
  & = [ 2 \cdot \text{length}(\text{flatten}(G_1) \cdot \text{flatten}(G_2))) = |G_1| + |G_2| + 1 + 1] \ \ \ \ \ \ \ \ \ \ \  \  \
  \\
  & = [ 2(\text{length}(\text{flatten}(G_1))) + 2(\text{length}(\text{flatten}(G_2))) = |G_1| + |G_2| + 2]
  \\
  $$
  As we assumed that  $P(G_1)$ and $P(G_2)$ hold:
  $$
  P( \langle \text{bintree}, G_1, G_2 \rangle) & =  [|G_1| + 1 + |G_2| + 1 = |G_1| + |G_2| + 2]
  \\
  & = [|G_1| + |G_2| + 2 = |G_1| + |G_2| + 2] \ \ \ \ \ \ \
  $$
  Therefore $P( \langle \text{bintree}, G_1, G_2 \rangle)$ holds.

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