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

