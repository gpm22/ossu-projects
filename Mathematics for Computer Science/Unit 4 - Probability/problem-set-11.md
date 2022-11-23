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



## Problem 3

