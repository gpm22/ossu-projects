# Problem Set 4

Questions available in [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/7e8bf62d56dd415c1fa86a453c337574/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_ps4.pdf).

## Problem 1

A robot moves on the two-dimensional integer grid. It starts out at $(0, 0)$ and is allowed to move in any of these four ways:

1. $(+2, -1)$: right 2, down 1
2. $(-2, +1)$: left 2, up 1
3. $(+1, +3)$
4. $(-1, -3)$

Prove that this robot can never reach $(1, 1)$.

**Answer:**

**Proof.** We prove by Structure Induction that the robot can never reach (1, 1).

**Induction Hypothesis**: $P((x, y)) ::= x = y \Rightarrow 7|x$ 

**Starte State**: $P((0, 0))$ holds, as $7|0$.

**Constructor Cases:**

* $(x, y) \rightarrow (x+2, y-1)$
  * Assume that $P((x, y))$ holds and for proof by contradiction, assume that $x+2=y-1$ and $ 7 | x + 2$ so that $P((x+2), (y-1))$ not holds.
  * As $y = x + 3$,  in order not to $P((x+2), (y-1))$ hold must be a way to walk $(x+3, y)$ or $(x, y-3)$, but that is not possible.
  * So $x+2 \neq y-1$ and $P((x+2), (y-1))$ holds.
* $(x, y) \rightarrow (x-2, y+1)$
  * Assume that $P((x, y))$ holds and for proof by contradiction, assume that $x-2=y+1$ and $ 7 | x - 2$ so that $P((x-2), (y+1))$ not holds.
  * As $y = x - 3$,  in order not to $P((x-2), (y+1))$ hold must be a way to walk $(x-3, y)$ or $(x, y+3)$, but that is not possible.
  * So $x-2 \neq y+1$ and $P((x-2), (y+1))$ holds.
* $(x, y) \rightarrow (x+1, y+3)$
  * Assume that $P((x, y))$ holds and for proof by contradiction, assume that $x+1=y+3$ and $ 7 | x + 1$ so that $P((x+1), (y+3))$ not holds.
  * As $y = x - 2$,  in order not to $P((x+1), (y+3))$ hold must be a way to walk $(x-2, y)$ or $(x, y+2)$, but that is not possible.
  * So $x+1 \neq y+3$ and $P((x+1), (y+3))$ holds.
* $(x, y) \rightarrow (x-1, y-3)$
  * Assume that $P((x, y))$ holds and for proof by contradiction, assume that $x-1=y-3$ and $ 7 | x - 1$, so that $P((x-1), (y-3))$ not holds.
  * As $y = x + 2$,  in order not to $P((x-1), (y-3))$ hold must be a way to walk $(x+2, y)$ or $(x, y-2)$, but that is not possible.
  * So $x-1 \neq y-3$ and $P((x-1), (y-3))$ holds.

As $P((x, y))$ is an invariant, it is impossible to reach $(1, 1)$ as 1 is not divisible by 7.

## Problem 2

If $B$ is an LBT, let $n_B$ be the number of distinct internal-labels appearing in $B$ and $f_B$ be the number of distinct leaf labels of $B$. Prove by structural induction that 
$$
f_B = n_B + 1
$$
for all LBT’s $B$ with unique labels. This equation can obviously fail if labels are not unique, so your proof had better use uniqueness of labels at some point; be sure to indicate where. 

**ANSWER**

**Proof.** We prove by Structural Induction that $f_B = n_B + 1$ holds for all LBT’s $B$ with unique labels.

**Induction Hypothesis**: $P(B) ::= B \text{ is a LBT with unique labels } \Rightarrow f_B = n_B + 1$

**Base Case**: $P(\langle l, leaf \rangle) = \langle l, leaf \rangle \text{ is a LBT with unique labels } \Rightarrow f_{\langle l, leaf \rangle} = n_{\langle l, leaf \rangle} + 1$

By definition, the left part of $P$ is true, so we have to prove that the right part is also true.

As the set of internal-labels is the empty set :
$$
n_{\langle l, leaf \rangle} = |\empty| = 0
$$
As the set of leaf-labels is $\{l\}$, and $l$ is a unique element:
$$
f_{\langle l, leaf \rangle} = |\{ l \}| = 1
$$
Then
$$
f_{\langle l, leaf \rangle} = n_{\langle l, leaf \rangle} + 1
$$
Therefore $P(\langle l, leaf \rangle)$ holds.

**Constructor case**: $P(\langle l, B, C \rangle) = \langle l, B, C \rangle \text{ is a LBT with unique labels } \Rightarrow f_{\langle l, B, C \rangle} = n_{\langle l, B, C \rangle} + 1$

We assume that $P(B)$ and $P(C)$ holds, so the left part of $P(\langle l, B, C \rangle)$ holds by definition, so we have to prove that the right part is also true.

Defining $L(B) ::= \text{ set of leaf-labels of } B$ and $I(B) ::= \text{ set of internal-labels of } B$.

As $B$ and $C$ do not share labels.
$$
f_{\langle l, B, C \rangle} & = |L(B) \cup L(C)| 
\\ & = f_B + f_C \ \ \ \ \ \ \ \ \
$$
As $B$ and $C$ do not share labels and $l$ is not a label of $B$ or $C$.
$$
n_{\langle l, B, C \rangle} & = | \{l\}\ \cup\ I(B)\ \cup\ I(C)|
\\ & = 1 + n_B + n_C \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
$$
So
$$
f_{\langle l, B, C \rangle} & = & n_{\langle l, B, C \rangle} + 1 \ \ \ \ \ \ \ \ \ \
\\ f_B + f_C & = & 1 + n_B + n_C + 1
\\ n_B + n_C + 2 & = & n_B + n_C + 2 \ \ \ \ \ \
$$
Therefore $P$ holds for any LBT with unique labels.

## Problem 3

* **a)** Describe a bijection from $(0, 1]$ to $[0, \infty )$

  

  As $[0, \infty ) = (0, \infty ) \cup {0}$, $[0, \infty )$ and $(0, \infty )$ have the same size, so finding a bijection from $(0, 1]$ to $(0, \infty )$ will implies in a bijection from $(0, 1]$ to $[0, \infty )$.
  $$
  f : (0, 1] \rightarrow (0, \infty )      = x \rightarrow \{x, 1/x\}
  $$
  

* **b)**

* **c)**

* **d)**

* **e)**

* **f)**
