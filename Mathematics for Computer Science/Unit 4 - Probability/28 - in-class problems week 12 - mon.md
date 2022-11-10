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

  * **Step 1: Sample Space**

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

To determine which of two people gets a prize, a coin is flipped twice. If the flips are a Head and then a Tail, the first player wins. If the flips are a Tail and then a Head, the second player wins. However, if both coins land the same way, the flips don’t count and the whole process starts over.

Assume that on each flip, a Head comes up with probability p, regardless of what happened on other flips. Use the four step method to find a simple formula for the probability that the first player wins. What is the probability that neither player wins?

**Answer**

* **Step 1: Sample Space**
  * It is infinity.
  
  * Tree:
  
    ![head_tail_tree](https://raw.githubusercontent.com/gpm22/ossu-projects/main/Mathematics%20for%20Computer%20Science/Unit%204%20-%20Probability/head_tail_tree.png)
  
  * Probability of head is $p$, therefore probability of tail is $1-p$.
  
* **Step 2: Define events of interest.**
  
  * (T, T, ..., H, H, ..., H, T)
    * 0 to Infinity pairs of tails
    * 0 to Infinity pairs of heads
    * 1 (H, T)
  
* **Step 3: Determine outcome probabilities.**

  * Assuming $s$ to be the sum of all winning probabilities in the whole tree.

  * $s$ must be equal the sum of probabilities of each branch and the victory in the first 2 flips. therefore
    $$
    s = p^2s + (1-p)^2s + p(1-p)
    $$
    

* **Step 4: Compute event probabilities**
  $$
  s = p^2s + (1-p)^2s + p(1-p) \\
  (s-p^2s-(1-p)^2s) = p(1-p) \\
  s(1-p^2-(1-p)^2)=p(1-p) \\
  s = \frac{p(1-p)}{(1-p^2-(1-p)^2)} \\
  s = \frac{p(1-p)}{(2p-2p^2)} \\
  s = \frac{p(1-p)}{2p(1-p)} \\
  s = 1/2
  $$
  

As $p$ and $1-p$ are less than 1, so they elevated to infinity is zero, therefore the probability that neither player wins is zero.

## Problem 4

Prove the following probabilistic inequality, referred to as the Union Bound. Let  $A_1,  A_2,  \dots , A_n,  \dots$ be events. Then
$$
\Pr \left[ \bigcup_{n \in \N} A_n \right] \leq \sum _ {n \in \N} \Pr[A_n]
$$
**Answer**

If all events are independent, the value of $\Pr \left[ \bigcup_{n \in \N} A_n \right]$ is $\sum _ {n \in \N} \Pr[A_n]$.

Any probability of a set of codependent event with cardinality pair will be decreased from $\Pr \left[ \bigcup_{n \in \N} A_n \right]$, then the value will be less than $\sum _ {n \in \N} \Pr[A_n]$ for not disjoint events.

Therefore $\Pr \left[ \bigcup_{n \in \N} A_n \right] \leq \sum _ {n \in \N} \Pr[A_n]$.

## Problem 5

Prove:

* Difference Rule

  * $\Pr [A-B] = \Pr[A] - \Pr[A \cap B]$

  * From sum rule:
    $$
    \Pr[B] = \Pr[B-A] + \Pr[A \cap B]
    $$
    

  * Therefore
    $$
    \Pr[B-A] = \Pr[B] - \Pr[A \cap B]
    $$
    
* Complement Rule

  * $\Pr[\overline A] = 1 - \Pr[A]$
  * The sum of all values in a probability space is 1.
  * So, as $A + \overline A$ forms a complete probability space: $\Pr[A + \overline A] = 1$
  * As they are also disjoint sets: $\Pr[A] + \Pr[\overline A] = 1$
  * Therefore $\Pr[\overline A] = 1 - \Pr[A]$.

* Inclusion-Exclusion

  * $\Pr[A \cup B] = \Pr[A] + \Pr[B] - \Pr[A \cap B]$
  * From difference rule: 

    * $\Pr [A-B] = \Pr[A] - \Pr[A \cap B]$
    * $\Pr [B-A] = \Pr[B] - \Pr[A \cap B]$

  * So $Pr[A] + \Pr[B]$
    $$
    \Pr[A] + \Pr [B] = \Pr [A-B] + 2\Pr[A \cap B] + \Pr [B-A]
    $$
    

  * $\Pr[A-B] + \Pr[B-A]$ is the sum of probabilities of $A$ independent of $B$ with the probabilities of $B$ independent of $A$, then it is equal the probabilities of the union of $A$ and $B$ minus the probabilities of the intersection between $A$ and $B$:
    $$
    \Pr[A-B] + \Pr[B-A] = \Pr[A \cup B] - \Pr[A \cap B]
    $$
    

  * So
    $$
    \Pr[A] + \Pr [B] & = &  \Pr[A \cup B] - \Pr[A \cap B] + 2\Pr[A \cap B] \\
    & = &  \Pr[A \cup B] + \Pr[A \cap B]
    $$
    

  * Therefore
    $$
    \Pr[A \cup B] = \Pr[A] + \Pr [B] - \Pr[A \cap B]
    $$
    

* 2-event Union Bound

  * $\Pr[A \cup B] \leq \Pr[A] + \Pr[B]$
  * It follows directly from the Inclusion-Exclusion.

* Monotonicity

  * If $A \subseteq B$, then $\Pr[A] \leq \Pr[B]$.
  * As there are no negative values of probability, $\Pr[B]$ will sum also $\Pr[A]$, therefore If $A \subseteq B$, then $\Pr[A] \leq \Pr[B]$.


## Problem 6

The New York Yankees and the Boston Red Sox are playing a two-out-of-three series. In other words, they play until one team has won two games. Then that team is declared the overall winner and the series ends. Assume that the Red Sox win each game with probability $3/5$, regardless of the outcomes of previous games. Answer the questions below using the four step method. You can use the same tree diagram for all three problems. 

* **a)** What is the probability that a total of 3 games are played? 
  $$
  \frac 35 \frac 25 \frac 25 + \frac 35 \frac 25 \frac 35 + \frac 25 \frac 35 \frac 35 + \frac 25 \frac 35 \frac 25 =  \frac {60}{125} = \frac{12}{25}
  $$
  
* **b)** What is the probability that the winner of the series loses the first game? 
  $$
  \frac 35 \frac 25 \frac 25 + \frac 25 \frac 35 \frac 35 =  \frac {30}{125} = \frac{6}{25}
  $$
  
* **c)** What is the probability that the correct team wins the series?
  $$
  \frac 25 \frac 25 + \frac 25 \frac 35 \frac 25 + \frac 35 \frac 25 \frac 25 = \frac {44}{125}
  $$
  

**Tree**

![red_sox_tree](https://raw.githubusercontent.com/gpm22/ossu-projects/main/Mathematics%20for%20Computer%20Science/Unit%204%20-%20Probability/red_sox_tree.png)