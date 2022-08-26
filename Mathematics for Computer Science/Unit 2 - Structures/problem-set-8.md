# Problem Set 8

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/edc68ed94fb0e163beb7801f82514923/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_ps8.pdf);

## Problem 1

**Prove: "If all edges in a finite weighted graph have distinct weights, then the graph has a *unique* MST**.

We prove by contradiction that If all edges in a finite weighted graph have distinct weights, then the graph has a *unique* MST.

Lets assume that $M$ and $N$ are different MST's of the same graph, $e$ is the smallest edge of the graph and it is in $M$ but not in $N$, so $e \in M - N$.

Adding $e$ to $N$ will create a spanning graph with a cycle, as $e$ will connect vertices already connected. So there is an edge $f \in N - M$ that is weightier than $e$. So $N$ is weightier than $M$ and cannot be a MST, we arrived at a contradiction. 

## Problem 2

* **a)** Show that $G$ is 4-colorable. 
  * ![q-2-problem-set-8](https://raw.githubusercontent.com/gpm22/ossu-projects/main/Mathematics%20for%20Computer%20Science/Unit%202%20-%20Structures/q-2-problem-set-8.png)
* **b)** Prove that $G$ can’t be colored with 3 colors.
  * The image used in the question **a)** shows us that a fourth color is needed, as 

## Problem 3



