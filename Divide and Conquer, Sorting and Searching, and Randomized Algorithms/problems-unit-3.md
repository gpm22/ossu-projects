# Chapter 3 - Divide-and-Conquer Algorithms

Questions available in the book **Algorithms Illuminated Part 1: The Basics** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 3.1

Consider the following pseudocode for calculating ab, where a and b are positive integers:

* `FastPower`:

  * **Input**: positive integers $a$ and $b$. 

  * **Output**: $a^b$

  * **Pseudocode**:

    ```ruby
    if b = 1 then
    	return a
    else
        c := b · b
        ans := FastPower(c, floor(b/2))
    end    
        
    if b is odd then
    	return a · ans
    else
    	return ans
    end
    ```

Assume for this problem that each multiplication and division can be performed in constant time. What is the asymptotic running time of this algorithm, as a function of $b$?

**Answer**

As it divides $b$ by 2 until it becomes $b = 1$ and it call do $O(1)$, the answer is

a) $\Theta(\log b)$.

## Challenge Problems

### Problem 3.2

You are given a **unimodal** array of $n$ distinct elements, meaning that its entries are in increasing order up until its maximum element, after which its elements are in decreasing order. Give an algorithm to compute the maximum element of a unimodal array that runs in $O(\log n)$ time.

### Problem 3.3

You are given a sorted (from smallest to largest) array $A$ of $n$ distinct integers which can be positive, negative, or zero. You want to decide whether or not there is an index $i$ such that $A[i] = i$. Design the fastest algorithm you can for solving this problem.

### Problem 3.4

You are given an $n$-by-$n$ grid of distinct numbers. A number is a **local minimum** if it is smaller than all its neighbors. (A neighbor of a number is one immediately above, below, to the left, or to the right. Most numbers have four neighbors; numbers on the side have three; the four corners have two.) Use the divide-and-conquer algorithm design paradigm to compute a local minimum with only $O(n)$ comparisons between pairs of numbers. (Note: since there are $n^2$ numbers in the input, you cannot afford to look at all of them.)

## Programming Problems

### Problem 3.5

Implement in your favorite programming language the `CountInv` algorithm from Section 3.2 for counting the number of inversions of an array.