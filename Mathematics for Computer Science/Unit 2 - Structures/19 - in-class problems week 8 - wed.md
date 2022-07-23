# In-Class Problems Week 8, Wed.

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/3fe4ea512400d98130a87a16f52de982/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp19.pdf).

## Problem 1

* **a)** Comment on the following claim. “Since we’re assuming that each encounter involves one man and one woman, the average numbers should be the same, so the males must be exaggerating.”

  * Totally false, as the average difference of encounters is proportional to ratio men/women;

* **b)** For what constant $c$ is $m = c \cdot f$?
  $$
  \text{avg}(M) m & = & \text{avg}(F)f \\
  m & = & \frac{\text{avg}(F)}{\text{avg}(M)}f \\
  m & = & \frac{1}{1.1} f \\
  m & = & 0.9091 f
  $$
  ​	$c \approx 0,9091$.

* **c)**  The data shows that approximately 20% of the females were virgins, while only 5% of the males were. The researcher wonders how excluding virgins from the population would change the averages. If he knew graph theory, the researcher would realize that the nonvirgin male average number of partners will be $x(f/m)$ times the nonvirgin female average number of partners. What is $x$?

  The sum of degree of nonvirgin male and female must be the same, as the virgins don't count up to it:
  $$
  \sum \text{deg}(m_{nv}) = \sum \text{deg}(f_{nv})
  $$
  To get the average, we divide each side per $m_{nv}f_{nv}$:
  $$
  \text{adeg}(m_{nv}) = \frac{f_{nv}}{m_{nv}} \text{adeg}(f_{nv})
  $$
  Was stated that
  $$
  \text{adeg}(m_{nv}) = x \frac{f}{m} \text{adeg}(f_{nv})
  $$
  Then $x$ is
  $$
  x \frac{f}{m} & = & \frac{f_{nv}}{m_{nv}} \\
  x & = & \frac{m}{m_{nv}} \frac{f{nv}}{f} \\
  x & = & \frac{0.8}{0.95} \\
  x & = & \frac{16}{19} \\
  x & \approx & 0.8421 
  $$
  

* **d)** For purposes of further research, it would be helpful to pair each female in the group with a unique male in the group. Explain why this is not possible.

  * As we have more female than males;

## Problem 2

* **a)** Prove that in every simple graph, there are an even number of vertices of odd degree.

  **Proof.** We prove by induction that in every simple graph, there are an even number of vertices of odd degree.

  The sum of degree must be even and the sum of even odd numbers gives a even number, there are must exist an even number of vertices of odd degree.

* **b)** Conclude that at a party where some people shake hands, the number of people who shake hands an odd number of times is an even number. 

  * As a party where some people shake hands is a simple graph an the number of shake hands of a person is its degree, the number of people who shake hands an odd number of times is an even number;

* **c)** Call a sequence of people at the party a handshake sequence if each person in the sequence has shaken hands with the next person, if any, in the sequence.

  Suppose George was at the party and has shaken hands with an odd number of people. Explain why, starting with George, there must be a handshake sequence ending with a different person who has shaken an odd number of hands.

  **Answer** Because a sequence stops with a person who cannot shake hand with a next one, so this one has shook hands with only one other person, there it has shook hands an odd number of times.

## Problem 3

List all the isomorphisms between the two graphs given in Figure 1. Explain why there are no others

* Number of vertices;
* Number of edges;
* Degree of the nodes;
* Sum of degree of the nodes;
* Paths;
* Cycles;
* No matter which edge is removed, there is a path between any two vertices.

There no others, as there are any property which can form a bijection; 

## Problem 4

* Properties preserved under isomorphism:

  * **a)** The vertices can be numbered 1 through 7.

  * **b)** There is a cycle that includes all the vertices;

  * **c)** There are two degree 8 vertices;

  * **e)** No matter which edge is removed, there is a path between any two vertices.

  * **f)** There are two cycles that do not share any vertices.

  * **i)** The OR of two properties that are preserved under isomorphism.

  * **j)** The negation of a property that is preserved under isomorphism.

    

* Properties not preserved under isomorphism:

  * **d)** Two edges are of equal length
  * **g)** One vertex is a subset of another one.
  * **h)** The graph can be pictured in a way that all the edges have the same length.

## Problem 5

* **a)** Suppose $f$ is an isomorphism from $G$ to another digraph $H$. Prove that $f(G(v)) = H(f(v))$;

  $f$ is a bijection from $G$ to $H$, 

  such that, for all $u, v \in V(G)$,
  $$
  \langle u - v \rangle \iff \langle f(u) - f(v) \rangle \in E(H)
  $$
  $G(v)$ are the vertices that $v$ is pointing to in $G$ and $H(v)$ are the vertices that $v$ is pointing to in $H$.

   $f(G(v)) = H(f(v))$ means that every node from $G(v)$ can be mapped to every node of $H(f(v))$, where $f(v)$ returns a node;

  As
  $$
  u, v \in V(G),\langle u - v \rangle \iff \langle f(u) - f(v) \rangle \in E(H) \\
  $$
  Then
  $$
  u \in G(v) \iff f(u) \in H(f(v))
  $$
  So
  $$
  f(u) \in f(G(v)) \iff f(u) \in H(f(v))
  $$
  Therefore for every $h \in V(H)$:
  $$
  h \in H(f(v)) \iff h \in f(G(v)) \\
  $$
  Which means $f(G(v)) = H(f(v))$.

* **b)** Conclude that if $G$ and $H$ are isomorphic graphs, then they have the same number of vertices of out-degree $k$, for all $k \in \N$.

  As they are isomorphic graphs we now that  $f(G(v)) = H(f(v))$, which means that  $|f(G(v))| = |H(f(v))|$, therefore they must posses the same number of vertices of out-degree $k$, for all $k \in \N$.

  

