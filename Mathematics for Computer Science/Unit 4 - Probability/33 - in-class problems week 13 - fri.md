# In-Class Problems Week 13, Fri.

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/b9170e02e870aa02f242a70b66f0cf34/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp33.pdf).

## Problem 1

* **a)** Use Markov’s Bound to prove that at most 3/4 of the cows could survive.

  * Lets define $R = T - 70$, so we want to know the probability of $R$ to be more than 20.

  * We have $\text{Ex}[R] = 15$, then
    $$
    \Pr[R \geq 20] \leq \frac {\text{Ex}[R]}{20} = \frac {15}{40} = \frac 34
    $$

* **b)**  Suppose there are 400 cows in the herd. Show that the bound from part **a)** is the best possible by giving an example set of temperatures for the cows so that the average herd temperature is 85 and 3/4 of the cows will have a high enough temperature to survive.

  * We let the 85 surviving cows with temperature 90 and the others with temperature 70, which is the lowest possible.

* **c)** Notice that the results of part **b)** are purely arithmetic facts about averages, not about probabilities. But you verified the claim in part **a)** by applying Markov’s bound on the deviation of a random variable. Justify this approach by regarding the temperature, $T$ , of a cow as a random variable. Carefully specify the probability space on which $T$ is defined: what are the outcomes? what are their probabilities? Explain the precise connection between properties of $T$ and average herd temperature that justifies the application of Markov’s Bound.

  * We define $T$ as having two possible outcomes:
    * 70 with probability 1/4
    * 90 with probability 3/4.
  * In that case we have $\text{Ex}[T]=85$ as desired.
  * The connection is that the Markov's Bound defines the situation where all the values above will have that same value, as we defined $T$ here.

## Problem 2

* **a) **What is the expected number of hands the gambler wins in a day?
  $$
  \text{Ex}[W] = \frac 16 \cdot 120 + \frac 12 \cdot 60 + \frac 15 \cdot 20 = 54
  $$

* **b)** What would the Markov bound be on the probability that the gambler will win at least 108 hands on a given day?
  $$
  \Pr[W \geq 108] \leq \frac {\text{Ex}[W]}{108} = \frac{54}{108} = \frac 12
  $$

* **c)**  Assume that the outcomes of the card games are pairwise, but possibly not mutually, independent. What is the variance of the number of hands won per day?
  $$
  \begin{align*}
  	\text{Var}[W] & = \text{Var}[W_{dp} + W_{bj}+W_{sp}] \\
  	              & = \text{Var}[W_{dp}]+ \text{Var}[_{bj}] + \text{Var}[W_{sp}] \\
  	              & = 120 \cdot \frac 16 \cdot \frac 56 + 60 \cdot \frac 12 \cdot \frac 12 + 20 \cdot \frac 15 \cdot \frac 45 \\
                    & = \frac{50}{3} + 15+ \frac {16}{5} \\
                    & = \frac {523}{15} \\
                    & \approx 34.87
                    
  \end{align*}	
  $$
  
* **d)** What would the Chebyshev bound be on the probability that the gambler will win at least 108 hands on a given day? You may answer with a numerical expression that is not completely evaluated.
  $$
  \Pr[|R-\text{Ex}[R]| \geq 54 ] \leq \frac {\text{Var}[R]}{54^2} = \frac {523}{15 \cdot 2916} = \frac{523}{43740} \approx 0.01196
  $$
  

## Problem 3

* **a)** What is the expected number of people who get their own hat back?
  $$
  \text{Ex}[S_n] = \text{Ex}[\sum_{i=1}^nX_i] = \sum_{i=1}^n\text{Ex}[X_i] = \sum_{i=1}^n \frac 1n = 1
  $$

* **b)** Write a simple formula for $\text{Ex}[X_i \cdot X_j]$ for $i \neq j$.
  $$
  \text{Ex}[X_i \cdot X_j] = \frac 1 {n(n-1)}
  $$

* **c)** Explain why you cannot use the variance of sums formula to calculate $\text{Var}[S_n]$.

  * Because the $X$'s are not pairwise independent.

* **d)** Show that $\text{Ex}[(S_n)^2]=2$
  $$
  \begin{align*}
  \text{Ex}[(S_n)^2] & = \sum_{i=1}^n\text{Ex}[X_i^2] + \sum_{i=1}^n\sum_{j \neq i}^n\text{Ex}[X_i \cdot X_j] \\
                     & = \sum_{i=1}^n\text{Ex}[X_i] + n(n-1) \cdot \frac 1 {n(n-1)} \\
                     & = 1 + 1 \\
                     & = 2
  \end{align*}
  $$
  
* **e)** What is the variance of $S_n$? 
  $$
  \text{Var}[S_n] = \text{Ex}[S_n^2] - \text{Ex}^2[S_n] = 2 - 1 = 1
  $$
  
* **f) **Show that there is at most a 1% chance that more than 10 people get their own hat back
  $$
  \Pr[|S_n - \text{Ex}[S_n]| \geq (11 - 1) = 10] \leq \frac{\text{Var}[S_n]}{100} = \frac 1 {100} = 0.01
  $$
  

## Problem 4

* **a)** Let $m$ be the probability that any given triangle, $T$ , is monochromatic. Write a simple formula for $m$ in terms of $r$, $b$, and $g$.
  $$
  m = r^3 + b^3 + g^3
  $$

* **b)** Let $I_T$  be the indicator variable for whether $T$ is monochromatic. Write simple formulas in terms of  $m$, $r$, $b$, and $g$ for $\text{Ex}[I_T]$ and $\text{Var}[I_T]$.

  * $\text{Ex}[I_T] = m = r^3 + b^3 + g^3$
  * $\text{Var}[I_T] = m(1-m)$

Let $T$ and $U$ be distinct triangles.

* **c)** What is the probability that $T$ and $U$ are both monochromatic if they do not share an edge?. . . if they do share an edge? 

  * Not sharing an edge case:

    * In this case they can be treated as independent triangles, as the coloring is independent.
    * Therefore the probability is $m^2$.

  * Sharing an edge case:

    * In this case both must have the same color, so we need that 5 edges having the same color.

    * Therefore the probability is:
      $$
      r^5 + b^5 + g^5
      $$
      

Now assume $r = b = g = \frac 13$.

* **d)** Show that $I_T$ and $I_U$ are independent random variables. 

  * If they are independent, then $\Pr[I_T \cap I_U] = \Pr[I_T] \cdot \Pr[I_U]$.

  * This is trivial in the case where $T$ and $U$ do not share an edge.

  * Now let verify in the case where they share:
    $$
    \Pr[I_T \cap I_U] = r^5 + b^5 + c^5 = \frac {3}{3^5} = \frac 1 {3^4} = \frac 1 {3^2} \cdot \frac 1{3^2} = \frac {3} {3^3} \cdot \frac 3{3^3} = m \cdot m = m^2
    $$

  * Therefore $I_T$ and $I_U$ are independent random variables.

* **e)** Let $M$ be the number of monochromatic triangles. Write simple formulas in terms of $n$ and $m$ for $\text{Ex}[M]$ and $\text{Var}[M]$.

  * The number of triangles in a complete graph is $\binom n3$.

  * As they are independent:

    * $\text{Ex}[M] = \binom n 3 \cdot m$.

    * $$
      \begin{align*}
      	\text{Var}[M] & = \text{Var}[T_1 + T_2 + \cdots + T_i] \\
      	              & = \text{Var}[T_1] + \text{Var}[T_2] + \cdots + \text{Var}[T_i] \\
      	              & = m(1-m) + m(1-m) + \cdots + m(1-m) \\
      	              & = \binom n 3 \cdot m(1-m)
      \end{align*}
      $$

      

* **f)** Let $\mu ::= \text{Ex}[M]$. Use Chebyshev's Bound to prove that $\Pr[|M-\mu| > \sqrt{\mu \log \mu}] \leq 1/\log \mu$.
  $$
  \begin{align*}
  \Pr[|M-\mu| \geq \sqrt{\mu \log \mu}] & \leq \frac{\text{Var}[M]}{(\sqrt{\mu \log \mu})^2}  \\
  & = \frac {\binom n 3 \cdot m(1-m)}{\mu \log \mu} \\
  & = \frac {\mu (1-m)}{\mu \log \mu} \\
  & = \frac {(1-m)}{\log \mu} \\
  & < \frac 1 {\log \mu}
  \end{align*} 
  $$
  

* **g)** Conclude that $\lim_{n \to \infty} \Pr[|M - \mu| > \sqrt{\mu \log \mu}] = 0$.

  * $\lim_n \to \infty$ results in $\lim_{\mu \to \infty}$, therefore:
    $$
    \begin{align*}
    	\lim_{n \to \infty} \Pr[|M - \mu| > \sqrt{\mu \log \mu}] & = \lim_{\mu \to \infty} \Pr[|M - \mu| > \sqrt{\mu \log \mu}] \\
    	& \leq 1/\log \mu \\
    	& = 0
    	
    \end{align*}
    $$

  * It must be exactly zero as probabilities are always nonnegative.

## Problem 5

Let $R$ be a positive integer valued random variable.

* **a)** If $\text{Ex}[R] = 2$, how large can $\text{Var}[R]$ be?

  * Can be infinitely large.

  * A example is $R$ being $10^{100}$ with probability $1/(10^{100}-1)$ or 1 with probability $(10^{100}-2)/(10^{100}-1)$:

    * $\text{Ex}[R] = (10^{100} + 10^{100} -2 )/(10^{100}-1) = 2$

    * $|R - \text[R]|^2$ is $\approx 10^{200}$ with probability $1/(10^{100}-1)$ or 1 with probability $(10^{100}-2)/(10^{100}-1)$, wherefore the variance is:
      $$
      \begin{align*}
      \text{Var}[R] & = \frac {100^{200} + 10^{100} - 2 }{10^{100}} \\
                    & \approx 100^{100} 
      \end{align*}
      $$
      Which is really large.

* **b)** How large can $\text{Ex}[1/R]$ be?

  * Not much as $0 < 1/R \leq 1$.

* **c)** If $R \leq 2$, that is, the only values of $R$ are 1 and 2, how large can $\text{Var}[R]$ be?

  * Not much, as all the possible values are close to the main value.