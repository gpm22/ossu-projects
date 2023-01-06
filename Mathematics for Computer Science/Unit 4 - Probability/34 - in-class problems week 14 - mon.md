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

The Weak Law of Large Numbers can be expressed as a logical formula of the form: 
$$
\forall \epsilon > 0 \ Q_1 \ Q_2 \dots [f(n, e) \geq 1 - \delta]
$$
Where
$$
f(n, \epsilon) ::= \Pr[| \sum_{i=1}^n G_i/n - \mu| \leq \epsilon]
$$
and $G_1, G_2, G_3, \dots$ are an infinite sequence of pairwise independent random variables with the same expectation $\mu$ and the same finite variance.

Write out the proper sequence $Q_1 \ Q_2 \dots$.

* Manipulating the Pairwise Independent Sampling we got:
  $$
  \Pr[|S_n/n -\mu| \leq x] \geq 1- \sigma^2/(nx^2)
  $$
  

* The Weak Law of Large Numbers is:
  $$
  \lim_{n \to \infty} \Pr[|S_n/n-\mu| \leq \epsilon] = 1
  $$

* So $\delta = \sigma^2/(n x^2)$.

* Then $Q_1 = \forall n$ and $Q_2 = \exist \delta \geq 0$.

* Therefore:
  $$
  \forall \epsilon > 0 \ \forall n \ \exist \delta \geq 0 \ [f(n, e) \geq 1 - \delta]
  $$

## Problem 4

Write a brief explanation to these befuddled editors explaining what’s wrong with their reasoning and how it could be that all 20 published studies were wrong.

**Answer**

They interpret the results as being random variables, but they are not. The confidence level is about the statistical method used and not the result itself. Also the confidence level is about each study and not the overall studies. Finally, they have done the tribunal fallacy, as they considered the number of wrong reports would be 5%.

## Problem 5

 How would you explain to the judge why the number of randomly selected cars that have to be checked for speeding does not depend on the number of recorded trips?

**Answer**

The random selected trips are a representation of all recorded trips, so both have similar distributions, which the differences are taken in count in the confidence level and in the margin error.

Bigger the number of randomly selected trips, bigger the confidence level and smaller the margin error, but at some point increasing the selected trips will increase more the effort than the gains. 

Therefore, the total number of recorded trips are not relevant.

## Problem 6

**Theorem** (Generalized Pairwise Independent Sampling) Let $X_1, X_2, \dots$ be a sequence of pairwise independent random variables such that $\text{Var}[X_i] \leq b$ for some $b \geq 0$ and all $i \geq 1$. Let
$$
A_n ::= \frac {X_1 + X_2 + \cdots + X_n }{n} \\
\mu_n ::= \text{Ex}[A_n]
$$
Then for every $\epsilon > 0$,
$$
\Pr[|A_n - \mu_n| \geq \epsilon] \leq \frac {b}{\epsilon ^2} \cdot \frac 1 n
$$


* **a)** Prove the Generalized Pairwise Independent Sampling Theorem.

  * First we need the variance of $A_n$:
    $$
    \begin{align*}
    	\text{Var}[A_n] & = \text{Var}\left[\frac {X_1 + X_2 + \cdots + X_n }{n} \right] \\
    					& = \frac 1 {n^2} \text{Var}[X_1 + X_2 + \cdots + X_n] \\
    					& = \frac 1 {n^2} \sum_{i=1}^n \text{Var}[X_i] \\
    					& \leq \frac 1 {n^2} \cdot nb \\
    					& = \frac bn
    \end{align*}
    $$
    

  * So applying the Chebyshev's Theorem we got:
    $$
    \begin{align*}
    	\Pr[|A_n - \mu_n| \geq \epsilon] & \leq \frac {\text{Var}[A_n]} {\epsilon^2} \\
    	                                 & \leq \frac {b}{\epsilon ^2} \cdot \frac 1 n
    \end{align*}
    $$
    

* **b)** Conclude that the following holds

  * Corollary (Generalized Weak Law of Large Numbers). For every $\epsilon > 0$, 
    $$
    \lim_{n \to \infty} \Pr[|A_n - \mu_n| \leq \epsilon] = 1
    $$
    

  * When $n$ goes to infinity, the $\Pr[|A_n - \mu_n| \geq \epsilon]$ goes to zero, therefore $\Pr[|A_n - \mu_n| \leq \epsilon]$ must be 1.