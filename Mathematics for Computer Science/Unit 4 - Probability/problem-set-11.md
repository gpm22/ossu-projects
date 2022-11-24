# Problem Set 11

Problems available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/f4cfe6d1fc5ecb85ed910ef57773ce94/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_ps11.pdf).

## Problem 1

* **a)** Let $R$ be an $82 \times  4 $ rectangular matrix each of whose entries are colored red, white or blue. Explain why at least two of the 82 rows in $R$ must have identical color patterns. 
  * Number of possible different rows: $3^4 = 81$.
  * As is it only possible to have 81 different rows and we have 82 rows, by the pigeonhole principle we must have at least two rows with identical color patterns.
* **b)** Conclude that $R$ contains four points with the same color that form the corners of a rectangle. 
  * As it row have 4 slots, but we got only 3 colors, so there must be at least two slots with the same color and you only need two rows with the slots of the same color at the same place.
  * So, as it is guaranteed to have at least two equal rows, we can guarantee to have a rectangle formed by the slots of the same color of these two equal rows.
* **c)** Now show that the conclusion from part **b)** holds even when R has only 19 rows. 
  * For each two equal colors, we can have 6 different rows, so as we got 3 different colors, we can have 18 different rows, with only 2 equal colors.
  * Therefore, by the pigeonhole principle, 19 rows are enough to guarantee part **b)**.

## Problem 2

We play a game with a deck of 52 regular playing cards, of which 26 are red and 26 are black. I randomly shuffle the cards and place the deck face down on a table. You have the option of “taking” or “skipping” the top card. If you skip the top card, then that card is revealed and we continue playing with the remaining deck. If you take the top card, then the game ends; you win if the card you took was revealed to be black, and you lose if it was red. If we get to a point where there is only one card left in the deck, you must take it. Prove that you have no better strategy than to take the top card—which means your probability of winning is 1/2. 

**Answer**

We prove by induction that for a randomly shuffled deck of $n$ cards that are red or black, not necessarily with the same number of red cards and black cards, there is no better strategy than taking the top card. 

**Hypothesis**: $P(n) ::=$ There is no better strategy than taking the top card for randomly shuffled deck of $n$ cards, that are red or black.

**Base case**: $P(2)$, It holds as not taking the first card keep the probability of winning in 1/2, this can be clearly seem in the next tree:

```
Take the     Take the 			Probability
fisrt card  second card

		W						1/2	
        /
     B / 1/2   
      /
     .
    / \
   / R \ 1/2 
T /	    \
 /       L						1/2
 .
  \       .------T-----> R--->L   1/2
 N \     /
    \  B/ 1/2
     \ /
      .
       \
      R \ 1/2
         \
          .------T-----> B--->W   1/2
```

**Induction step**: We assume that it holds for $P(n)$ and respective probabilities of winning taking the first card for $P(n)$ and $P(n+1)$ is $p_1$ and  $p_2$. As it holds for $P(n)$, after not taking the first cade in $P(n+1)$, we take for $P(n)$. So for $P(n+1)$ we have the following tree.

```
Take the     Take the 			Probability
fisrt card  second card

		W						p_2	
        /
     B / p_2   
      /
     .
    / \
   / R \ 1-p_2 
T /	    \
 /       L						1-p_2
 .
  \       .------T-----> .        p_2*p_1
 N \     /       p_1
    \  B/ p_2
     \ /
      .
       \
      R \ 1-p_2
         \       p_1
          .------T-----> .        (1-p2)(p1)  
```

As $p_1$ and $p_2$ are less than 1, then $p_1 \cdot p_2 < p_2$  and $p_1 \cdot (1-p_2) < p_2$ , therefore it holds for $P(n+1)$, as not taking the first card is not better than taking.

As $P(n)$ holds for all cases, there is no better strategy than to take the top card for the described game.

## Problem 3

* **a)** Describe a simple probability space (that is, outcomes and their probabilities) for this scenario, and list the outcomes in each of the following events: 

  * **Probability Space:**

    * (not in hand, revealed card):
      $$
      (a_H, J) = \frac 16\\
      (a_H, a_S) = \frac 16 \\
      (a_S, J) = \frac 16 \\
      (a_S, a_H) = \frac 16 \\
      (J, a_S) = \frac 16 \\
      (J, a_H) = \frac 16
      $$

  * Events:

    1. $[K \geq 1] = 1$

       * You always have an Ace in your hand.

    2. $a_H$ is in your hand.
       $$
       \frac 23
       $$
       

    3. The revealed card is an $a_H$.
       $$
       \frac 13
       $$
       

    4. The revealed card is an Ace;
       $$
       \frac 23
       $$
       

* **b)** Then calculate $\Pr[K=2 \ | \ E ]$ for $E$ equal to each of the four events in part **a)**:

  * Events:

    1. $[K \geq 1] = 1$
       $$
       \frac 13
       $$

    2. $a_H$ is in your hand.
       $$
       \frac 12
       $$
       

    3. The revealed card is an $a_H$.
       $$
       \frac 12
       $$
       

    4. The revealed card is an Ace;
       $$
       \frac 12
       $$
       

  Now suppose you have a deck with $d$ distinct cards, $a$ different kinds of Aces (including an $a_H$), you draw a random hand with $h$ cards, and then reveal a random card from your hand. 

  * **c)** Prove that $\Pr[a_H \text{ is in your hand}] = h/d$.

    * Number of different hands:
      $$
      \frac{d!}{(d-h)!h!}
      $$

    * Number of different hands with an $a_H$:
      $$
      \frac{(d-1)!}{(d-h)!(h-1)!}
      $$
      

    * The probability of having an $a_H$ in the hand is the fraction:
      $$
      \frac{\text{Number of different hands with an } a_H}{\text{Number of different hands}} = \frac{(d-1)!}{(d-h)!(h-1)!} \frac{(d-h)!h!}{d!} = \frac hd
      $$
      

  * **d)** Prove that
    $$
    \Pr[K = 2 \ | \ a_H \text{ is in your hand}] = \Pr[k=2] \cdot \frac {2d}{ah}
    $$
    

    * $\Pr[K = 2 \ | \ a_H \text{ is in your hand}]$

      * Manipulating the equation we notice that

      $$
      \Pr[K = 2 \ | \ a_H \text{ is in your hand}] & = &  \frac{\Pr[k=2 \cap a_H \text{ is in your hand} ]}{a_H \text{ is in your hand}} \\
      & = & \frac{\Pr[k=2] \cdot \Pr [a_H \text{ is in an ace pair} ]}{a_H \text{ is in your hand}}  \\
      $$

      * So we just need to know the probability $\Pr [a_H \text{ is ian ace pair} ]$, which is $2/a$

    * Therefore
      $$
      \Pr[K = 2 \ | \ a_H \text{ is in your hand}] = \frac{\Pr[k=2] \cdot 2/a }{h/d} = \Pr[k=2] \cdot \frac {2d}{ah}
      $$
      

  * **e)** Conclude that $\Pr[K = 2 \ |\text{ the revealed card is an ace}] = \Pr[K = 2 \ | \ a_H \text{ is in your hand}]$.

    * $\Pr[K = 2 \ |\text{ the revealed card is an ace}]$

      * Manipulating the equation, we notice:
        $$
        \Pr[K = 2 \ |\text{ the revealed card is an ace}] & = & \frac {\Pr[K = 2 \cap \text{the revealed card is an ace}]}{\Pr[ \text{the revealed card is an ace}]} \\
        & = & \frac {\Pr[K = 2] \cdot \Pr [\text{the revealed card is an ace when K=2}]}{\Pr[ \text{the revealed card is an ace}]}
        $$
        

      * $\Pr[\text{ the revealed card is an ace}] = \frac{a}{d}$

      * $\Pr[\text{the revealed card is an ace when K = 2}]$ is $2/h$

    * Then:
      $$
      \Pr[K = 2 \ |\text{ the revealed card is an ace}] = \Pr[K=2] \cdot \frac {2}{h} \cdot \frac {d}{a}
      $$

    * Therefore: $\Pr[K = 2 \ |\text{ the revealed card is an ace}] = \Pr[K = 2 \ | \ a_H \text{ is in your hand}]$
