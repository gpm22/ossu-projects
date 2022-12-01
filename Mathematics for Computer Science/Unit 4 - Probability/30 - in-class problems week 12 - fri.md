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

