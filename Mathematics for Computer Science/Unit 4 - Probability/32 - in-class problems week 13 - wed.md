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

Let $T$ be a positive integer valued random variable such that $\text{PDF}_T(n)= 1 /(an^2)$, where $a ::= \sum_{n \ \in \ \Z^+} 1/n^2$ is a constant value.

* **a)** Prove that $\text{Ex}[T]$ is infinite.
  $$
  \text{Ex}[T] & = & \sum_{n \ \in \Z^+} \frac n {an^2} \\
  & = & \sum_{n \ \in \Z^+} \frac 1 {an} \\
  $$

  * The sum $\sum_{n = 1}^\infty 1/(an)$ diverges, therefore $\text{Ex}[T]$ is infinite.

* **b)** Prove that $\text{Ex}[\sqrt T]$ is finite.
  $$
  \text{Ex}[\sqrt T] & = & \sum_{n \ \in \Z^+} \frac {\sqrt n} {a n^2} \\
  & = & \sum_{n \ \in \Z^+} \frac 1 { an^{3/2}} \\
  $$

  * The sum $\sum_{n \ \in \Z^+} 1 /(an^{3/2})$ converges, therefore $\text{Ex}[\sqrt T]$ is finite.

## Problem 18.21

A classroom has sixteen desks in a $4 \times 4$ arrangement. If there is a girl in front, behind, to the left, or to the right of a boy, then the two flirt. One student may be in multiple flirting couples; for example, a student in a corner of the classroom can flirt with up to two others, while a student in the center can flirt with as many as four others. Suppose that desks are occupied mutually independently by boys and girls with equal probability. What is the expected number of flirting couples?

**ANSWER**

First we have to know the number of pairs of adjacent desks. As there are three in each row and three in each column and there are four rows and four columns, we got 24 pairs of adjacent desks.

Numbering these pairs of adjacent desks from 1 to 24, let $I_i$ be an indicator for the event that occupants of the desks in the $i$-th pair are flirting.  The wanted probability is then:
$$
\begin{align*}
\text{Ex}\left[ {\sum_{i=1}^{24} I_i} \right]
	& = \sum_{i=1}^{24} \text{Ex}[I_i] \\
	& = \sum_{i=1}^{24} \Pr[I_i = 1]
\end{align*}
$$
The occupants of adjacent desks are flirting if the gender of the occupants are different, that is, boy and girl or girl and boy. As each of these events happens with probability 1/4, the probability that the occupants flirt is $\Pr[I_i = 1] = \frac{1}{4} +
\frac{1}{4} = \frac{1}{2}$.  Using this value we got:
$$

\text{Ex} \left[ \sum_{i=1}^{24} I_i \right]= 12
$$


## Problem 18.22

* **a)**What is the expected number of true propositions?
  * Let $T_i$ be an indicator for the event that the $i$-th proposition is true, for $ i \in [1..7]$
  * $T_i = 7/8$, as to be false the 3 must be false.
  * Therefore the expected number if $T_1 + \cdots + T_7 = 49/8 = 6.125$
* **b)** Use your answer to prove that for any set of 7 propositions satisfying the conditions 1. and 2., there is an assignment to the variables that makes all 7 of the propositions true.
  * As a random variable cannot be always less than its expected value, for some condition the number of true propositions will greater than $6.125$.
  * And the only possible value is $7$.



## Problem 18.23

* **a)** What is the probability that the last $k$-clause in $S$ is true under the random assignment?
  $$
  1 - \frac {1}{2^k}
  $$

* **b)** What is the expected number of true $k$-clauses in $S$?
  $$
  n \left( 1 - \frac {1}{2^k} \right)
  $$
  

* **c)** A set of propositions is **satisfiable** iff there is an assignment to the variables that makes all of the propositions true. Use your answer to part **b)** to prove that if $n < 2^k$, then $S$ is satisfiable.

  * The number of possible permutatations for a $k$-clause is $2^k$, where one of them is false.
  * Therefore, $n < 2^k$ is needed to assure that $S$ is satisfiable.

## Problem 18.24

* **a)** What is the expected number of students that have a higher rank in Math for CS than in Signal Processing?

  * Let $X_i$ be the indicator variable for student $i$ having higher rank in Math than SP.

  * A student raking $r$th in Math has the probability of ranks better in SP with probability $\Pr[X_i \ | \ r] = (r-1)/n$.

  * First we need to calculate $\text{Ex}[X_i \ | \ r]$.
    $$
    \text{Ex}[X_i \ | \ r] = \frac {(r-1)}{n}
    $$
    

  * Therefore $\text{Ex}[X_i]$ is
    $$
    \begin{align*}
    \text{Ex}[X_i]  & = \sum_{r=1}^n  \text{Ex}[X_i \ | \ r] \Pr[r] \\
                    & = \sum_{r=1}^n   \frac {r-1}{n^2} \\
                    & = \frac {0 + 1 + 2 + \cdots +  n-1}{n^2} \\
                    & = \frac {n(n-1)}{2} \cdot \frac {1}{n^2} \\
                    & = \frac {n-1}{2n}
    \end{align*}
    $$
    

* **b)** What is the expected number of students that have a ranking at least $k$ higher in Math for CS than in Signal Processing?

  * Let $X_i$ be the indicator variable for student $i$ having higher rank in Math than SP by at least $k$ higher.

  * A student raking $r$th in Math has the probability of ranks better in SP by at least $k$ higher with probability $\Pr[X_i \ | \ r] = (r-k)/n$.

  * First we need to calculate $\text{Ex}[X_i \ | \ r]$.
    $$
    \text{Ex}[X_i \ | \ r] = \frac {(r-k)}{n}
    $$
    

  * Therefore $\text{Ex}[X_i]$ is
    $$
    \begin{align*}
    \text{Ex}[X_i]  & = \sum_{r=1}^n  \text{Ex}[X_i \ | \ r] \Pr[r] \\
                    & = \sum_{r=1}^n   \frac {r-k}{n^2} \\
                    & = \frac {(1 - k) + (2-k) + (3-k) + \cdots + (n-k)}{n^2} \\
                    & = \frac {1}{n^2} \cdot \left( \frac {n(n+1)}{2}-nk \right) \\
                    & = \frac {n-2k+1}{2n}
    \end{align*}
    $$
    

## Problem 18.25

Justify each line of the following proof that if $R_1$ and $R_@$ are **independent**, then $\text{Ex}[R_1 \cdot R_2] = \text{Ex}[R_1] \cdot \text{Ex}[R_2]$.

*Proof.*
$$
\begin{align*}
	\text{Ex}[R_1 \cdot R_2] & =  \sum_{r \ \in \text{ range}(R_1 \cdot R_2)} r \cdot \Pr[R_1 \cdot R_2 = r] & (1) \\
	                         & = \sum_{r_i \ \in \text{ range}(R_i)} r_1r_2 \cdot \Pr[R_1 =r_1 \text{ and } R_2 = r_2]  & (2) \\
	                         & = \sum_{r_1 \ \in \text{ range}(R_1)}\sum_{r_2 \ \in \text{ range}(R_2)} r_1r_2 \cdot \Pr[R_1 =r_1 \text{ and } R_2 = r_2] & (3) \\
	                         & = \sum_{r_1 \ \in \text{ range}(R_1)}\sum_{r_2 \ \in \text{ range}(R_2)} r_1r_2 \cdot \Pr[R_1 =r_1] \cdot \Pr[R_2 = r_2] & (4)  \\
	                         & = \sum_{r_1 \ \in \text{ range}(R_1)} \left( r_1\Pr[R_1=r_1] \cdot \sum_{r_2 \ \in \text{ range}(R_2)}  r_2\Pr[R_2=r_2] \right)  & (5) \\
	                         & = \sum_{r_1 \ \in \text{ range}(R_1)} r_1\Pr[R_1=r_1] \cdot \text{Ex}[R_2] & (6)  \\
	                         & = \text{Ex}[R_2]  \cdot \sum_{r_1 \ \in \text{ range}(R_1)} r_1\Pr[R_1=r_1] & (7)   \\
	                         & = \text{Ex}[R_2] \cdot \text{Ex}[R_1] & (8) 
\end{align*}
$$
Justifications:

1. Definition of expected value.
2. As $R_1$ and $R_2$ are independent, the probability $\Pr[R_1 \cdot R_2=r] = \Pr[R_1=r_1 \text{ and } R_2=r_2]$ and $r = r1r2$, as the $\text{range}(R_1 \cdot R_2)$ is the number created by the multiplication of the permutations of $R_1$ and $R_2$.
3. Separating $r_i$ in $r_1$ and $r_2$ and $R_i$ in $R_1$ and $R_2$.
4. As $R_1$ and $R_2$ are independent, $\Pr[R_1=r_1 \text{ and } R_2=r_2] = \Pr[R1=r_1]\cdot\Pr[R_2=r_2]$
5. As $r_1$ and $r_2$ are independent, their can be separated.
6. Definition of expected value.
7. Rearranging terms.
8. Definition of expected value.