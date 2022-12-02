# In-Class Problems Week 12, Fri.

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/0faabf617749c261be6d060d87ff1778/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp30.pdf).

## Problem 1

* **a)** A tree diagram to help Sally project her chance at happiness is shown below. On the diagram, fill in the edge probabilities, and at each leaf write the probability of the corresponding outcome.

  ```
            4/12  /-------------		16/144
           happy /    8/12
                /---------------		32/144
               /    unhappy
         4/12 /               
        Yale /     happy  /-----		35/144
            /    MIT     / 7/12
           . -----------.
            \    5/12    \ 5/12
             \    unhappy \-----		25/144
  Little Hoop \
          3/12 \      happy
                \---------------		33/144
         unhappy \     11/12
             1/12 \-------------		 3/144
  ```

  

* **b)** What is the probability of Sally is happy in College?
  $$
  \frac{7}{12}
  $$
  
* **c)** What is the probability that Sally attends Yale, given that she is happy in college?
  $$
  \Pr[Y \ | \ H] = \frac{\Pr[Y \cap H]}{\Pr[H]} = \frac{16/144}{7/12} = \frac{4}{21}
  $$
  
* **d)** Show that the event that Sally attends Yale **is not** independent of the event that she is happy.

  * If it would independent $\Pr[Y \ | \ H] = \Pr[Y] = 4/12$, but it is not, therefore it is not independent.

* **e)** Show that the event that Sally attends MIT **is** independent of the event that she is happy.

  * If it would independent $\Pr[M \ | \ H] = \Pr[M] = 5/12$, which is true, therefore it is independent.

## Problem 2

* **a)** Use the four step method to determine the probability space for this experiment and the probability of each of $A$, $B$, $C$, $D$.

  * Probability space:
    $$
    \{ HHH, HHT, HTH, HTT, THH, THT, TTH, TTT \}
    $$
    
  * Probability of $A$ is $1/2$
  
  * Probability of $B$ is $1/2$
  
  * Probability of $C$ is $1/2$
  
  * Probability of $D$ is $4/8$
  
* **b)** Show that these events are not mutually independent

  * If they are mutually independent $\Pr [ A \cap B \cap C \cap D] = \Pr[A] \cdot \Pr[B] \cdot \Pr[C] \cdot \Pr[D] = 4/36$, but is zero as it is not possible to all 4 happens at the same time.

* **c)** Show that they are $3$-way independent.

  * If they are 3-way independent:
    * $\Pr [ A \cap B \cap C] = \Pr[A] \cdot \Pr[B] \cdot \Pr[C] = 1/8$
    * $\Pr [ A \cap B \cap D] = \Pr[A] \cdot \Pr[B] \cdot \Pr[D] = 4/32 = 1/8$
    * $\Pr [ A \cap C \cap D] = \Pr[A] \cdot \Pr[C] \cdot \Pr[D] = 4/32 = 1/8$
    * $\Pr [ B \cap C \cap D] = \Pr[B] \cdot \Pr[C] \cdot \Pr[D] = 4/32 = 1/8$
  * Which is all true, there they are  $3$-way independent.

## Problem 3

## Problem 4

Prove it or give a counterexample:

* **a)** If $A$ is independent of $B$, then $A$ is also independent of $\overline B$

  * If $A$ is independent of $B$, then $\Pr[A \cap B] = \Pr[A] \cdot \Pr[B]$

  * If $A$ is independent of $\overline B$, then $\Pr[A \cap \overline B] = \Pr[A] \cdot \Pr[ \overline B]$

  * We know that $\Pr[\overline B] = 1 - \Pr[B]$, so
    $$
    \Pr[A] & = & \Pr[A \cap B] + \Pr[A \cap \overline B] \\
    & = & \Pr[A] \cdot \Pr[B] + \Pr[A] \cdot \Pr[ \overline B] \\
    & = & \Pr[A] \cdot ([\Pr[B] + \Pr[\overline B]]) \\
    & = & \Pr[A] \cdot 1 \\
    & = & \Pr[A]
    $$

  * Therefore it is true.

* **b)** If $A$ is independent of $B$, and $A$ is independent of $C$, then A is independent of $B \cap C$

  * Lets assume them to be pairwise, but not mutually independent, therefore
  * If $A$ is independent of $B$, then $\Pr[A \cap B] = \Pr[A] \cdot \Pr[B]$
  * If $A$ is independent of $C$, then $\Pr[A \cap C] = \Pr[A] \cdot \Pr[C]$
  * If $B$ is independent of $C$, then $\Pr[B \cap C] = \Pr[B] \cdot \Pr[C]$
  * If $A$ is independent of $B \cap C$, then $\Pr[A \cap B \cap C] = \Pr[A] \cdot \Pr[B \cap C] = \Pr[A] \cdot \Pr[B] \cdot \Pr[C]$, which is a contradiction since they are not mutually independent.
  * Therefore it is false.

* **c)**  If $A$ is independent of $B$, and $A$ is independent of $C$, then A is independent of $B \cup C$

  * Lets assume them to be pairwise, but not mutually independent.

  * As intersection is associative over union:
    $$
    \Pr[A \cap (B \cup C)] & = & \Pr [(A \cap B) \cup (A \cap C)] \\
    & = & \Pr[A \cap B] + \Pr[A \cap C] - \Pr [A \cap B \cap C]
    $$
     

  * By inclusion-exclusion principle, $\Pr[B \cup C] = \Pr[B] + \Pr[C] - \Pr[B \cap C]$

  * Multiplying both sides for $\Pr[A]$:
    $$
    \Pr[A] \Pr[B \cup C] = \Pr[A]\Pr[B] + \Pr[A]\Pr[C] - \Pr[A]\Pr[B \cap C] \\
    $$
    

  * So, if $A$ is independent of $B \cup C$, $B$, and $C$
    $$
    \Pr[A \cap (B \cup C)] = \Pr[A \cap B] + \Pr[A \cap C] - \Pr[A]\Pr[B \cap C]
    $$
    

  * So, for both be equal $A$ must be independent of $B \cap C$, which we already know is not true, therefore it is false.

* **d)** If $A$ is independent of $B$, and $A$ is independent of $C$, and A is independent of $B \cap C$, then $A$ is independent to $A \cup B$.

  * Using the proof of the last example, we can infer that if  A is independent of $B \cap C$, then $A$ is independent to $A \cup B$, therefore it is true.
