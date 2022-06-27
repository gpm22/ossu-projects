# Problem Set 6

Question available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/e7a8627591b7b40654882c4978223322/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_ps6.pdf).

## Problem 1

Estimate the fraction of messages in $[0..n)$ that are dangerous to the nearest order of magnitude.

The number os numbers relatively prime to $n$ is $\phi(n) = (p-1)(q-1)$, so the number of dangerous messages is $n-\phi(n) -1$, therefore the fractions of dangerous numbers is
$$
\frac{n-\phi(n)-1}{n-1} & = & \frac{pq-(p-1)(q-1)-1}{pq-1} \\
& = & \frac{pq-1-(pq-p-q+1) }{pq-1} \\
& = & \frac{pq-1-pq+p+q-1 }{pq-1} \\
& = & \frac{p+q-2 }{pq-1} \\
& = & \frac{10^{200}+10^{200}}{10^{200} \cdot 10^{200}} \\
& \approx & \frac{10^{200}}{10^{400}} \\
& \approx & 10^{-200} 
$$


## Problem 2

* **a)** Given an example of a digraph with two vertices $u \neq v$ such that there is a path from $u$ to $v$ and also a path from $v$ to $u$, but no cycle containing both $u$ and $v$.
  * If they are connected only by a intermediary node.
* **b)** A close walk is walk that starts in finishes at the same node, but it can pass through other nodes more than once. So to transform a close walk in a cycle you only need to exclude the parts the pass through nodes more than once, therefore if there is a positive length walk in digraph that starts and ends at node $v$, then there is a cycle that contains $v$.

## Problem 3

Suppose that there are n chickens in a farmyard. In particular, for each pair of distinct chickens, either the first pecks the second or the second pecks the first, but not both. We say that chicken $u$ virtually pecks chicken $v$ if either: 

* Chicken $u$ directly pecks chicken $v$, or
* Chicken $u$ pecks some other chicken $w$ who in turn pecks chicken $v$. 

A chicken that virtually pecks every other chicken is called a **king chicken**. In general, a **tournament digraph** is a digraph with exactly one edge between each pair of distinct vertices. 

* **a)** Define a 10-chicken tournament graph with a king chicken that has outdegree 1.

  * A king chicken that has outdegree 1 must have only pecked a chicken which has pecked the other n-2 chickens. The king chicken also must have been pecked by the other n-2 chickens. The relation of the other n-2 chickens with themselves is irrelevant.

* **b)** Describe a 5-chicken tournament graph in which every player is a king. 

  * Each chicken must peck the next chicken and the one who pecks who pecked it:
    $$
    V(G) & ::=&  \{a, b, c, d ,e \} \ \ \ \ \ \ \ \ \ \ \  \\ \\
    E(G) & ::= & \{ \langle a \to b \rangle, \langle a \to d \rangle,  \\ & & \ \ \langle b \to c \rangle, \langle b \to e \rangle, \\ & & \ \ \langle c \to d \rangle, \langle c \to a \rangle, \\ & & \ \ \langle d \to e \rangle, \langle d \to b \rangle, \\ & & \ \ \langle e \to a \rangle, \langle e \to c \rangle \} \\
    $$

* **c)** Prove that the chicken with the largest outdegree in an n-chicken tournament is a king.

  It is assumed that the chicken with the largest outdegree is a king, as it was being virtually pecking the chickens which are directly pecking it.

  To prove that assumption we use proof by contradiction.

  So let's assume that exist a chicken with largest outdegree and is not a king, so at least one chicken which is pecking it is not being pecked by chicken pecked by it.

  Let suppose that the chicken with the largest outdegree has a outdegree of $n-x-1$, so it pecks $n-x-1$ and is pecked by $x$, so at least one of the $x$ chickens cannot be pecked by the other $n-x-1$ chickens.

  To that be possible that one chicken would have to peck the chicken with the largest outdegree and the other $n-x-1$ chickens, so this new chicken would have the largest outdegree.

  So we arrive at a contradiction, therefore it is impossible for a chicken not be a king if it has the largest outdegree.

  Therefore, the chicken with the largest outdegree in an n-chicken tournament is a king.

