# In-Class Problems Week 9, Fri.

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/eabc76e9ecd3f7eda8d0e9dd0d2a4dc4/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp23.pdf).

## Problem 1

* **a)** Describe a closed-form formula for the amount of wine in the first glass after $n$ back-and-forth pourings.

  * Open form
    $$
    \sum_{i=1}^n \frac{4^{i-1}}{3^{2i-1}} = \frac{3}{4} \sum_{i=1}^n \left(\frac{4}{9}\right)^i
    $$
    
  * Closed form
    $$
    \frac{3}{4}\left( \frac{1-(4/9)^{n+1}}{1-(4/9)} \right)-\frac{3}{4}
    $$
    or
    $$
    \frac{12-27(4/9)^{n+1}}{20}
    $$
    
  
* **b)** What is the limit of the amount of wine in each glass as $n$ approaches infinity?

  * Glass of water $= \frac{12}{20} = 0.6$

  * Glass of wine $= 0.4$

    

## Problem 2

* **a)** What is the most distant point that the explorer can reach and then return to the oasis, with no water precached in the desert, if she takes a total of only 1 gallon from the oasis?

  * $1/2$ day, as she needs to go there and back in a day.

* **b)** What is the most distant point the explorer can reach and still return to the oasis if she takes a total of only 2 gallons from the oasis? No proof is required; just do the best you can.

  * $3/4$ day, as she needs to cache $1/2$ of the first bottle and use $1/2$ of the first bottle to go the cache point and back. She will use $1/4$ of the second bottle to get to the cache point and fill up the second bottle. Then she will use $1$ bottle to get the grail and back to cache point, then $1/4$ to get back at the oasis.

* **c)** The explorer will travel using a recursive strategy to go far into the desert and back, drawing a total of $n$ gallons of water from the oasis. Her strategy is to build up a cache of $n - 1$ gallons, plus enough to get home, a certain fraction of a day’s distance into the desert. On the last delivery to the cache, instead of returning home, she proceeds recursively with her $n - 1$ gallon strategy to go farther into the desert and return to the cache. At this point, the cache has just enough water left to get her home. Prove that with $n$ gallons of water, this strategy will get her $H_n/2$ days into the desert and back, where $H_n$ is the $n$th Harmonic number.

  * The idea is to let the most possible water cached at each travel, so the first travel is the shorter one and the last one is the largest. Each bottle will be used to go further. At each cache point the bottle will fill up the value from the last cache point to the actual cache point. But each already created cache point will be used twice at at travel. That way $1/2 + 1/4 + 1/6 + \dots + 1/(2n)$, which is $H_n/2$.
  * As $H_n$ does not converge, it is possible to reach the shrine regardless its distance.

* **d)** ) Suppose that the shrine is $d = 10$ days walk into the desert. Use the asymptotic approximation $H_n  \sim \text{ln}(n)$ to show that it will take more than a million years for the explorer to recover the Holy Grail.
  $$
  D = 10 = H_n/2 \sim \text{ln}(n)/2 \\
  n = e^{20} \sim 485165195 \\
  n / 365 \sim 1329219
  $$
  As each travel takes a day and each years has 365 days, will be needed more than $10^6$ years.

## Problem 3

## Problem 4

* **a)** What is the client’s debt at the end of the first day?
  $$
  (m + f)*p
  $$
  

* **b)**  What is the client’s debt at the end of the second day?
  $$
  ((m + f)*p +f)*p = (m+f)* p^2 + f*p
  $$
  

* **c)** Write a formula for the client’s debt after d days and find an equivalent closed form.

  * Open form
    $$
    D(n) = mp^n + f \sum_{i=1} ^n p^i
    $$
    

  * Closed form
    $$
    D(n) = \frac{mp^n + fp - (m+f)p^{n+1}}{1-p}
    $$
    

* **d)** If you borrowed $10 from Sammy for a year, how much would you owe him?
  $$
  $749.35
  $$
  

## Problem 5

Fin a closed-form expression for the following sum using the perturbation method:
$$
T = z + 2z^2 + 3z^3 + \dots + nz^n
$$
**Answer**:

Multiplying $T$ by $z$:
$$
zT = z^2 + 2z^3 + 3z^4 + \dots + (n-1)z^{n} + nz^{n+1}
$$
Subtracting $zT$ from $T$:
$$
T-zT & = & z + (2-1)z^2 + (3-2)z^3+ \dots + (n - (n-1))z^n-nz^{n+1} \\
& = & z + z^2 + z^3 + ... +z^n - nz^{n+1}
$$
Knowing that $1 + z + z^2 + ... z^n$ is equal to 
$$
\frac{1-z^{n+1}}{1-z}
$$
The subtraction is now:
$$
T - zT & = & \frac{1-z^{n+1}}{1-z} -1 - nz^{n+1}  \\
& = & \frac{1-z^{n+1} -1 + z - nz^{n+1} + nzz^{n+1} }{1-z} \\
& = & \frac{-z^{n+1}+ z - nz^{n+1} + nzz^{n+1} }{1-z} \\
& = & \frac{ z + (nz-n-1)z^{n+1} }{1-z}
$$
Therefore:
$$
T = \frac{ z + (nz-n-1)z^{n+1} }{(1-z)^2}
$$

$$

$$
