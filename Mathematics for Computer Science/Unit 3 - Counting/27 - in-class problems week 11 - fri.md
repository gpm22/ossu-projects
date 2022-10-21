# In-Class Problems Week 11, Fri.

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/ef56ace30d363d9b7799f032cd198143/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp27.pdf).

## Problem 1

* **a)** In a certain Institute of Technology, every ID number starts with a 9. Suppose that each of the 75 students in a class sums the nine digits of their ID number. Explain why two people must arrive at the same sum.
  * Pigeons: ids
  * Pigeonholes: Sum of the nine digits
  * Rule: Same sum
  * Sum varies from 9 to 81, so there 73 possible values of sum.
  * As 75 > 73, there are at least two people with the same sum.
* **b)** In every set of 100 integers, there exist two whose difference is a multiple of 37.
  * Pigeons: Set of difference between 100 integer..
  * Pigeonholes: Set of 0 to 36.
  * Rule: Map integer $k$ to $k \text{ rem } 37$, so $k_1 \text{ rem } 37 = k_2 \text{ rem } 37$.
  * As 100 > 37, there are at least two number whose difference is a multiple of 37.
* **c)** For any five points inside a unit square (not on the boundary), there are two points at distance less than $1/ \sqrt{2}$
  * The greater distance inside a square is the hypotenuse $\sqrt{2}$.
  * You can put 4 points near the vertices, and the distance is at most $\sqrt{2}$.
  * Any place where the 5th point can be will be less than half of the hypotenuse, which is $\sqrt{2}/2 = 1/\sqrt{2}$.
  * In this case the Pigeons are the points, the Pigeonholes are the number of most distant places, which is 4, and the rule is that one point for each distant place.
  * So as there are more pigeons than pigeonholes, there are two points at distance less than $1/ \sqrt{2}$.
* **d)** Show that if $n + 1$ numbers are selected from $\{1,2,3, \dots, 2n \}$, two must be consecutive, that is, equal to $k$ and $k + 1$ for some $k$.
  * Pigeons: $n + 1$ numbers;
  * Pigeonholes: non consecutive numbers;
  * Rule: Match the nearest number.
  * The most non consecutive numbers that can be selected are the odd or even numbers, which are $n$.
  * As there are $n+1$ pigeons and $n$ pigeonholes, two of the selected numbers must be consecutive.

## Problem 2

 A length 10 word containing each of the characters: a, d, e, f, i, l, o, p, r, s, is called a **cword**.

 A password can be a cword which does not contain any of the subwords “fails”, “failed”, or “drop.”

* **a)** How many cwords contain the subword “drop”?

  * The possibilities are 

    ```
    dropxxxxxx, 
    xdropxxxxx, 
    xxdropxxxx, 
    xxxdropxxx, 
    xxxxdropxx, 
    xxxxxdropx, 
    xxxxxxdrop
    ```

    

  * For each possibility exists $6!$ possibilities.

  * The are $(10-4+1)!= 7!$.

* **b)** How many cwords contain both “drop” and “fails”?

  * There are 6 possibilities:

    ```
    dropfailse, 
    dropefails, 
    edropfails,  
    failsdrope, 
    failsedrop, 
    efailsdrop
    ```

* **c)** Use the Inclusion-Exclusion Principle to find a simple arithmetic formula involving factorials for the number of passwords.

  * Number of cwords with failed:

    * Possibilities:

      ```
      failedxxxx,
      xfailedxxx,
      xxfailedxx,
      xxxfailedx,
      xxxxfailed,
      ```

    * There are $(10-6 + 1)! = 5!$.

  * Number of cwords with fails: There are $(10-5 + 1)! = 6!$.

  * The number of passwords are the total less the ones containing fails, failed and drop:
    $$
    10! - 7! - 6! - 5! + 6 = 3622926
    $$

## Problem 3

How many paths are there from point (0, 0) to (50, 50) if each step along a path increments one coordinate and leaves the other unchanged? How many are there when there are impassable boulders sitting at points (10, 11) and (21, 20)? 

They are needed 100 steps to go from (0, 0) to (50, 50), if each step along a path increments one coordinate and leaves the other unchanged.

As there are 50 possible choices, there are $\binom{100}{50}$ possible paths.

In the case with impassable boulders in (10, 11) and (21, 20):

There are $\binom{20}{10}$ ways to go from (0, 0) to (10, 10), $\binom {19} {10}$ ways to go from (11, 10) to (20, 20), and $\binom {60} {30}$ ways to go from (20, 21) to (50, 50), so there are
$$
\binom {20} {10} \cdot \binom {19} {10} \cdot \binom {59} {30} = 1009233854658458648157754816
$$


## Problem 4

## Problem 5

