# Chapter 6 - Linear-Time Selection

Questions available in the book **Algorithms Illuminated Part 1: The Basics** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 6.1

Let $\alpha$ be some constant, independent of the input array length $n$, strictly between $\frac 1 2$ and $1$. Suppose you are using the `RSelect` algorithm to compute the median element of a length-$n$ array. What is the probability that the first recursive call is passed a subarray of length at most $\alpha \cdot n$?

* **a)** $1 - \alpha$
* **b)** $\alpha - \frac 12$
* **c)** $1 - \frac \alpha 2$
* **d)** $2\alpha - 1$

**ANSWER**

If the pivot $p$ is less than the median, the length will be $n-p$, if it is bigger, the length will be $p$.

As the length is $\leq \alpha n$, we have the condition
$$
(1-\alpha)n \leq p \leq \alpha n
$$
The probability of $(1-\alpha)n \leq p$ is
$$
\frac{(1-\alpha)n}n=1 - \alpha
$$


The probability of $\alpha n \geq p$ is
$$
\frac {n-\alpha n}{n} = 1- \alpha
$$
Therefore, the probability that $(1-\alpha)n \leq p \leq \alpha n$ is
$$
1 - 2(1-\alpha) = 2 \alpha -1
$$
Thus the correct answer is **d)** $2\alpha - 1$.

### Problem 6.2

Let $\alpha$ be some constant, independent of the input array length $n$, strictly between $\frac 1 2$ and $1$. Assume that every recursive call to `RSelect` makes progress as in the preceding problem—so whenever a recursive call is given an array of length $k$, its recursive call is passed a subarray with length at most $\alpha k$. What is the maximum number of successive recursive calls that can occur before triggering the base case?

* **a)** $- \frac{\ln n}{\ln \alpha}$
* **b)** $- \frac{\ln n}{\alpha}$
* **c)** $- \frac{\ln n}{\ln (1- \alpha)}$
* **d)** $- \frac{\ln n}{\ln (\frac 12- \alpha)}$

**ANSWER**

The base case occurs when
$$
\alpha^B n = 1
$$
or
$$
\alpha^B= \frac 1 n
$$


applying $\ln$ to both sides results in
$$
B \ln \alpha = \ln 1 - \ln n = - \ln n
$$
thus
$$
B = - \frac {\ln n}{\ln \alpha}
$$
Therefore the correct answer is **a)** $- \frac{\ln n}{\ln \alpha}$.

## Challenge Problems

### Problem 6.3

For problem, the input is an unsorted array of $n$ distinct elements $x_1, x_2,\dots,x_n$ with positive weights $w_1, w_2,\dots,w_n$. Let $W$ denote the sum $\sum_{i=1}^n w_i$ of the weights. Define a **weighted median** as an element $x_k$ for which the total weight of all elements with value less than $x_k$ (i.e.,$ \sum_{x_i<x_k} w_i$) is at most $W/2$ and also the total weight of elements with value larger than $x_k$  (i.e.,$ \sum_{x_i>x_k} w_i$) is at most $W/2$. Observe that there are at most two weighted medians. Give a deterministic linear-time algorithm for computing all the weighted medians in the input array. [Hint: Use `DSelect` as a subroutine.]

**ANSWER**

Steps:

1. Create set with elements where the total weight of the values less than them are at most $W/2$.
2. Create set with elements where the total weight of the values more than them are at most $W/2$.
3. Return the intersection of the sets.

This works as there set implementations that adding and comparing are $O(1)$, so each step is $O(n)$, therefore the overall running time is $O(n)$.

**Pseudocode**

```ruby
W := sum of all weights
half_W = W/2
W_less := 0
set_less := {}
for i:=1 to n do           # Creating set with elements where     
    if W_less < half_W     # the total weight of the values less than 
        set_less.add(A[i]) # them are at most $W/2$.
        W_less = W_less + A[i].weight
    else
        break
    end
end

W_more :=0
set_more := {}
for i:=n to 1 do           # Creating set with elements where     
    if W_more < half_W     # the total weight of the values more than 
        set_more.add(A[i]) # them are at most $W/2$.
        W_more = W_more + A[i].weight
    else
        break
    end
end

result := {}
for i:=1 to set_less.length do         # Getting the intersection of the sets
    if set_more.contains(set_less[i]) 
        result.add(set_less[i])
    end
end

return result
```



### Problem 6.4

Suppose we modify the `DSelect` algorithm by breaking the elements into groups of 7, rather than groups of 5. (Use the median-of-medians as the pivot element, as before.) Does this modified algorithm also run in $O(n)$ time? What if we use groups of 3?

**ANSWER**

The idea is to verify if there is some similar to the **30-70 Lemma** for the cases of groups of 7 and 3, so we will reuse the two-dimensional grid argument.

**General Argument**

Lets organize the array in a two-dimensional grid where each of the $\frac nx$ columns corresponds to one of the groups of x.

Within each column, we lay out the x elements in sorted order from bottom to top.

Finally, we lay out the columns so that the first-round winners (i.e., the elements in the middle row) are in sorted order from left to right.

Because the pivot element is the median of the elements in the middle row, at least 50% of the columns are to the left of the one that contains the pivot (counting also the pivot’s own column). In each of these columns, at least $\text{ceilling}(x/2)/x \cdot 100 \%$ of the elements (the $\text{ceilling}(x/2)$ smallest of the 7) are no larger than the column’s median and hence no larger than the pivot element. Thus at least $\text{ceilling}(x/2)/(2x) \cdot 100 \%$ of the input array elements are no larger than the pivot element, and all of these would be excluded from the recursive call. Similarly, at least $\text{ceilling}(x/2)/(2x) \cdot 100 \%$ of the elements are no smaller than the pivot, and these would be excluded from the other recursive call.

**Groups of 7**

In this case the $\text{ceilling}(x/2)/(2x) \cdot 100 \% = 28.57%$.

So the rule is 29-71 and the length passed is at most $71n/100$.

Let use the guess and check considering $T(n) \leq l \cdot n$

Lets use $l = (700/103)c$ and $k = 1$.

So 
$$
\begin{align*}
	T(n) & \leq T\left(\frac n7 \right) + T\left(\frac {71n}{100} \right) + cn \\
	     & \leq \frac {ln}{7} + \frac{71ln}{100} + cn \\
	     & = n \left(\frac{597l}{700}+c  \right) \\
	     & = ln \\
	     & = O(n)
\end{align*}
$$
Therefore it is linear.

**Groups of 3**

In this case the $\text{ceilling}(x/2)/(2x) \cdot 100 \% = 33. \overline 3%$.

So the rule is 33-67 and the length passed is at most $66.\overline 6 n/100 = 2n/3$.

So
$$
T(n) \leq T\left(\frac n3 \right) + T\left(\frac {2n}{3} \right) + cn
$$
This solves to $O(n \log n)$.

To prove this claim, lets use the guess and check considering $T(n) \leq l n \log n$.
$$
\begin{align*}
	T(n) & \leq T\left(\frac n3 \right) + T\left(\frac {2n}{3} \right) + cn \\
	     & \leq \frac {ln}3 \log \frac n3 + \frac {2nl}3 \log \frac {2n}3 + cn \\
		 & = \frac {ln}{3}(\log n - \log 3) + \frac {2nl}3 (\log2+\log n - \log 3) + cn \\
		 & = ln \log n - ln\log 3 + \frac {2nl}3 \log 2 + cn \\

         & = O(n \log n)
\end{align*}
$$
Therefore it takes longer than the 7 and 5 versions.

## Programming Problems

### Problem 6.5

Implement in your favorite programming language the `RSelect` algorithm from Section 6.1. Your implementation should operate in place, using an in-place implementation of `Partition` (which you might have implemented for Problem 5.6) and passing indices through the recursion to keep track of the still-relevant portion of the original input array.

**ANSWER**

```ruby
def rSelect (arr, i, l, r)
    if l >= r  # 0- or 1-element subarray
    	return arr[l]
    end
    pivot_position = choosePivot(arr, l, r)
    new_pivot_position = partition(arr, pivot_position, l, r)
	
    if new_pivot_position == i # you got lucky!
        return arr[new_pivot_position]
    elsif new_pivot_position > i
        return rSelect(arr, i, l, new_pivot_position-1)
    else
    	return rSelect(arr, i, new_pivot_position+1, r)
    end
end
    
def partition(arr, pivot_position, l, r)
    arr[l], arr[pivot_position] = arr[pivot_position], arr[l] # make pivot first
    p = arr[l]
    i = l + 1
    for j in (l + 1)..r
    	if arr[j] < p # if arr[j] > p do nothing
    		arr[j], arr[i] = arr[i], arr[j]
    		i = i + 1 # restores invariant
        end
    end
    arr[l], arr[i - 1] = arr[i - 1], arr[l] # place pivot correctly
    i - 1 # report final pivot position
end

def choosePivot(arr, l, r)
    rand(l..r)
end
```

