# In-Class Problems Week 12, Wed.

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/e27b72c14eb731f7c9d9acb9b3ba61cc/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp29.pdf).

## Problem 1

If a person will suffer from Beaver Fever, the probability that Dr. Meyer diagnoses this is 0.99. 

If a person will not suffer from Beaver Fever, the probability that Dr. Meyer diagnoses this is 0.97.

* **a)**

  * $\Pr[B] = \frac{1}{1000}$
  * $\Pr[Y \ | \ B] = 0.99$
  * $\Pr [\overline Y \ | \ \overline B] = 0.97$

* **b)**

  * $\Pr[\overline B] = 1 - \Pr[B]$
  * $\Pr[Y \ | \ \overline B] = 1 - \Pr[ \overline Y \ | \ \overline B ]$

* **c)**
  $$
  \Pr [Y] = \Pr[Y \ | \ B] \cdot \Pr[B] + \Pr[Y \ | \ \overline B] \cdot \Pr[\overline B]
  $$
  

* **d)**
  $$
  \Pr[B \ | \ Y] = \frac {\Pr[Y \ | \ B] \cdot \Pr[B]} {\Pr[Y \ | \ B] \cdot \Pr[B] + (1 - \Pr[ \overline Y \ | \ \overline B ]) \cdot (1 - \Pr[B])} \approx 0.03198
  $$
  

* **e)** 

  * We need to know $\Pr [Y]$
    $$
    \Pr [Y] = \Pr[Y \ | \ B] \cdot \Pr[B] + (1 - \Pr[ \overline Y \ | \ \overline B ]) \cdot (1 - \Pr[B]) = 0.03096
    $$

  * So, 3.096 % of the population will test positive.

    * These, 99 % will have indeed the disease, so this is 3.06504 % of population  
    * The percentage of people that can be vaccinated and the vaccine is irrelevant is 
      * 0.03096% of population

  * 2% will be vaccinated. 

  * If he vaccinate the irrelevant, 64.24% of the needed population will be vaccinated.

  * If he vaccinate only the ones in need, it will be 65.25% of the needed population vaccinated.

## Problem 2

**Tree Diagram**

```
 First		     Second            Name said		Probability         F is 		Sauron 
Released        Released          By the guard						   cited		leave
	
                       F 
            -------. -------- . ------ F-----.			1/12			yes
           /        \         \ 1/2
          /        S \ 1/2     \-------V----.			1/12
         /            \ 
        /              . ------------- V----.			1/6							yes
       /
   V  / 1/3
     / 
    /                  .-------------- F----.			1/12			yes
   /                  / \
  /               V  /   \-------------V----.			1/12
 /      F           /  
. --------------  . 
 \                  \
  \                S \ 
   \                  \ 
    \                  .---------------F---.			1/6				yes			yes
     \ 
    S \
       \
        \               .--------------V---.			1/6							yes
         \            / 
          \       V  /
           \        /   F 
            \ -----. -------- .--------F----.			1/6				yes			yes

```

$\Pr[S \cap F] = 1/3$

$\Pr[F] = 1/2$
$$
\Pr[S \ |  \ F] = \frac{\Pr[S \cap F]}{\Pr[F]} = \frac 23
$$
 The probability does not change.

## Problem 3

**Diagram Tree**

```
Selected	Eight of hearts      Probability
  Deck		   selected
  
  		   /--------.				1/104
  		Y / 1/52			
        . ------N----.				51/104
       /      51/52
      /
   C / 1/2
    .
     \
   I  \ 1/2
   	   \      50/51
   	    .  ----N---.                   50/102
   	     \   1/51
   	     Y \-------.                    1/102
```

$\Pr [C \cap Y]  =  1/104$

$\Pr[Y] = 1/104 + 1/102$
$$
\Pr[C \ |  \ Y] = \frac{\Pr[C \cap Y]}{\Pr[Y]} = \frac {51}{103}
$$

## Problem 4

Assume $\Pr[A]$ as the probability of that HTT comes before HHT, by the law of total probability:
$$
\Pr[A] = \Pr[A \ | \ H] \cdot \Pr[H] + \Pr[A \ | \ T] \cdot \Pr[T] = \frac {\Pr[A \ | \ H]}{2} + \frac {\Pr[A \ | \ T]}{2}
$$
Any tails before HTT or HTT does not change their relative probability, so $\Pr[A] = \Pr[A \ | \ T]$, which results in $\Pr[A \ | \ T] = \Pr[A \ | \ H]$.

Extending $\Pr[A \ | \ H]$:
$$
\Pr[A \ | \ H] = \Pr[A \ | \ HH] \cdot \Pr[H] + \Pr[A \ | \ HT] \cdot \Pr[T] = \frac {0} {2} + \frac {\Pr[A \ | \ HT]} {2}
$$
There $\Pr[A \ | \ HT] = 2 \Pr[A \ | \ H]$. Now we extend $\Pr[A \ | \ HT]$:
$$
\Pr[A \ | \ HT] = \Pr[A \ | \ HTH] \cdot \Pr[H] + \Pr[A \ | \ HTT] \cdot \Pr[T] = \frac {1} {2} + \frac {\Pr[A \ | \ H]} {2}
$$
Substituting  $\Pr[A \ | \ HT]$ as  $2 \Pr[A \ | \ H]$:
$$
2\Pr[A \ | \ H] = \frac {1} {2} + \frac {\Pr[A \ | \ H]} {2}
$$
Therefore $\Pr[A] = \Pr[A \ | \ H] = 1/3$.





