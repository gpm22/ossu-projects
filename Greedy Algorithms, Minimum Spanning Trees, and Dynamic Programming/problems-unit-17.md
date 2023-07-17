# Chapter 17 - Advanced Dynamic Programming

Questions available in the book **Algorithms Illuminated Part 3: Greedy Algorithms and Dynamic Programming** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 17.1

For the sequence alignment input in Quiz 17.1, what are the final array entries of the `NW` algorithm from Section 17.1?

**ANSWER**

| i/j  | 0    | 1    | 2    | 3    | 4    | 5    | 6    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 0    | 0    | 1    | 2    | 3    | 4    | 5    | 6    |
| 1    | 1    | 0    | 1    | 2    | 3    | 4    | 5    |
| 2    | 2    | 1    | 2    | 3    | 4    | 5    | 4    |
| 3    | 3    | 2    | 3    | 4    | 3    | 4    | 5    |
| 4    | 4    | 3    | 4    | 3    | 4    | 3    | 4    |
| 5    | 5    | 4    | 3    | 4    | 5    | 4    | 5    |
| 6    | 6    | 5    | 4    | 5    | 6    | 5    | 4    |

### Problem 17.2

The `Knapsack` algorithm from Section 16.5 and the `NW` algorithm from Section 17.1 both fill in a two-dimensional array using a double for loop. Suppose we reverse the order of the for loops—literally cutting and pasting the second loop in front of the first, without changing the pseudocode in any other way. Are the resulting algorithms well defined and correct?

**ANSWER**

For both algorithms the result would be well defined and correct, as the necessary subproblem solutions already have been computed in previous iterations.

### Problem 17.3

The following problems all take as input two strings $X$ and $Y$, with lengths $m$ and $n$, over some alphabet $\Sigma$. Which of them can be solved in $O(mn)$ time?

* **a)** Consider the variation of sequence alignment in which, instead of a single gap penalty $\alpha_{gap}$, you are given two positive numbers $a$ and $b$. The penalty for inserting $k$ gaps in a row is now defined as $ak+b$, rather than $k\cdot\alpha_{gap}$. The other penalties (for matching two symbols) are defined as before. The goal is to compute the minimum-possible penalty of an alignment under this new cost model.
* **b)** Compute the length of a longest common subsequence of $X$ and $Y$. (A subsequence need not comprise consecutive symbols. For example, the longest common subsequence of “abcdef” and “afebcd” is “abcd.”)
* **c)** Assume that $X$ and $Y$ have the same length $n$. Determine whether there exists a permutation $f$, mapping each $i \in \{1, 2, \dots,n\}$ to a distinct value $f(i) \in \{1, 2, \dots,n\}$, such that $X_i = Y_{f(i)}$ for every $i = 1, 2, \dots,n$.
* **d)** Compute the length of a longest common substring of $X$ and $Y$. (A substring is a subsequence comprising consecutive symbols. For example, “bcd” is a substring of “abcdef,” while “bdf” is not.)

**ANSWER**

**a)** Consider the variation of sequence alignment in which, instead of a single gap penalty $\alpha_{gap}$, you are given two positive numbers $a$ and $b$. The penalty for inserting $k$ gaps in a row is now defined as $ak+b$, rather than $k\cdot\alpha_{gap}$. The other penalties (for matching two symbols) are defined as before. The goal is to compute the minimum-possible penalty of an alignment under this new cost model.

**b)** Compute the length of a longest common subsequence of $X$ and $Y$. (A subsequence need not comprise consecutive symbols. For example, the longest common subsequence of “abcdef” and “afebcd” is “abcd.”)

**c)** Assume that $X$ and $Y$ have the same length $n$. Determine whether there exists a permutation $f$, mapping each $i \in \{1, 2, \dots,n\}$ to a distinct value $f(i) \in \{1, 2, \dots,n\}$, such that $X_i = Y_{f(i)}$ for every $i = 1, 2, \dots,n$.

**d)** Compute the length of a longest common substring of $X$ and $Y$. (A substring is a subsequence comprising consecutive symbols. For example, “bcd” is a substring of “abcdef,” while “bdf” is not.)

### Problem 17.4

Consider an instance of the optimal binary search tree problem with keys $\{1, 2, \dots, 7\}$ and the following frequencies:

| Symbol | Frequency |
| ------ | --------- |
| 1      | 20        |
| 2      | 5         |
| 3      | 17        |
| 4      | 10        |
| 5      | 20        |
| 6      | 3         |
| 7      | 25        |

What are the final array entries of the `OptBST` algorithm from Section 17.2?

**ANSWER**

| i/j  | 0    | 1    | 2    | 3    | 4    | 5    | 6    | 7    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 1    | 0    | 20   | 30   | 69   | 92   | 142  | 151  | 223  |
| 2    |      | 0    | 5    | 27   | 47   | 97   | 105  | 158  |
| 3    |      |      | 0    | 17   | 37   | 84   | 90   | 143  |
| 4    |      |      |      | 0    | 10   | 40   | 46   | 99   |
| 5    |      |      |      |      | 0    | 20   | 26   | 74   |
| 6    |      |      |      |      |      | 0    | 3    | 31   |
| 7    |      |      |      |      |      |      | 0    | 25   |
| 8    |      |      |      |      |      |      |      | 0    |

### Problem 17.5

Recall the `WIS` algorithm (Section 16.2), the `NW` algorithm (Section 17.1), and the `OptBST` algorithm (Section 17.2). The space requirements of these algorithms are proportional to the number of subproblems: $\Theta(n)$, where $n$ is the number of vertices; $\Theta(mn)$, where $m$ and $n$ are the lengths of the input strings; and $\Theta(n^2)$, where $n$ is the number of keys, respectively.

Suppose we only want to compute the value of an optimal solution and don’t care about reconstruction. How much space do you then really need to run each of the three algorithms, respectively?

* **a)** $\Theta(1)$, $\Theta(1)$, and $\Theta(n)$
* **b)** $\Theta(1)$, $\Theta(n)$, and $\Theta(n)$
* **c)** $\Theta(1)$, $\Theta(n)$, and $\Theta(n^2)$
* **d)** $\Theta(n)$, $\Theta(n)$, and $\Theta(n^2)$

**ANSWER**

**c)** $\Theta(1)$, $\Theta(n)$, and $\Theta(n^2)$

## Challenge Problems

### Problem 17.6

In the sequence alignment problem, suppose you knew that the input strings were relatively similar, in the sense that there is an optimal alignment that uses at most $k$ gaps, where $k$ is much smaller than the lengths $m$ and $n$ of the strings. Show how to compute the `NW` score in $O((m + n)k)$ time.

**ANSWER**

Knowing that the index $i$ is related to the first string, the index $j$ is related to the second string, and that the solution cannot have more than $k$ gaps, we do not need to care about the subproblems where $|i - j| > k$. Because these subproblems use more than $k$ gaps.

So we need two inner loops:

```ruby
# subproblem solutions (indexed from 0)
A := (m + 1) x (n + 1) two-dimensional array
# base case #1 (j = 0)
for i = 0 to m do
	A[i][0] = i * alpha_gap
end	
# base case #2 (i = 0)
for j = 0 to n do
	A[0][j] = j * alpha_gap
end
# systematically solve all subproblems
for i = 1 to m do
    for j = i to i+k do
        # use recurrence from Corollary 17.2
        case1 = A[i-1][j-1] + alpha[x_i][y_j]
        case2 = A[i-1][j] + alpha_gap
        case3 = A[i][j-1] + alpha_gap
        A[i][j] = min(case1, case2, case3)
    end
end

for j = 1 to n do
    for i = j to j+k do
        # use recurrence from Corollary 17.2
        case1 = A[i-1][j-1] + alpha[x_i][y_j]
        case2 = A[i-1][j] + alpha_gap
        case3 = A[i][j-1] + alpha_gap
        A[i][j] = min(case1, case2, case3)
    end
end

return A[m][n] # solution to largest subproblem
```



### Problem 17.7

There are seven kinds of Tetris pieces. Design a dynamic programming algorithm that, given $x_1, x_2, \dots,x_7$ copies of each respective piece, determines whether you can tile a 10-by-$n$ board with exactly those pieces (placing them however and wherever you want—not necessarily in Tetris order). The running time of your algorithm should be polynomial in $n$.

**ANSWER**

I will put all the pieces in a array of length $x_1+x_2+\cdots+x_7$.

The final solution must contains all pieces.

The previous solution must contain space for the actual piece.

The idea is to put the current piece where it is possible, then whenever it fails it comes back and try again in a different place and a different angle.

It is like a stack of solutions, whenever it fails it try the previous one until fail all possibilities, so it goes back two pieces and so on.

## Programming Problems

### Problem 17.8

Implement in your favorite programming language the `NW` and `OptBST` algorithms, along with their reconstruction algorithms.