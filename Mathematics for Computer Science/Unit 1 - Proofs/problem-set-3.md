# Problem Set 3

Questions available in [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/004582165ee7e142a378192196660420/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_ps3.pdf).

## Problem 1

Prove, using strong induction, the following closed-form formula for $F_n$.
$$
F_n = \frac{p^n-q^n}{\sqrt{5}} \ \ \ \ \ (1)
$$
Where $p = \frac{1+\sqrt{5}}{2}$ and  $q = \frac{1-\sqrt{5}}{2}$.

**Proof.** We use proof by strong induction that the closed-form formula holds for all $n \geq 0$.

**Induction Hypothesis**: $P(n) ::= F_n = \frac{p^n-q^n}{\sqrt{5}} \text{ is equivalent to } F_n = \begin{cases}  0 & \quad \text{if } n = 0 \\ 1 & \quad \text{if } n = 1 \\ F_{n-1} + F_{n-2} & \quad \text{if } n > 1 \end{cases}$

**Base case**: $P(0) = 0 \text{ is equivalent to } 0$, then it is **true**.

**Induction Step**: Assuming that $\forall k \leq n\ P(k)$ is true, lets take $P(n+1) $:
$$
P(n+1) = F_{n+1} = \frac{p^{n+1}-q^{n+1}}{\sqrt{5}} \text{ is equivalent to } F_{n} + F_{n-1}
\\\\
F_{n+1} = \frac{p^{n+1}-q^{n+1}}{\sqrt{5}} = \frac{p^{n}-q^{n}}{\sqrt{5}} + \frac{p^{n-1}-q^{n-1}}{\sqrt{5}}
\\\\
p^{n+1}-q^{n+1} = p^{n}-q^{n}+ p^{n-1}-q^{n-1} \ \ \ \ \ \ (2)
$$
If the relation (2) is true, then:
$$
p^2 = p + 1 \text{ and } q^2 = q + 1 \ \ \ \ (3)
$$
So now we have to verify if this is true by apply their values to equations (3). For $p$:
$$
(\frac{1+\sqrt{5}}{2})^2 = \frac{1+\sqrt{5}}{2} + 1
\\\\
\frac{1+2\sqrt{5}+5}{4} = \frac{1+\sqrt{5}}{2} + 1
\\\\
1+2\sqrt{5}+5 = 2+2\sqrt{5} + 4
\\\\
6 = 6
$$
For $q$:
$$
(\frac{1-\sqrt{5}}{2})^2 = \frac{1-\sqrt{5}}{2} + 1
\\\\
\frac{1-2\sqrt{5}+5}{4} = \frac{1-\sqrt{5}}{2} + 1
\\\\
1-2\sqrt{5}+5 = 2 - 2\sqrt{5} + 4
\\\\
6 = 6
$$
As equations (3) are true, then $P(n+1)$ holds. So, equation (1) is indeed equivalent to the Fibonacci numbers.

## Problem 2

​	Define the *potential*, $p(S)$, of a stack of blocks, $S$, to be $k(k - 1)/2$ where $k$ is the number of blocks in $S$. Define the potential, $p(A)$, of a set of stacks, $A$, to be the sum of the potentials of the stacks in $A$. Show that for any set of stacks, $A$, if a sequence of moves starting with $A$ leads to another set of stacks, $B$, then $p(A) \geq  p(B)$, and the score for this sequence of moves is $p(A)-p(B)$.

**Answer** 

​	**Proof.** We prove by strong induction that for any set of stacks, $A$, if a sequence of moves starting with $A$ leads to another set of stacks, $B$, then $p(A) \geq  p(B)$.

​	**Induction Hypothesis**: $P(n) ::=$ $p(A) \geq  p(B)$ for a sequence of moves, $n$, from $A$ to $B$, for all $n \geq 0$.

​	**Base case**: $P(0) = p(A) = p(B)$. As there are no moves, $B$ is equal to $A$, so $P(0)$ is **true**.

​	**Induction Step**: Assuming that  $\forall k \leq n\ P(k)$ is **true** and it is from $A$ to $B$, lets take $P(n+1)$ to be from $A$ to $C$. So $P(1)$ is from $B$ to $C$. By the strong assumption, $p(A) \geq p(B)$ and $p(B) \geq p(C)$, so $p(A) \geq p(C)$, then $P(n+1)$ holds.

​	**Corollary**: The score of a sequence of moves, $n$, is  $\text{score}(n) = p(A) - p(B)$.

​	**Proof**. We prove by strong induction that the score of a sequence of moves, $n$, is  $\text{score}(n) = p(A) - p(B)$, for all $n \geq 0$.

​	**Induction Hypothesis:** $P(n) ::= \text{score}(n) = p(A) - p(B)$, for all $n \geq 0$.

​	**Base case**: $P(0) = \text{score}(0) = 0$. This is true, as $p(A) = p(B)$.

​	**Induction Step:** As we can only divide a stack for each movement, the score of $n$ movements will be the sum of the scores of each movement. So, by proving for a unique movement, we also prove for $n$ movements.

​	We prove that $\text{score}(1) = p(A) - p(B)$.

​	Considering the set $A$ to be $\{k_1, k_2, ..., k_n \}$, for all $n \geq 0$. $p(a)$ is
$$
p(A) = k_1(k_1-1)/2 + k_2(k_2-1)/2 + ... k_n(k_n-1)/2
$$
​	Making a move, where we divided the stack $k_1$ in stacks $i$ and $j$, where $k_1 = i + j$ and the score is $ij$. The set $B$ is $\{i, j, k_2, ..., k_n\}$, so $p(B)$ is:
$$
p(B) = j(j-1)/2 + i(i-1)/2 + k_2(k_2-1)/2 + ... k_n(k_n-1)/2
$$
​	Then, $p(A) - p(B)$ is:
$$
p(A) - p(B) = k_1(k_1-1)/2 - j(j-1)/2 - i(i-1)/2 + (k_2(k_2-1)/2 + ... k_n(k_n-1)/2) - (k_2(k_2-1)/2 + ... k_n(k_n-1)/2)
\\\\
p(A) - p(B) = k_1(k_1-1)/2 - j(j-1)/2 - i(i-1)/2
\\\\
p(A) - p(B) = \frac{k^2-k - j^2+j - i^2+i}{2}
$$
​	As $k_1 = i + j$:
$$
p(A) - p(B) = \frac{(i+j)^2-k + k - j^2 - i^2}{2}
\\\\
p(A) - p(B) = \frac{i^2+2ij+j^2-j^2 - i^2}{2}
\\\\
p(A) - p(B) = \frac{2ij}{2}
\\\\
p(A) - p(B) = ij
$$
So, for a move, the score is $p(A)-p(B)$, then $\text{score}(1) = p(A)-p(B)$. So $P(1)$ holds and as result $\forall m \geq 0.\ P(m)$ holds.

## Problem 3

Let $A$, $B$, and $C$ be sets, and let $f : B \rightarrow C$ and $g : A \rightarrow B$ be functions. Let $h : A \rightarrow C$ be the composition $f \circ g$, that is, $h(x) ::= f(g(x))$ for $x \in A$. Prove or disprove the following claims:

* **a)** If $h$ is surjective, then $f$ must be surjective.

  This is **true**, as all elements of $C$ must have a pair in graph(h) and graph(f).

* **b)** If $h$ is surjective, then $g$ must be surjective.

  This is **false**, as all elements of $C$ must have a pair in graph(h) and graph(f), but there is nothing about **B**.

* **c)** If $h$ is injective, then $f$ must be injective.

  This is **true**, as all elements of $C$ must have at most a pair in graph(h) and graph(f).

* **d)** If $h$ is injective and $f$ is total, then $g$ must be injective.

  This is **false**.

