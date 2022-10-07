# In-Class Problems Week 11, Wed.

Questions are available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/ded17176cc2597a20234226986a9c774/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp26.pdf);

## Problem 1

* **a)** Your TA has a list of the 12 students in front of him, so he divides the list into consecutive groups of 3. For example, if the list is ABCDEFGHIJKL, the TA would define a sequence of four groups to be $(\{ABC \}, \{DEF\},\{GHI\},\{JKL\})$ . This way of forming groups defines a mapping from a list of twelve students to a sequence of four groups. This is a $k$-to-1 mapping for what $k$?
  $$
  k = 3!^4=1296
  $$

* **b)** A group assignment specifies which students are in the same group, but not any order in which the groups should be listed. If we map a sequence of 4 groups,
  $$
  (\{ABC \}, \{DEF\},\{GHI\},\{JKL\})
  $$
  into a group assignment
  $$
  (\{ABC \}, \{DEF\},\{GHI\},\{JKL\})
  $$
  this mapping is $j$-to-1 for what $j$?

  $j = 1$, this is a bijection from $A$ to $A$.

* **c)** How many group assignments are possible?
  $$
  \binom{12}{3, 3, 3, 3} = \frac{12!}{3!^4} = 369 \ 600
  $$
  
* **d)** In how many ways can $3n$ students be broken up into n groups of $3$?
  $$
  \binom{3n}{3, 3, 3, 3, \dots} = \frac{(3n)!}{3!^n}
  $$
  

## Problem 2

* **a)** There are 30 books arranged in a row on a shelf. In how many ways can eight of these books be selected so that there are at least two unselected books between any two selected books?

  * There is a bijection to 16-bit sequences with exactly eight 1's:

    * Given such a sequence, map each zero to a non­chosen book, each of the first seven 1’s to a chosen book followed by two non­chosen books, and the last 1 to a chosen book.

    $$
    \binom{16}{8} = \frac{16!}{8!8!} = 12 \ 870
    $$

* **b)** How many nonnegative integer solutions are there for the following equality? $ x_1 + x_2 + \cdots + x_ m =k$.

  * There is a bijection to the set of binary strings with $k$ zeroes and $m$ ones, which starts with an one.

    * This the same as having a bijection with  the set of binary strings with $k$ zeroes and $m-1$ ones, which starts with an one, which is the $(k+m-1)$-bit sequences with exactly $(m-1)$ 1's.
      $$
      \binom{k+(m-1)}{m-1} = \frac{k+m-1)!}{k!(m-1)!}
      $$
      

* **c)** How many nonnegative integer solutions are there for the following inequality? $ x_1 + x_2 + \cdots + x_ m \leq k$.

  * There is a bijection to the set of binary strings with $k$ zeroes and $m$ ones, which is the $(k+m)$-bit sequences with exactly $k$ 1's.
    $$
    \binom{k+m}{m} = \frac{(k+m)!}{k!m!}
    $$
    

* **d)** How many length $m$ weakly increasing sequences of nonnegative integers  $\leq k$ are there?

  * There is a bijection between that sequence and the the sequence defined in letter **c)**, so 
    $$
    \binom{k+m}{m} = \frac{(k+m)!}{k!m!}
    $$

## Problem 3

* **a)** In how many ways can you arrange the letters in the word $POKE$?

  * $4! = 24$

* **b)** In how many ways can you arrange the letters in the word $BO_1O_2K$?

  * $4!=24$.

* **c)** Suppose we map arrangements of the letters in BO1O2K to arrangements of the letters in BOOK by erasing the subscripts. Indicate with arrows how the arrangements on the left are mapped to the arrangements on the right.

  ![permutation_book](https://raw.githubusercontent.com/gpm22\ossu-projects\Mathematics for Computer Science\Unit 3 - Counting\permutation_book.png)

* 

## Problem 4

​	

## Problem 5

