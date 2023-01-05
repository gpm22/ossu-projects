# In-Class Problems Week 14, Mon.

Problems available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/b7be7d68c4152657a6f9dbc9e4aebab4/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp34.pdf).

## Problem 1

* **a)** What is the largest variance an indicator variable can have?

  * The variance of a indicator variable is $\text{Var}[I] = p-p^2$

  * The largest value will happen when the derivative is zero:
    $$
    \begin{align*}
    	\frac {d \text{Var[I]}}{dp} & = \frac {d} {dx}(p-p^2) \\
    								& = 1 - 2p \\
    								& = 0
    \end{align*}	
    $$
    

  * So the maximum happens at $p= 1/2$.

  * Therefore the largest variance for an indicator variable is 1/4.

* **b)** Use the Pairwise Independent Sampling Theorem to determine a confidence level with which Gallup can make his claim.
  $$
  \Pr \left[ \left| \frac{S_n} n - \mu \right| \geq 0.03 \right] \leq \frac 1n \left(\frac \sigma {0.03} \right)^2 =  \left( \frac {1}{1928} \right) \cdot  \left( \frac {1/2}{0.03}\right)^2 = \left( \frac {1}{1928} \right) \cdot  \left( \frac {50}{3}\right)^2 = \frac {2500}{9 \cdot 1928} = 0.144
  $$

  * The confidence level is 14.4%.

* **c)** Gallup actually claims greater than 99% confidence in his estimate. How might he have arrived at this conclusion? (Just explain what quantity he could calculate; you do not need to carry out a calculation.)

  * It used the Binomial Sampling.

* **d)** Accepting the accuracy of all of Gallup’s polling data and calculations, can you conclude that there is a high probability that the percentage of adult Americans who believe in evolution is $35 \pm 3$ percent?

  * No, this percentage is not a random variable, so it meaningless to say that it has the probability of having some value.

## Problem 2

* **a)** What are $\text{Ex}[E_{i,j}]$ and $\text{Var}[E_{i,j}]$  for $i \neq j$?

  *  $\text{Ex}[E_{i,j}] = 1/d$
  * $\text{Var}[E_{i,j}] = (d-1)/d^2$

* **a)** What are $\text{Ex}[D]$ and $\text{Var}[D]$?

  *  $\text{Ex}[D]$
    $$
    \begin{align*}
      	\text{Ex}[D] & = \text{Ex} \left[ \sum_{1 \leq i \leq j \leq n} E_{i,j} \right] \\
      				 & = \sum_{1 \leq i \leq j \leq n} \text{Ex} [E_{i,j}] \\
      				 & = \binom n 2 \cdot \frac 1d
      \end{align*}
    $$
    

  *  $\text{Var}[D]$
    $$
    \begin{align*}
      	\text{Var}[D] & = \text{Var} \left[ \sum_{1 \leq i \leq j \leq n} E_{i,j} \right] \\
      				 & = \sum_{1 \leq i \leq j \leq n} \text{Var} [E_{i,j}] \\
      				 & = \binom n 2 \cdot \left( \frac {d-1}{d^2} \right)
      \end{align*}
    $$

* **c)** ) In a 6.01 class of 500 students, the youngest student was born 15 years ago and the oldest 35 years ago. Show that more than half the time, there will be will be between 12 and 23 pairs of students who have the same birth date. (For simplicity, assume that the distribution of birthdays is uniform over the 7305 days in the two decade interval from 35 years ago to 15 years ago.)

  * $\text{Ex}[D]$
    $$
      	\text{Ex}[D] = \binom n 2 \cdot \frac 1d \approx 17.077
    $$
    

  * $\text{Var}[D]$
    $$
    \text{Var}[D] = \binom n 2 \cdot \left( \frac {d-1}{d^2} \right) \approx 17.075
    $$

  *  As $|23 - 17.077| = 5.923$  and $|12 - 17.077| = 5.077$, $x = 5$

  * $\Pr[|D - \text{Ex}[D]| \geq 5]  \leq \frac {\text{Var}[D]}{36} \approx 0.683$

## Problem 3

## Problem 4

## Problem 5

## Problem 6