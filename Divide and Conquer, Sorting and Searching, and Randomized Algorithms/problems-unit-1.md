# Chapter 1 - Introduction

Questions available in the book **Algorithms Illuminated Part 1: The Basics** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 1.1

Suppose we run `MergeSort` on the following input array: `5, 3, 8, 9, 1, 7, 0, 2, 6, 4`.
Fast forward to the moment after the two outermost recursive calls complete, but before the final Merge step. Thinking of the two 5-element output arrays of the recursive calls as a glued-together 10-element array, which number is in the 7th position?

**Answer**

2

### Problem 1.2

Consider the following modification to the MergeSort algorithm: divide the input array into thirds (rather than halves), recursively sort each third, and finally combine the results using a three-way Merge subroutine. What is the running time of this algorithm as a function of the length $n$ of the input array, ignoring constant factors and lower-order terms?

**Answer**

Instead of creating a binary tree, it will create a ternary tree, so it is $n \log_3 n$, therefore:

b) $n \log n$.

### Problem 1.3

Suppose you are given $k$ sorted arrays, each with $n$ elements, and you want to combine them into a single array of $kn$ elements. One approach is to use the Merge subroutine from Section 1.4.5 repeatedly, first merging the first two arrays, then merging the result with the third array, then with the fourth array, and so on until you merge in the $k$th and final input array. What is the running time taken by this successive merging algorithm, as a function of $k$ and $n$, ignoring constant factors and lower-order terms?

**Answer**

The running time for Merge is at most $l_1+l_2 = 2n$, where $l_1$ is the length of the first array and $l_2$ of the second.

The $k$ steps will be:

1. $2n$
2. $3n$
3. $4n$
4. $\vdots$
5. $kn$

as the sum from 1 to $k$ grows with $k^2$ the answer is:

e) $nk^2$

### Problem 1.4

Consider again the problem of merging $k$ sorted length-$n$ arrays into a single sorted length-$kn$ array. Consider the algorithm that first divides the $k$ arrays into $k/2$ pairs of arrays, and uses the Merge subroutine to combine each pair, resulting in $k/2$ sorted length-$2n$ arrays. The algorithm repeats this step until there is only one length-$kn$ sorted array. What is the running time of this procedure, as a function of $k$ and $n$, ignoring constant factors and lower-order terms?

**Answer**

Steps:

We got $kn$ running time for each level executed.

We got $\log k$ levels, therefore

c) $nk \log k$

## Challenge Problems

### Problem 1.5

You are given as input an unsorted array of $n$ distinct numbers, where $n$ is a power of 2. Give an algorithm that identifies the second-largest number in the array, and that uses at most $n+\log_2 n-2$ comparisons.

**Answer**

First we have to get the largest number.

It is done by dividing the array in 2 and returning the largest number of each array, then we compare them and return the largest one.

After getting the largest number, we repeat the process with an array without the largest number.

## Programming Problems

### Problem 1.6

Implement Karatsuba’s integer multiplication algorithm in your favorite programming language.
To get the most out of this problem, your program should invoke the language’s multiplication operator only on pairs of single-digit numbers. For a concrete challenge, what’s the product of the following two 64-digit numbers?

3141592653589793238462643383279502884197169399375105820974944592 

2718281828459045235360287471352662497757247093699959574966967627

**Answer**

Code:

```ruby
def karatsuba(n_1, n_2) 
    n_1_s = n_1.to_s
    n_2_s = n_2.to_s
    
    n = [n_1_s.length, n_2_s.length].max 

    if(n == 1)
        return n_1*n_2
    end 

    if (n%2 != 0)
        n = n + 1
    end

    n_half = n/2 

    if n_1_s.length < n 
        n_1_s = ("0" * (n-n_1_s.length)) + n_1_s
    end

    if n_2_s.length < n 
        n_2_s = ("0" * (n-n_2_s.length)) + n_2_s
    end

    a = (n_1_s.slice(0, n_half)).to_i
    b = (n_1_s.slice(n_half, n_half)).to_i

    c = (n_2_s.slice(0, n_half)).to_i
    d = (n_2_s.slice(n_half, n_half)).to_i

    p = a + b
    q = c + d

    ac = karatsuba(a, c)
    bd = karatsuba(b, d)
    pq = karatsuba(p, q)
    adbc = pq - ac - bd

    (ac.to_s+"0" * n).to_i + (adbc.to_s+"0" * n_half).to_i + bd
end

aa = 3141592653589793238462643383279502884197169399375105820974944592
bb = 2718281828459045235360287471352662497757247093699959574966967627

puts karatsuba(aa, bb)
```



Result:

8539734222673567065463550869546574495034888535765114961879601127067743044893204848617875072216249073013374895871952806582723184