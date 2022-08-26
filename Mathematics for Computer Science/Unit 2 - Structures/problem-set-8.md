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
  * The image used in the question **a)** shows us that a fourth color is needed, as we got a bunch of length 5 cycle, 3 colors are needed for coloring these cycles, but we got a central node forcing the use of one more color, as it need to be colored with a color different from the other 3.

## Problem 3

The preferences among 4 boys and 4 girls are partially specified in the following table:
$$
B_1 & : & [G_1, G_2, \_, \_] \\
B_2 & : & [G_2, G_1, \_, \_] \\
B_3 & : & [\_, \_, G_4, G_3] \\
B_4 & : & [\_, \_, G_3, G_4] \\
\\
G_1 & : & [B_2, B_1, \_, \_] \\
G_2 & : & [B_1. B_2, \_, \_] \\
G_3 & : & [\_, \_, B_3, B_4] \\
G_4 & : & [\_, \_, B_4, B_3] \\
$$

* **a)** Verify that $(B_1, G_1), (B_2, G_2), (B_3, G_3), (B_4, G_4)$ will be a stable matching whatever the unspecified preferences may be. 

  * $(B_1, G_1)$
    * $G_1$ is the top girl for $B_1$, so he does not want anyone else.
    * $G_1$ prefers $B_2$, but he prefers $G_2$.
  * $(B_2, G_2)$
    * $G_2$ is the top girl for $B_2$, so he does not want anyone else.
    * $G_2$ prefers $B_1$, but he prefers $G_1$.
  * $(B_3, G_3)$
    * $G_3$ is not the top girl for $B_3$, but his top 2 is already stable;
    * $B_3$ is not the top boy for $G_3$, but her top 2 is already stable;
  * $(B_4, G_4)$
    * $G_4$ is not the top girl for $B_4$, but his top 3 is already stable;
    * $B_4$ is not the top boy for $G_4$, but her top 3 is already stable;

* **b)** Explain why the stable matching above is neither boy-optimal nor boy-pessimal and so will not be an outcome of the Mating Ritual. 

  * Not boy-optimal:
    * As $B_3$ and $B_4$ got their worse girls and if they trade between their girls the matching would continue stable.
  * Not boy-pessimal:
    * As $B_1$ and $B_2$ got their best girls;

* **c)** Describe how to define a set of marriage preferences among $n$ boys and $n$ girls which have at least $2^{ n/2} $ stable assignments. 

  First we arrange the boys and girls into two lists of $n/2$ pairs of each one.

  We set the preferences to be that the $k_{th}$ pair of boys ranks $k_{th}$ girls just below the previous pairs of girls

  Now each boy's first choice girl in the pair must prefers the other boy in the pair.

  As the rouge couples can only exist in the other $k_{th}$ pair, but as pairs are organized as
  $$
  B_1 & : & [G_1, G_2] \\
  B_2 & : & [G_2, G_1] \\
  \\
  G_1 & : & [B_2, B_1] \\
  G_2 & : & [B_1, B_2] \\
  $$
  so that the 4 possible pairs are stable, we can assure that will not exist rouge couples.

  As each boy can marry their related pair and there are $n/2$ pairs, the number of stable matchings is $2^{n/2}$. 



