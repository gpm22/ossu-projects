# In-Class Problems Week 13, Wed.

Questions are in MIT book pages 777-778 and 783-785. The material can be download on [**MIT**](https://openlearninglibrary.mit.edu/courses/course-v1:OCW+6.042J+2T2019/courseware/2fd2d133dd7d4b0bb459eb1304928688/330803e875954952b37f886f36eec346/?activate_block_id=block-v1%3AOCW%2B6.042J%2B2T2019%2Btype%40sequential%2Bblock%40330803e875954952b37f886f36eec346).

## Problem 18.11

Here’s a dice game with maximum payoff $k$: make three independent rolls of a fair die, and if you roll a six :

* no times, then you lose 1 dollar; 
* exactly once, then you win 1 dollar; 
* exactly twice, then you win 2 dollars; 
* all three times, then you win k dollars.

For what value of $k$ is this game fair?

Let $J$ be a random variable representing the number of six, therefore:

* $\Pr[J = 0] = (5/6)^3$
* $\Pr[J = 1] = 3 \cdot 25/6^3$
* $\Pr[J = 2] = 3 \cdot 5/6^3$
* $\Pr[J = 3] = 1/6^3$

So the expected value is:
$$
\text{Ex}[J] & = & - \frac {125}{216} + \frac {75}{216} + 2 \cdot \frac{15}{216} + k \cdot \frac{1}{216}  \\
& = & \frac {k - 20}{216}
$$
The game is fair if $\text{Ex}[J]=0$, therefore $k$ must be 20.



## Problem 18.12

* **a)** Suppose we flip a fair coin and let $N_{TT}$ be the number of flips until the first time two consecutive Tails appear. What is $\text{Ex}[N_{TT}]$?

  * The tree is shown in figure 18.8, using the tree, the expected value is:
    $$
    \text{Ex}[N_{TT}] & = & \frac 24 + \frac {1+\text{Ex}[N_{TT}]}{2} + \frac {2+\text{Ex}[N_{TT}]}{4} \\
    & = & \frac {6 + 3\text{Ex}[N_{TT}]}{4}
    $$
    

  * Therefore $\text{Ex}[N_{TT}] = 6$

* **b)** Let $N_{TH}$ be the number of flips until a Tail immediately followed by a Head comes up. What is $\text{Ex}[N_{TH}]$?

  * tree

    ```
                 D
                /
     	    H / 
         1/2 /
            /
    D ---- .
            \        .
             \   H  / 
            T \    /
         1/2   \  /
                .
                 \       .
              T   \  H  /
                   \   /
                    \ / 
                     .
                      \
                   T   \
                        \
                         .
                          .
                           .
    ```

    

  * Using the tree, the expected value is:
    $$
    \text{Ex}[N_{TH}] & = & \frac {1+\text{Ex}[N_{TH}]}{2} + \sum_{i=2}^\infty \frac i{2^i} \\
    & = & \frac {\text{Ex}[N_{TH}]}{2} + \sum_{i=1}^\infty \frac i{2^i} \\
    & = & \frac {\text{Ex}[N_{TH}]}{2} + 2
    $$
    

  * Therefore, $\text{Ex}[N_{TH}] = 4$.

* **c)** Suppose we now play a game: flip a fair coin until either TT or TH occurs. You win if TT comes up first, and lose if TH comes up first. You pay \$ 5 if you lost and receive \$6 if you win.

  * Tree:

    ```
                 D
                /
     	    H / 
         1/2 /
            /
    D ---- .
            \         L
             \   H  / 
            T \    /
         1/2   \  /
                .
                 \       
              T   \     
                   \   
                    \    
    				W
    ```

    

  * Then
    $$
    \text{Ex} & = & \frac 64 - \frac 54 + \frac {\text{Ex}}{2} \\
    & = & \frac {1+\text{Ex}}{4}
    $$
    

  * Then the expected profit per game is \$0.33.

## Problem 18.13

## Problem 18.21

## Problem 18.22

## Problem 18.23

## Problem 18.24

## Problem 18.25