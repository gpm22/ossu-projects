# Chapter 5 - `QuickSort`

Questions available in the book **Algorithms Illuminated Part 1: The Basics** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 5.1

Recall the Partition subroutine employed by `QuickSort` (Section 5.2). You are told that the following array has just been partitioned around some pivot element: `3 1 2 4 5 8 7 6 9`
Which of the elements could have been the pivot element? (List all that apply; there could be more than one possibility.)

**Answer**

4, 5, 7, 9

### Problem 5.2

Let $\alpha$ be some constant, independent of the input array length $n$, strictly between $0$ and $1/2$ . What is the probability that, with a randomly chosen pivot element, the Partition subroutine produces a split in which the size of both the resulting subproblems is at least $\alpha$ times the size of the original array?

* a) $\alpha$
* b) $1 - \alpha$
* c) $1 - 2\alpha$
* b) $2 - 2\alpha$

**Answer**

If $\alpha$ is 0 then the probability must be 1.

When $\lim \alpha \to 1/2$ the probability must be near zero.

In the light of these facts, by elimination, the answer is **c) $1 - 2 \alpha$**.

### Problem 5.3

Let $\alpha$ be some constant, independent of the input array length $n$, strictly between $0$ and $1/2$ .  Assume you achieve the approximately balanced splits from the preceding problem in every recursive call—so whenever a recursive call is given an array of length $k$, each of its two recursive calls is passed a subarray with length between $\alpha k$ and $(1-\alpha)k$. How many successive recursive calls can occur before triggering the base case? Equivalently, which levels of the algorithm’s recursion tree can contain leaves? Express your answer as a range of possible numbers $d$, from the minimum to the maximum number of recursive calls that might be needed.

* a) $0 \leq d \leq - \frac {\ln n}{\ln \alpha}$
* b) $- \frac {\ln n}{\ln \alpha} \leq d \leq - \frac {\ln n}{\ln (1-\alpha)}$
* c) $- \frac {\ln n}{\ln (1-\alpha)} \leq d \leq - \frac {\ln n}{\ln \alpha}$
* d) $- \frac {\ln n}{\ln (1-2\alpha)} \leq d \leq - \frac {\ln n}{\ln (1-\alpha)}$

**Answer**

The lower bound, $L$, is defined by $\alpha^Ln=1$.

The upper bound, U, is defined by $(1-\alpha)^Un=1$.

Isolating the lower bound we got:
$$
\alpha^Ln=1 \\

\alpha^L=\frac 1n \\

\ln (\alpha^L) = \ln \left(\frac 1n  \right) \\

L \ln \alpha = \ln 1 - \ln n \\

L \ln \alpha = - \ln n \\

L = - \frac {\ln n}{\ln \alpha}
$$


Isolating the upper bound we got:
$$
(1-\alpha)^Un=1 \\

(1-\alpha)^U=\frac 1n \\

\ln ((1-\alpha)^U) = \ln \left(\frac 1n  \right) \\

U \ln (1-\alpha) = \ln 1 - \ln n \\

U \ln (1-\alpha) = - \ln n \\

U = - \frac {\ln n}{\ln (1-\alpha)}
$$
Therefore the answer is **b) $- \frac {\ln n}{\ln \alpha} \leq d \leq - \frac {\ln n}{\ln (1-\alpha)}$**.

### Problem 5.4

Define the recursion depth of `QuickSort` as the maximum number of successive recursive calls it makes before hitting
the base case—equivalently, the largest level of its recursion tree.
In randomized `QuickSort`, the recursion depth is a random variable, depending on the pivots chosen. What is the minimum- and maximum-possible recursion depth of randomized `QuickSort`?

* a) minimum: $\Theta(1)$; maximum: $\Theta(n)$
* b) minimum: $\Theta(\log n)$; maximum: $\Theta(n)$
* c) minimum: $\Theta(\log n)$; maximum: $\Theta(n \log n)$
* d) minimum: $\Theta(\sqrt n)$; maximum: $\Theta(n)$

**Answer**

The work done at each recursion level is always $\Theta(n)$.

The best case possible is $\Theta (n \log n)$ and the worst case possible is $\Theta(n^2)$.

We got the answer by dividing both cases by $n$, therefore the answer is **b) minimum: $\Theta(\log n)$; maximum: $\Theta(n)$**.

## Challenge Problems

### Problem 5.5

Extend the $\Omega(n \log n)$ lower bound in Section 5.6 to apply also to the expected running time of randomized comparison-based sorting algorithms.

**Answer**

Let's define $A$ as a randomized algorithm.

We can also understand $A$ as a deterministic algorithm that uses random values as input for each run.

So for any given input, $I$, to $A$ there is a deterministic algorithm $A_I$ for which the input is hardwired.

Thus $A$ is a probability distribution over all possible $A_i$'s.

As a result, the expected number of comparisons made by $A$ on some input $I$:
$$
\text{Ex}(\text{Runtime of }A) = \sum_I \Pr(I) \cdot (\text{Runtime of $A_I$ on }I)
$$
As the runtime of each $A_I$ is at least $\Omega(n \log n)$ we got
$$
\text{Ex}(\text{Runtime of }A) = \Omega(n \log n)
$$


## Programming Problems

### Problem 5.6

Implement the `QuickSort` algorithm in your favorite programming language. Experiment with the performance of different ways of choosing the pivot element.
	One approach is to keep track of the number of comparisons between input array elements made by `QuickSort`. For several different input arrays, determine the number of comparisons made with the following implementations of the `ChoosePivot` subroutine:

1. Always use the first element as the pivot.
2. Always use the last element as the pivot.
3. Use a random element as the pivot.
     * In this case you should run the algorithm 10 times on a given input array and average the results.
4. Use the **median-of-three** as the pivot element.

     * The goal of this rule is to do a little extra work to get much better performance on input arrays that are nearly sorted or reverse sorted.

     * In more detail, this implementation of `ChoosePivot` considers the first, middle, and final elements of the given array. 
       * For an array with even length $2k$, use the kth element for the “middle” one.

     * It then identifies which of these three elements is the median (i.e., the one whose value is in between the other two), and returns this as the pivot.

     * For example, with the input array `8 3 2 5 1 4 7 6` the subroutine would consider the first (8), middle (5), and last (6) elements.
       * It would return 6, the median of the set $\{5, 6, 8\}$, as the pivot element.


**Answer**

```ruby
def quickSort (arr, l, r, choosePivot, count)
    if l >= r  # 0- or 1-element subarray
    	return
    end
    i = choosePivot.call(arr, l, r, count)
    arr[l], arr[i] = arr[i], arr[l] # make pivot first
    j = partition(arr, l, r, count) # j =new pivot position
    quickSort(arr, l, j - 1, choosePivot, count) # recurse on first part
    quickSort(arr, j + 1, r, choosePivot, count) # recurse on second part
    return
end
    
def partition(arr, l, r, count)
    p = arr[l]
    i = l + 1
    for j in (l + 1)..r
    	if arr[j] < p # if arr[j] > p do nothing
    		arr[j], arr[i] = arr[i], arr[j]
    		i = i + 1 # restores invariant
             count.next
        end
    end
    arr[l], arr[i - 1] = arr[i - 1], arr[l] # place pivot correctly
    i - 1 # report final pivot position
end
    
def choosePivotFirstElement(arr, l, r, count)
    count.next
    l
end
 
def choosePivotLastElement(arr, l, r, count)
    count.next
    r
end

def choosePivotRandomElement(arr, l, r, count)
    count.next
    rand(l..r)
end

def choosePivotMedianOfThree(arr, l, r, count)
    if l >= r or ((r-l) == 1) # 0-, 1-, 2-element subarray
        count.next
    	return l
    end
    
    half = ((r-l)/2).floor
    count.next
    first = arr[l]
    second = arr[half]
    third = arr[r]
    count.next
    if (first >= second and first <= third) or (first <= second and first >= third)
        return l
    end
    count.next
    if (second >= first and second <= third) or (second <= first and second >= third)
        return half
    end
    count.next
    r 
end
    
def quickSortFirstElement(arr, l, r)
    count = Enumerator.new { |y| i = -1; loop { y << (i+=1) } } 
	quickSort(arr, l, r, method(:choosePivotFirstElement), count)
    count.next - 1
end
    
def quickSortLastElement(arr, l, r)
    count = Enumerator.new { |y| i = -1; loop { y << (i+=1) } } 
	quickSort(arr, l, r, method(:choosePivotLastElement), count)
    count.next - 1
end
    
def quickSortRandomElement(arr, l, r)
    count = Enumerator.new { |y| i = -1; loop { y << (i+=1) } } 
	quickSort(arr, l, r, method(:choosePivotRandomElement), count)
    count.next - 1
end
    
def quickSortMedianOfThree(arr, l, r)
    count = Enumerator.new { |y| i = -1; loop { y << (i+=1) } } 
	quickSort(arr, l, r, method(:choosePivotMedianOfThree), count)
    count.next - 1
end
```

