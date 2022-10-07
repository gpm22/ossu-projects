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

  ![permutation_book](https://raw.githubusercontent.com/gpm22/ossu-projects/main/Mathematics%20for%20Computer%20Science/Unit%203%20-%20Counting/permutation_book.png)

* **d**) What kind of mapping is this, young grasshopper?

  * 2-to-1 mapping.

* **e)** In light of the Division Rule, how many arrangements are there of BOOK?

  * $24/2 = 12$

* **f)** Very good, young master! How many arrangements are there of the letters in $KE_1E_2PE_3R$?

  * $6! = 720$

* **g)** Suppose we map each arrangement of $KE_1E_2PE_3R$ to an arrangement of $KEEPER$ by erasing subscripts. List all the different arrangements of $KE_1E_2PE_3R$ that are mapped to $REPEEK$ in this way.
  $$
  RE_1PE_2E_3K \\
  RE_1PE_3E_2K \\
  RE_2PE_3E_1K \\
  RE_2PE_1E_3K \\
  RE_3PE_2E_1K \\
  RE_3PE_1E_2K \\
  $$

* **h)** What kind of mapping is this?

  * 6-to-1 mapping

* **i)** So how many arrangements are there of the letters in KEEPER?

  * $720/6 = 120$

* **j)** How many arrangements of $BO_1O_2K_1K_2E_1E_2PE_3R$ are there?

  * $10! = 3 \ 628 \ 800$

* **k)** How many arrangements of $BOOK_1K_2E_1E_2PE_3R$ are there?

  * $10!/2 = 1 \ 814 \ 400$

* **l)** How many arrangements of $BOOKKE_1E_2PE_3R$ are there?

  * $10!/(2 \cdot 2) = 907 \ 200$

* **m)** How many arrangements of $BOOKKEEPER$ are there?

  * $10!/(2 \cdot 2 \cdot 6) = 151 \ 200$

* **n)** How many arrangements of $VOODOODOLL$ are there?

  * $10!/(5! \cdot 2! \cdot 2!) = 7 \ 560$

* **o)** How many length 52 sequences of digits contain exactly 17 two’s, 23 fives, and 12 nines?

  * $52!/(17! \cdot 23! \cdot 12!) = 1.8312536e+22$

## Problem 4

Find the coefficients of

* **a)** $x^5 \text{ in } (1+ x)^{11}$
  $$
  \binom{11}{5} = \frac{11!}{6!5!} = 462
  $$
  

* **b)** $x^8y^9 \text{ in } (3x+ 2y)^{17}$
  $$
  \binom{17}{9} \cdot 3^8 \cdot 2^9 = \frac{17! \cdot 3^8 \cdot 2^9}{9!8!} = 81 \ 662 \ 929 \ 920
  $$
  

* **c)** $a^6b^6 \text{ in } (a^2+ b^3)^{5}$
  $$
  \binom{5}{2} = \frac{5!}{3!2!} = 10
  $$

## Problem 5

* **a)** An independent living group is hosting nine new candidates for membership. Each candidate must be assigned a task: 1 must wash pots, 2 must clean the kitchen, 3 must clean the bathrooms, 1 must clean the common area, and 2 must serve dinner. Write a multinomial coefficient for the number of ways this can be done.

  * There is $24$-to$-1$ mapping between this set and the sequence of 9 distinct letters.

  * Multinomial coefficient:
    $$
    \binom{9}{1, 1, 2, 2, 3} = \frac{9!}{1!1!2!2!3!} = 15 \ 120 
    $$
    

* **b)** How many nonnegative integers less than 1,000,000 have exactly one digit equal to 9 and have a sum of digits equal to 17?

  * 2-6 digits, 1 digit is 9 and the sum of the others must be 8.

  * There is a relation $1$-to-$6$ between this set and the set of binary strings with 5 ones and 8 zeros, where the first digit is 1.

    * The ones represent the location of the digits in the number, and the zeros the value of the numbers, so 17 is $1111010000000$ and 12320 is $1010010001001$.

  * $$
    6 \cdot \binom{8 + 5}{5} = 7722
    $$

    

