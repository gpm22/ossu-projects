# In-Class Problems Week 10, Fri.

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/a8f489dbf906584241aec7db98a02cc0/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp25.pdf).

## Problem 1

* **a)** How many of the billion numbers in the range from $1$ to $10^9$ contain the digit 1? (Hint: How many don’t?)

  * Basically we have to sum the numbers with 1 digit, 2 digits, ..., 9 digits which do not contain the digit 1 and then subtract that value from $10^9$.

  * This sum will be:
    $$
    & | \{2, \dots, 9 \}| + | \{2, \dots, 9 \}| \cdot | \{0, 2, \dots, 9 \}| + | \{2, \dots, 9 \}| \\
    & \cdot | \{0, 2, \dots, 9 \}|^2 + \dots + | \{2, \dots, 9 \}| \cdot | \{0, 2, \dots, 9 \}|^8  \\
     = &  | \{2, \dots, 9 \}| \left( 1 + | \{0, 2, \dots, 9 \}| + | \{0, 2, \dots, 9 \}|^2 + \dots +| \{0, 2, \dots, 9 \}|^8 \right )
    $$

  * This sum is a geometric sum, then:
    $$
    | \{2, \dots, 9 \}| \left( \frac{1-|\{0, 2, \dots, 9 \}|^9}{1-|\{0, 2, \dots, 9 \}|} \right) = 8\left( \frac{1-9^9}{1-9|} \right) =  9^9-1
    $$
    

  * Now the subtraction:
    $$
    10^9 - (9^9 - 1) = 10^9 - 9^9 + 1 = 612579512
    $$
    

* **b)** There are 20 books arranged in a row on a shelf. Describe a bijection between ways of choosing 6 of these books so that no two adjacent books are selected and 15-bit strings with exactly 6 ones.

  * First you create a 20-bit string, where the selected books are 1, as example:

    ```
    1 0 1 0 1 0 1 0 1 0 1 0 0 0 0 0 0 0 0 0
    ```

  * Second you transform each pair of zeros in one zero:

    ```
    1 0 1 0 1 0 1 0 1 0 1 0 0 0 0 0
    ```

  * If the result is not 15-length, eliminate a zero from trio of zeroes:

    ```
    1 0 1 0 1 0 1 0 1 0 1 0 0 0 0
    ```

## Problem 2

* **a)** Describe a procedure for reconstructing a numbered tree from its code;

  * First you look up for the number of the times each of the two remaining leaves appear in the code, that number will be numbers of leaves each remaining leave has. So we add theses leaves to the remaining leaves.
  * We know that the numbers that are missing in the code are just leaves.
  * We number the leaves from the from the biggest to the smallest.
  * After number a leaf, we eliminate its appearance in the code.
  * If there is a leaf in the  code which is not numbered yet, it means that it has a father and sons, so we add that leaf to leaf which appears after it in the code. Then we remove both from the code.
  * Then we number the other leaves and remove then from the code.

* **b)** Conclude there is a bijection between the $n$-vertex numbered trees and $\{ 1, \dots, n \} ^{n-2}$, and state how many $n$-vertex numbered trees there are.

  * A $n$-vertex numbered tree can be defined by its code solely.

  * The code is the a sequence of $n - 2$ integers from $1$ to  $n$.

  * The set $\{ 1, \dots, n \} ^{n-2}$ is the set of creating a sequence with $1, \dots, n$ with $n-2$ places, thenthe code is the bijection between the $n$-vertex numbered trees and this set.

  * Therefore the number of $n$-vertex numbered trees are:
    $$
    \{ 1, \dots, n \} ^{n-2} = |\{ 1, \dots, n \}| ^{n-2} = n^{n-2}
    $$

## Problem 3

## Problem 4

