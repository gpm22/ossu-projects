# 0 Introduction

## Exercises 

### 0.1

1. $\{1, 3, 5, 7, \dots\}$
   - Set with all natural odd numbers.
2. $\{\dots, -4, -2, 0, 2, 4, \dots\}$
   - Set of all even numbers.
3. $\{n | n=2m \text{ for some } m \in \N \}$
   - Set of all natural even numbers. 
4. $\{n | n=2m \text{ for some } m \in \N, \text{ and } n=3k \text{ for some } k \in \N \}$
   - Set of all natural numbers that are multiples of 6.
5. $\{ w | w \text{ is a string of 0s and 1s and } w \text{ equals the reverse of } w \}$
   - Set of all palindromes of the strings of 0 and 1.
6. $\{ n | n \text{ is an integer and } n = n + 1 \}$
   - Condition false for every integer, hence $\empty$

### 0.2

1. The set containing the numbers 1, 10, and 100
   $$
   \{1, 10, 100\}
   $$

2. The set containing all integers that are greater than 5
   $$
   \{n | n \in \Z \and n > 5 \}
   $$
   
3. The set containing all natural numbers that are less than 5
   $$
   \{n | n \in \N \and n < 5 \}
   $$
   Or
   $$
   \{0, 1, 2, 3, 4 \}
   $$
   
4. The set containing the string `aba`
   $$
   \{\text{aba}\}
   $$
   
5. The set containing the empty string
   $$
   \{\text{""}\}
   $$
   
6. The set containing nothing at all.
   $$
   \empty
   $$
   or
   $$
   \{\}
   $$

### 0.3

Let $A$ be the set $\{x, y, z\}$ and $B$ be the set $\{x, y\}$.

1. Is $A$ a subset of $B$?

   - No

2. Is $B$ a subset of $A$?

   - Yes

3. What is $A ∪ B$?

   - $A$

4. What is $A ∩ B$?

   - $B$

5. What is $A × B$?
   $$
   \{(x, x), (x, y), (y, x), (y, y), (z, x), (z, y)\}
   $$

6. What is the power set of $B$?
   $$
   \{\{x, y\}, \{x\}, \{y\}, \empty\}
   $$
   

### 0.4

$A \times B$ has $ab$ elements, because each element of $A$ will create a pair with each element of $B$, thus resulting in $b$ pairs for each element of $a$, therefore a total of $ab$ elements.

### 0.5

The powerset of a set contains all possible sets of its elements, including itself and $\empty$.

Each element in the original set is either present or not in a subset.

For a set $C$ with $c$ elements there are subsets of $c$ different sizes, from $c$ to 0.

Thus we have $\prod _1^c 2 = 2^c$ elements.

### 0.6

1. What is the value of $f(2)$?
   - 7
2. What are the range and domain of $f$?
   - The range of $f$ is $Y$
   - The domain is $X$
3. What is the value of $g(2, 10)$?
   - 6
4. What are the range and domain of $g$?
   - The range is $Y$
   - The domain is $X \times Y$.
5. What is the value of $g(4, f (4))$?
   - $f(4)$ is 7, therefore $g(4, f(4)) = g(4, 7) = 8$.

### 0.7

1. Reflexive and symmetric but not transitive
   - **Reciprocal tolerance,** as:
     - It is reflexive, everyone tolerates themselves.
     - It is symmetric, if $a$ tolerates $b$, $b$ tolerates $a$.
     - It is NOT transitive, because $a$ tolerating $b$, and $b$ tolerating $c$ does not imply $a$ tolerating $c$.
2. Reflexive and transitive but not symmetric
   - Being a **multiple**, as:
     - It is reflexive, because any number is a multiple of itself.
     - it is NOT symmetric, because $a$ being multiple $b$ impedes $b$ of being a multiple of $a$. 
     - It is transitive, because if $a$ is a multiple of $b$ and $b$ is a multiple of $c$, $a$ must also be a multiple of $c$.
3. Symmetric and transitive but not reflexive
   - To be a sibling with someone of the same parents that only have children together.
     - It is NOT reflexive, because you are not a sibling of yourself.
     - It is symmetric, because if $a$ is a sibling of $b$, $b$ is a sibling of $a$.
     - It is transitive, because if $a$ is a sibling of $b$, $b$ is a sibling of $c$, $a$ must be a sibling of $c$.

### 0.8

- The graph is

  ```
  1 ---- 2 
  |  \ / |
  |  / \ |
  3      4
  ```

- The degrees are:

  | Node | Degree |
  | ---- | ------ |
  | 1    | 3      |
  | 2    | 3      |
  | 3    | 2      |
  | 4    | 2      |

- Path from 3 to 4

  ```
  1      2 
       / |
     /   |
  3      4
  ```

### 0.9

- The vertex are 
  $$
  V = \{1, 2, 3, 4, 5, 6\}
  $$

- The edges are
  $$
  E = \{ \{1, 4\}, \{1, 5\}, \{1, 6\}, \{2, 4\}, \{2, 5\}, \{2, 6\}, \{3, 4\}, \{3, 5\}, \{3, 6\},  \}
  $$

## Problems

### 0.10

The error is that if $a$ and $b$ are 1, then $(a - b) = 0$, so the step of dividing each side by $(a - b)$ is an error, because division by 0 is undefined.

### 0.11

$S(N) = \sum_{i=1}^n i$.

$C(N) = \sum_{i=1}^n i³$.

1. Prove that $S(n) = \frac n2 (n+1)$

   **Claim**: $\sum_{i=1}^n i = \frac n 2 (n + 1)$

   **Basis**: for $n=1$, $\sum_{i=1}^1 i = 1$ and $\frac 1 2 (1 + 1) = \frac 2 2 = 1$.

   Thus it holds.

   **Induction Step**: We assume that the claim is true for $n = k$ and we prove that the claim is true for $n = k + 1$.

   We can see that for the left side:
   $$
   \begin{align}
   S(n+1) &= \sum_{i=1}^{n+1} i \\
          &= \sum_{i=1}^{n} i + n + 1 \\
          &= S(n) + n+1
   \end{align}
   $$
   

   Thus for the right side:
   $$
   \begin{align}
   S(n+1) &= \frac {(n+1)}2 ((n+1)+1)  \\
          &= \frac 12 ((n+1)^2+(n+1)) \\
          &= \frac 12 ((n^2 + 2n + 1)+(n+1)) \\
          &= \frac 12 ((n^2+n) + (2n + 2) ) \\
          &= \frac {(n^2+n)} 2 + \frac {2n + 2}2 \\
          &= \frac n2 (n+1) + n + 1 \\
          &= S(n) + n + 1
   \end{align}
   $$
   Therefore 
   $$
   \sum_{i=1}^n i = \frac n 2 (n + 1)
   $$

2. Prove that $C(n) = \frac {(n^4 + 2n^3 + n^2)}4 = \frac {n^2}4 (n+1)^2$

   **Claim**: $\sum_{i=1}^n i^3 = \frac {n^2}4 (n+1)^2$.

   **Basis**: For $n=1$, $\sum_{i=1}^1 i³ = 1$, $\frac {1^2}4 (1+1)^2 = \frac 14(2)^2 = \frac 44 = 1$.

   Therefore it holds.

   **Induction step:** We assume that the claim is true for $n = k$ and we prove that the claim is true for $n = k + 1$.

   We can see that for the left side:
   $$
   \begin{align}
   C(n+1) &= \sum_{i=1}^{n+1} i ^ 3 \\
          &= \sum_{i=1}^{n} i ^3 + (n+1) ^3 \\
          &= C(n) + (n+1)^3
   \end{align}
   $$
   Thus for the right side:
   $$
   \begin{align}
   C(n+1) &= \frac {(n+1)^2}4 ((n+1)+1)^2  \\
          &= \frac 14 ((n+1)^2+(n+1))^2 \\
          &= \frac 14 ((n+1)^4 + 2(n+1)^3 + (n+1)^2 ) \\
          &= \frac 14 (n+1)^2((n+1)^2 + 2(n+1) + 1) \\
          &= \frac 14 (n^2+2n+1)(n^2+2n+1 +2n + 2 + 1) \\
          &= \frac 14 (n^2+2n+1)(n^2+4n+4) \\
          &= \frac 14 (n^4 + 4n^3 + 4n^2 + 2n^3 +  8n^2 + 8n + n^2 + 4n + 4) \\
          &= \frac 14 (n^4 + 6n^3 + 13n^2 + 12 n + 4) \\
          &= \frac 14 (n^4 + 2n^3 + n^2) + \frac 14 (4n^3+12n^2+12n+4) \\
          &= \frac {n^2}4 (n^2 + 2n + 1) + \frac 44 (n^3+3n^2+3n+1) \\
          &= \frac {n^2}4 (n+1)^2 + \frac 44 (n^3+3n^2+3n+1) \\
          &= \frac {n^2}4 (n+1)^2 + (n^2+2n+1)(n+1) \\
          &= \frac {n^2}4 (n+1)^2 + (n+1)^3 \\
          &= C(n) + (n+1)^3
   \end{align}
   $$
   Therefore 
   $$
   \sum_{i=1}^n i^3 = \frac {n^2}4 (n+1)^2
   $$

3. We can than conclude that 
   $$
   \begin{align}
   C(n) &= \frac {n^2}4 (n+1)^2 \\
        &= \left( \frac {n(n+1)}4 \right)^2 \\
        &= S(n)^2
   \end{align}
   $$
   

### 0.12

The error is that it does not prove for $h = k+1$ any time, it only do for $h = k$, where it assumed to be true.

### 0.13

We use **induction** to prove that for any graph with two or more nodes, there are at least two nodes that have equal degrees.

**Basis**: For a graph with $v = 2$ nodes it is trivial to see that the claim holds, because for the case without edges both vertex have degree 0, while in the case with a edge, both vertex have degree 1.

**Induction Step**: We assume that for any graph with $v > n$ nodes it holds and we show that it holds also for $v = n$,

Let's $G_{n+1}$ a graph with $n+1$ nodes and we will build $G_n$, a graph with $n$ nodes, from it by removing a node.

This can create three different cases:

1. **$G_{n+1}$ has a vertex $v$ of degree $0$.**

   Then we can simply remove $v$, which results in a graph with $n$ vertex holding the same degree, so the claim holds for this case, as we assumed it holds for $G_{n+1}$ .

2. **$G_{n+1}$ has a vertex $v$ of degree $n$.**

   Removing $v$ will decrease the degree by 1 for all the remaining nodes in $G_n$. So it holds for this case too.

3. **$G_{n+1}$ has no vertex $v$ of degree $0$ or $n$.**

   Then we remove a random node, which results in $G_n$, where every node has a degree in the set $\{1, 2, \dots, n-2 \}$. As $G_{n}$ has $n$ vertices, but the degree set only contains $n-2$ values, by the pigeonhole principle, at least two vertices have the same degree. 

Every case is covered, therefore it is proved that for any graph with two or more nodes, there are at least two nodes that have equal degrees.

### 0.14

### 0.15
