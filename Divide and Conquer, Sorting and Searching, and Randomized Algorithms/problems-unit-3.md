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

**Answer**

As the maximum value will be greater than both neighbors, the algorithm just have to follow the steps:

1. get the value at $n/2$
2. If it is smaller than the value at $n/2-1$ the max value is at the left half of the array.
   * Then we recall the function with the left half of the array.
3. If it is smaller than the value at $n/2+1$ the max value is at the right half of the array.
   * Then we recall the function with the right half of the array.
4. the value at $n/2$ is the maximum value.

`GetMax`

* **Input**: **unimodal** array $A$ of $n > 2$ distinct elements

* **Output**: maximum element

* **Pseudocode:**

  ```ruby
  if (n <= 3) # base case
      return A[2]
  else
     	if A[n/2] < A[n/2-1]
          return GetMax(A[0..n/2-1])
      end
      
      if A[n/2] > A[n/2+1]
          return GetMax(A[n/2+1..n])
      end
      
      return A[n/2]
  end
  ```

### Problem 3.3

You are given a sorted (from smallest to largest) array $A$ of $n$ distinct integers which can be positive, negative, or zero. You want to decide whether or not there is an index $i$ such that $A[i] = i$. Design the fastest algorithm you can for solving this problem.

**Answer**

Some invariants can be found analyzing this problem:

* If $A[i]$ is greater than $n$ we can disregard it and the numbers at its right.
* If $A[i]$ is smaller than $i$ we can disregard it and the numbers at its left.

So we have left the problem where $i < A[i] < n$, which we simple trying comparing the next number, that is, $A[i+1]$.

This algorithm has big-oh between $\log n$ and $n$.

`HasValueEqualIndex`

* **Input**: sorted array $A$ of $n$ distinct integers and actual index $i$ to be tested

* **Output**: `true` if it has any element with $A[i] = i$, `false` otherwise.

* **Pseudocode:**

  ```ruby
  if A[i] == i
      return true
  end
  
  if n == 1 or (i == n and A[i] < i) #base case
      return false
  end
  
  if A[i] >= n
      return HasValueEqualIndex(A[0..i-1], (i-1)/2)
  end
  
  if A[i] < i
      return HasValueEqualIndex(A, (n)/2) # The array is not halved 
  end                                     # so the indexes are not changed
  
  return HasValueEqualIndex(A, i+1)
  ```

  

### Problem 3.4

You are given an $n$-by-$n$ grid of distinct numbers. A number is a **local minimum** if it is smaller than all its neighbors. (A neighbor of a number is one immediately above, below, to the left, or to the right. Most numbers have four neighbors; numbers on the side have three; the four corners have two.) Use the divide-and-conquer algorithm design paradigm to compute a local minimum with only $O(n)$ comparisons between pairs of numbers. (Note: since there are $n^2$ numbers in the input, you cannot afford to look at all of them.)

**Answer**

The idea is to verify if the actual number is a local minimum, if it is not we go test the lowest valued neighbor, eventually we will get to a local minimum without having to verify all points.

The divide and conquer way to do that involves:

1. Finding the smallest cell $S$ which is in the middle_row or middle_column.
2. Finding the smallest neighbor of $S$, $SN$.
3. If $S$ is the same value as $SN$, then it is the local minimal.
4. Otherwise we repeat the processing in the sub-matrix that contains $SN$.

`GetLocalMinimum`

* **Input**: $n$-by-$n$ grid $G$ of distinct numbers

* **Output**:  a local minimum

* **Pseudocode:**

  ```ruby
  min_cell = Min (GetMinInRow(middle_row), Get_min_in_Collum(middle_column))
  
  smallest_neighbor = GetSmallestNeighbor(min_cell)
  
  if min_cell == smallest_neighbor
      return min_cell
  end
  
  if smallest_neighbor.row < middle_row
      if smallest_neighbor.column < middle_column
          return GetLocalMinimum(G[0..middle_row][0..middle_column]) #top-left submatrix
      else
          return GetLocalMinimum(G[middle_row..n][0..middle_column]) #top-right submatrix
      end
  end
  
  if smallest_neighbor.column < middle_column
      return GetLocalMinimum(G[0..middle_row][middle_column..n]) #bottom-left submatrix
  else
      return GetLocalMinimum(G[middle_row..n][middle_column..n]) #bottom-right submatrix
  end
  
  ```

  

## Programming Problems

### Problem 3.5

Implement in your favorite programming language the `CountInv` algorithm from Section 3.2 for counting the number of inversions of an array.

```ruby
def countInv (a)
    n = a.length
    if n <= 1
        (a, 0)
    else
        (c, leftInv) = countInv(a[0..n/2])  #first half of a
        (d, rightInv) = countInv(a[n/2..n-1]) #second half of a
        (b, splitInv) = mergeAndCountSplitInv(c, d)
        (b, leftInv + rightInv + splitInv)
    end
end

def mergeAndCountSplitInv (c, d)
    n = 2* c.length
    i = 0
    j = 0
    splitInv = 0
    b = []
    for k = 0 to n-1
        if c[i] < d[j]
            b[k] = c[i]
            i = i+1
        else
            b[k] = d[i]
            j = j+1
            splitInv = splitInv + (n/2 - i + 2) #left in C
        end
    end
    
    (b, splitInv)
end

    
```

