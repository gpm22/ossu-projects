# In-Class Problems Week 14, Wed.

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/f863f6e940b9300e427e6651b7d77168/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp35.pdf).

## Problem 1

* **a)** Find a stationary distribution for the random walk graph in Figure 1.

  * The graph is:

    * $V = \{x, y\}$
    * $E = \{\langle x \to y \rangle, \langle y \to x \rangle\}$
      * both with weight 1.

  * System:
    $$
    \Pr[\text{go to } x] = \frac {\Pr[\text{at } y] }{\text{outdegree}(y)} = \Pr[\text{go to } y] \\
    \Pr[\text{go to } y]  = \frac {\Pr[\text{at } x])}{\text{outdegree}(x)} = \Pr[\text{go to } x]\\
    \Pr[\text{at } x]  + \Pr[\text{at } y]  = 1
    $$
    

  * Therefore $\Pr[\text{at } x]  = \Pr[\text{at } y]=\Pr[\text{go to } x]=\Pr[\text{go to } y]=1/2$.

* **b)** Explain why a long random walk starting at node $x$ in Figure 1 will not converge to a stationary distribution. Characterize which starting distributions will converge to the stationary one. 

  * As the $\Pr[\text{go to }y] = \Pr[\text{go to }x]=1$ and not 1/2 and these values will not change.
  * The starting distributions will converge to the stationary one when the relation between the vertices are strong.

* **c)** Find a stationary distribution for the random walk graph in Figure 2. 

  * This graph is:

    * $V = \{w, z \}$
    * $E = \{\langle w \to z \rangle :1 , \langle z \to w \rangle :0.9, \langle z \to z \rangle :0.1  \}$

  * System:
    $$
    \Pr[\text{go to } w] = \Pr[\text{at } z] \cdot \Pr[\text{go to z from w}]  = 0.9\Pr[\text{at } z] = \Pr[\text{at } w] \\
    \Pr[\text{go to } z]  = \Pr[\text{at } w] \cdot \Pr[\text{go to w from z}]+ \Pr[\text{at } z] \cdot \Pr[\text{go to z from z}] = \Pr[\text{at } w]+0.1\Pr[\text{at } z] = \Pr[\text{at } z] \\
    \Pr[\text{at } w]  + \Pr[\text{at } z]  = 1
    $$
    

  * Therefore:

    * $\Pr[\text{at } w] = 9/19$.
    * $\Pr[\text{at } z] = 10/19$.

* **d)** If you start at node $w$ Figure 2 and take a (long) random walk, does the distribution over nodes ever get close to the stationary distribution?

  * Steps:
    1. $\Pr[\text{go to }w] = 0, \Pr[\text{go to }z] = 1$
    2. $\Pr[\text{go to }w] = 0.9, \Pr[\text{go to }z] = 0.1$
    3. $\Pr[\text{go to }w] = 9/20, \Pr[\text{go to }z] = 11/20$
    4. $\Pr[\text{go to }w] = 6/10, \Pr[\text{go to }z] = 4/20$
  * The values follows the Fibonacci sequence, therefore at the step $n$:
    * $\Pr[\text{go to }w] = (F_n \cdot0.9)/(F_n+F_{n-1}), \Pr[\text{go to }z] = (F_n \cdot0.1 + F_{n-1} )/(F_n+F_{n-1})$
  * For the step $n = 99$:
    * $\Pr[\text{go to }w] \approx 0.556 , \Pr[\text{go to }z] \approx 0.444$
  * The distribution over nodes gets close to the stationary distribution over time.

* **e)** Explain why the random walk graph in Figure 3 has an uncountable number of stationary distributions. 

  * This graph is:

    * $V = \{a,b,c,d \}$
    * $E = \{\langle a \to a \rangle :1, \langle b \to a \rangle :1/2, \langle b \to c \rangle :1/2, \langle c \to b \rangle :1/2, \langle c \to d \rangle :1/2, \langle d \to d \rangle :1 \}$

  * The system is:
    $$
    \Pr[\text{go to } a] = \Pr[\text{at } b] \cdot \Pr[\text{go to a from b}] + \Pr[\text{at }a]\cdot \Pr[\text{go to $a$ from $a$}]  = \Pr[\text{at }a] \\
    \Pr[\text{go to } b] = \Pr[\text{at } c] \cdot \Pr[\text{go to b from c}]]  = \Pr[\text{at }b] \\
    \Pr[\text{go to } c] = \Pr[\text{at } b] \cdot \Pr[\text{go to c from b}]]  = \Pr[\text{at }c] \\
    \Pr[\text{go to } d] = \Pr[\text{at } c] \cdot \Pr[\text{go to $d$ from $c$}] + \Pr[\text{at }d]\cdot \Pr[\text{go to $d$ from $d$}]  = \Pr[\text{at }d] \\
    \Pr[\text{at }a]+\Pr[\text{at }b]+\Pr[\text{at }c]+\Pr[\text{at }d]=1
    $$
    

  * So we got:

    * $\Pr[\text{at } b] = \Pr[\text{at } c] = 0$
    * $\Pr[\text{at } a] + \Pr[\text{at } d]=1$

  * Therefore, we got infinite possibilities to solve that system. 

* **f)** If you start at node $b$ in Figure 3 and take a long random walk, the probability you are at node $d$ will be close to what fraction? Explain. 

  * The probability tree is:

    ```
    
    
    
    b----> a   --->b----> a   --->b----> a   --->b----> a   --->b
     \        /     \        /     \        /     \        /
      \      /       \      /       \      /       \      /       
       --> c ----->d  --> c ----->d   --> c ----->d  --> c ----->d
    ```

    

  * Therefore:
    $$
    \Pr[\text{at $d$ | starting at $b$}] = \sum_{i=1}^{\infty}\frac {1}{2^{2i}} = \frac 13
    $$

* **g)** Give an example of a random walk graph that is not strongly connected but has a unique stationary distribution. 

  * The graph 
    * $V = {a, b, c}$
    * $E = \{\langle a \to b \rangle, \langle b \to c \rangle, \langle c \to a \rangle \}$

  

## Problem 2

Prove that for finite random walk graphs, the uniform distribution is stationary if and only the probabilities of the edges coming into each vertex always sum to 1.

**Answer**

This means that
$$
\sum_{u \in \text{into}(v)} p(u, v) = 1
$$
Where $\text{into}(w) ::= \{ v \ | \ \langle v \to w \rangle \text{ is and edge} \}$ and
$$
p(u, v) = \frac {\Pr[\text{at }u]} {\text{outdegree}(u)}
$$
So we got
$$
\sum_{u \in \text{into}(v)} p(u, v) = \sum_{u \in \text{into}(v)} \frac {\Pr[\text{at }u]} {\text{outdegree}(u)}
$$
Which will contain the sum of all edges resulting:
$$
\sum_{u \in \text{into}(v)} p(u, v) = \sum_{u \in V} \Pr[\text{at }u]
$$


And as by definition we got the the sum of the probabilities of being at each vertex equals 1:
$$
\sum_{u \in \text{into}(v)} p(u, v) = 1
$$


## Problem 3

Defining $d(v) ::= \text{outdeg}(v)/e$, where $e$ is the total number of edges in the graph, $e = |E|$.

* **a)** If $d$ was used for webpage ranking, how could you hack this to give your page a high rank? ...and explain informally why this wouldn’t work for “real” page rank using digraphs?

  * $d$ represents the fraction of edges "owned" by a certain vertex, so if it was a rank system, you just have to put a lot of links to other websites.
  * Because the "real"  page ranks are based on the number of "citations" of a page.

* **b)** Show that $d$ is a stationary distribution.
  $$
  \sum_{v \in V} d(v) = \frac {\sum_{v \in V} \text{outdeg}(v)}{e} = \frac {e}{e} = 1
  $$
  