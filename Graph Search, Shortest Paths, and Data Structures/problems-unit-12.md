# Chapter 12 - Hash Tables and Bloom Filters

Questions available in the book **Algorithms Illuminated Part 2: Graph Algorithms and Data Structures** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 12.1

Which of the following is not a property you would expect a well-designed hash function to have?

* **a)** The hash function should spread out every data set roughly evenly across its range.
* **b)** The hash function should be easy to compute (constant time or close to it).
* **c)** The hash function should be easy to store (constant space or close to it).
* **d)** The hash function should spread out most data sets roughly evenly across its range.

**ANSWER**

* **a)** The hash function should spread out every data set roughly evenly across its range.

### Problem 12.2

A good hash function mimics the gold standard of a random function for all practical purposes, so it’s interesting to investigate collisions with a random function.  If the locations of two different keys $k_1, k_2 \in U$ are chosen independently and uniformly at random across $n$ array positions (with all possibilities equally likely), what is the probability that $k_1$ and $k_2$ will collide?

* **a)** 0
* **b)** $\frac 1n$
* **c)** $\frac {2}{n(n-1)}$
* **d)** $\frac {1}{n^2}$

**ANSWER**

* **b)** $\frac {1}{n}$

### Problem 12.3

We interpreted our heuristic analysis of bloom filters in Section 12.6 by specializing it to the case of 8 bits of space per key inserted into the filter. Suppose we were willing to use twice as much space (16 bits per insertion). What can you say about the corresponding false positive rate, according to our heuristic analysis, assuming that the number $m$ of hash tables is set optimally? (Choose the strongest true statement.)

* **a)** The false positive rate would be less than 1%.
* **b)** The false positive rate would be less than 0.1%.
* **c)** The false positive rate would be less than 0.01%.
* **d)** The false positive rate would be less than 0.001%.

**ANSWER**

The optimal collision is
$$
\left(\frac 12 \right)^{b(\ln2)}
$$
So, for $b=16$, the percentage of collisions is 0.046%.

Therefore the answer is

* **b)** The false positive rate would be less than 0.1%.

## Programming Problems

### Problem 12.4

Implement in your favorite programming language the hash table-based solution to the 2-SUM problem in Section 12.2.2. For example, you could generate a list $S$ of one million random integers between $-10^{11}$ and $10^{11}$, and count the number of targets t between -10000 and 10000 for which there are distinct $x, y \in S$ with $x+y = t$.

**ANSWER**

```ruby
def two_sum(arr, t, set)
    arr.each do |x|
       y = t - x
       next if y == x
       return true if set.include?(y.to_s)
    end
    false
end

def countTargetsWithSet(arr, set)
    count = 0
    a = 0.0
    (-1000..1000).each do |i|
        puts "counting step: #{a} - percentage #{(a*100)/20_001} %" if (a % 200 < 1)
        a += 1
        count += (two_sum(arr, i, set) ? 1 : 0) 
    end
    count
end

def solveProblem
    puts "getting numbers from file"
    arr = getNumbersFromFile
    puts "starting counting"
    set = Hash[arr.collect {|n| [n.to_s, nil]}]
    count = countTargetsWithSet(arr, set)
    puts "counting result: #{count}"
end

solveProblem #result is 427
```

