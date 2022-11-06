# In-Class Problems Week 12, Mon.

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/8717a06ffd5ecd5bba2c3379156a8956/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp28.pdf).

## Problem 1

Let’s Make a Deal with four doors. A prize is hidden behind one of the four doors. Then the contestant picks a door. Next, the host opens an unpicked door that has no prize behind it. The contestant is allowed to stick with their original door or to switch to one of the two unopened, unpicked doors. The contestant wins if their final choice is the door hiding the prize.

Assumptions:

1. The prize is equally likely to be behind each door.
2. The contestant is equally likely to pick each door initially, regardless of the prize’s location.
3. The host is equally likely to reveal each door that does not conceal the prize and was not selected by the player.

Use The Four Step Method to find the following probabilities:

* **a)** Contestant Stu, a sanitation engineer from Trenton, New Jersey, stays with his original door. What is the probability that Stu wins the prize?

  * **Sample Space**

    * Randomly-determined quantities:

      * The door concealing the car.
      * The door initially chosen by the player.
      * The door that the host opens to reveal a goat.
      * The door unused 

    * Defining the 4-tuple as

      * (door concealing prize, door initially chosen, door opened to reveal a goat, door unused)

    * There are 72 possible results:
      $$
      S & ::= &  \{(A, A, B, C), (A, A, B, D), (A, A, C, B), (A, A, C, D), (A, A, D, B), (A, A, D, B),\\
      & &  (A, B, C, A), (A, B, C, D), (A, B, D, A), (A, B, D, C), \\
      & & (A, C, B, D), (A, C, D, A), (A, C, D, B), (A, D, B, A) \\
      & & (A, D, B, A), (A, D, B, C), (A, D, C, A), (A, D, C, B) \\
      
      & & (B, A, C, D), (B, A, D, B), (B, A, D, C), (B, A, D, C) \\ 
      & & (B, B, A, C), (B, B, A, D), (B, B, C, A), (B, B, C, D), (B, B, D, A), (B, B, D, C) \\
      & & (B, C, A, B), (B, C, A, D), (B, C, D, A), (B, C, D, B) \\
      & & (B, D, A, B), (B, D, A, C), (B, D, C, A), (B, D, C, B) \\
      
      & & (C, A, B, C), (C, A, B, D), (C, A, D, B), (C, A, D, C) \\
      & & (C, B, A, C), (C, B, A, D), (C, B, D, A), (C, B, D, C) \\
      & & (C, C, A, B), (C, C, A, D), (C, C, B, A), (C, C, B, D), (C, C, D, A), (C, C, D, B) \\ 
      & & (C, D, A, C), (C, D, B, A), (C, D, B, C), (C, A, B, C) \\
      
      & & (D, A, B, C), (D, A, B, D), (D, A, C, B), (D, A, C, D) \\
      & & (D, B, A, C), (D, B, A, D), (D, B, C, A), (D, B, C, D) \\
      & & (D, C, A, B), (D, C, A, D), (D, C, B, A), (D, C, B, D)  \\
      & & (D, D, A, B), (D, D, A, C), (D, D, B, A), (D, D, B, C), (D, D, C, A), (D, D, C, B) \}
      $$
      

    * **Step 2: Define events of interest.**

      * The events of interest are the ones where staying results in victory, which are the ones where the door concealing prize and door initially chosen are the same.

      * So we got 24 possible results:
        $$
        E & ::= &  \{(A, A, B, C), (A, A, B, D), (A, A, C, B), (A, A, C, D), (A, A, D, B), (A, A, D, B),\\
        & & (B, B, A, C), (B, B, A, D), (B, B, C, A), (B, B, C, D), (B, B, D, A), (B, B, D, C) \\
        & & (C, C, A, B), (C, C, A, D), (C, C, B, A), (C, C, B, D), (C, C, D, A), (C, C, D, B) \\ 
        & & (D, D, A, B), (D, D, A, C), (D, D, B, A), (D, D, B, C), (D, D, C, A), (D, D, C, B) \}
        $$

    * **Step 3: Determine outcome probabilities.**

      * For outcomes where the door concealing the prize and the door initially chosen are the same, the probability is $1/96$, for the others is $1/64$

    * **Step 4: Compute event probabilities**
      $$
      24 \times 1/96 = 24/96 = 1/4
      $$
      

* **b)** Contestant Zelda, an alien abduction researcher from Helena, Montana, switches to one of the remaining two doors with equal probability. What is the probability that Zelda wins the prize?

  * **Sample Space**

    * Randomly-determined quantities:
      * The door concealing the car.
      * The door initially chosen by the player.
      * The door that the host opens to reveal a goat.
      * The door unused 
      
    * Defining the 4-tuple as
      
      * (door concealing prize, door initially chosen, door opened to reveal a goat, door unused)
      
    * There are 72 possible results:
      $$
      S & ::= &  \{(A, A, B, C), (A, A, B, D), (A, A, C, B), (A, A, C, D), (A, A, D, B), (A, A, D, B),\\
      & &  (A, B, C, A), (A, B, C, D), (A, B, D, A), (A, B, D, C), \\
      & & (A, C, B, D), (A, C, D, A), (A, C, D, B), (A, D, B, A) \\
      & & (A, D, B, A), (A, D, B, C), (A, D, C, A), (A, D, C, B) \\
      
      & & (B, A, C, D), (B, A, D, B), (B, A, D, C), (B, A, D, C) \\ 
      & & (B, B, A, C), (B, B, A, D), (B, B, C, A), (B, B, C, D), (B, B, D, A), (B, B, D, C) \\
      & & (B, C, A, B), (B, C, A, D), (B, C, D, A), (B, C, D, B) \\
      & & (B, D, A, B), (B, D, A, C), (B, D, C, A), (B, D, C, B) \\
      
      & & (C, A, B, C), (C, A, B, D), (C, A, D, B), (C, A, D, C) \\
      & & (C, B, A, C), (C, B, A, D), (C, B, D, A), (C, B, D, C) \\
      & & (C, C, A, B), (C, C, A, D), (C, C, B, A), (C, C, B, D), (C, C, D, A), (C, C, D, B) \\ 
      & & (C, D, A, C), (C, D, B, A), (C, D, B, C), (C, A, B, C) \\
      
      & & (D, A, B, C), (D, A, B, D), (D, A, C, B), (D, A, C, D) \\
      & & (D, B, A, C), (D, B, A, D), (D, B, C, A), (D, B, C, D) \\
      & & (D, C, A, B), (D, C, A, D), (D, C, B, A), (D, C, B, D)  \\
      & & (D, D, A, B), (D, D, A, C), (D, D, B, A), (D, D, B, C), (D, D, C, A), (D, D, C, B) \}
      $$
      

  * **Step 2: Define events of interest.**

    * The events of interest are the ones where switching results in victory, which are the ones where the door concealing prize, door initially chosen, and door unused are different.

    * So we got 24 possible results:
      $$
      E & ::= & \{ (A, B, C, D), (A, B, D, C), (A, C, B, D), (A, C, D, B), (A, D, B, C), (A, D, C, B), \\
      & & (B, A, C, D), (B, A, D, C), (B, C, A, D), (B, C, D, A), (B, D, A, C), (B, D, C, A), \\
      & & (C, A, B, D), (C, A, D, B), (C, B, A, D), (C, B, D, A), (C, D, A, B), ( C, D, B, A) \\
      & & (D, A, C, B), (D, A, B, C), (D, B, A, C), (D, B, C, A), (D, C, A, B), (D, C, B, A)
      \}
      $$
    
  * **Step 3: Determine outcome probabilities.**

    * For outcomes where the door concealing the prize and the door initially chosen are the same, the probability is $1/96$, for the others is $1/64$

  * **Step 4: Compute event probabilities**
    $$
    24 \times 1/64 = 24/64 = 3/8
    $$
    

* **Tree Diagram**

  (door concealing prize, door initially chosen, door opened to reveal a goat, door unused)

  ![permutation_book](https://raw.githubusercontent.com/gpm22/ossu-projects/main/Mathematics%20for%20Computer%20Science/Unit%204%20-%20Probability/4_door_tree.png)



## Problem 2

* **a)** Show that the probability that the system fails could be as small as $p$ by describing appropriate probabilities for the outcomes. Make sure to verify that the sum of your outcome probabilities is 1.
  * As $\Pr[F_ i] = p$, the smallest subsets only have one component, so the smallest probability is $p$.
* **b)** Show that the probability that the system fails could actually be as large as $np$ by describing appropriate probabilities for the outcomes. Make sure to verify that the sum of your outcome probabilities is 1.
  * In the case where components are independent, the probability is the sum of probabilities of the smallest sets, which are $np$, as we got $n$ of these sets.
* **c)** Prove $p \leq \Pr[F] \leq np$.
  * In the case where $F$ contains components which are dependent, the probability will be less than $np$, as we have to remove the probability of intersection.
  * Therefore the maximum possible is $np$, and the minimum value is $p$.

## Problem 3

## Problem 4

## Problem 5

## Problem 6