# 19 - What Is NP-Hardness?

Questions available in the book **Algorithms Illuminated Part 4: Algorithms For NP-Hard Problems** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 19.1

Suppose that a computational problem B that you care about is NP-hard. Which of the following are true?

* a) NP-hardness is a “death sentence”; you shouldn’t bother trying to solve the instances of B that are relevant for your application.
* b) If your boss criticizes you for failing to find a polynomial-time algorithm for B, you can legitimately respond that thousands of brilliant minds have likewise tried and failed to solve B.
* c) You should not try to design an algorithm that is guaranteed to solve B correctly and in polynomial time for every possible instance of the problem (unless you’re explicitly trying to refute the $P \neq NP$ conjecture).
* d) Because the dynamic programming paradigm is useful only for designing exact algorithms, there’s no point in trying to apply it to problem B.

**ANSWER**

* b) If your boss criticizes you for failing to find a polynomial-time algorithm for B, you can legitimately respond that thousands of brilliant minds have likewise tried and failed to solve B.
* c) You should not try to design an algorithm that is guaranteed to solve B correctly and in polynomial time for every possible instance of the problem (unless you’re explicitly trying to refute the $P \neq NP$ conjecture).

### Problem 19.2

Which of the following statements are true?

* a) The MST problem is computationally tractable because the number of spanning trees of a graph is polynomial in the number $n$ of vertices and the number $m$ of edges.
* b) The MST problem is computationally tractable because there are at most $m$ possibilities for the total cost of a spanning tree of a graph.
* c) Exhaustive search does not solve the TSP in polynomial time because a graph has an exponential number of traveling salesman tours.
* d) The TSP is computationally intractable because a graph has an exponential number of traveling salesman tours.

**ANSWER**

* c) Exhaustive search does not solve the TSP in polynomial time because a graph has an exponential number of traveling salesman tours.

### Problem 19.3

Which of the following statements are true?

* a) If the $P \neq NP$ conjecture is true, NP-hard problems can never be solved in practice.
* b) If the $P \neq NP$ conjecture is true, no NP-hard problem can be solved by an algorithm that is always correct and that always runs in polynomial time.
* c) If the $P \neq NP$ conjecture is false, NP-hard problems can always be solved in practice.
* d) If the $P \neq NP$ conjecture is false, some NP-hard problems are polynomial-time solvable.

**ANSWER**

* b) If the $P \neq NP$ conjecture is true, no NP-hard problem can be solved by an algorithm that is always correct and that always runs in polynomial time.
* d) If the $P \neq NP$ conjecture is false, some NP-hard problems are polynomial-time solvable.

### Problem 19.4

Which of the following statements are implied by the $P \neq NP$ conjecture?

* a) Every algorithm that solves an NP-hard problem runs in superpolynomial time in the worst case.
* b) Every algorithm that solves an NP-hard problem runs in exponential time in the worst case.
* c) Every algorithm that solves an NP-hard problem always runs in super-polynomial time.
* d) Every algorithm that solves an NP-hard problem always runs in exponential time.

**ANSWER**

* a) Every algorithm that solves an NP-hard problem runs in superpolynomial time in the worst case.

### Problem 19.5

Suppose that a problem $A$ reduces to another problem $B$. Which of the following statements are always true?

* a) If $A$ is polynomial-time solvable, then $B$ is also polynomial-time solvable.
* b) If $B$ is NP-hard, then $A$ is also NP-hard.
* c) $B$ also reduces to $A$.
* d) $B$ cannot reduce to $A$.
* e) If the problem $B$ reduces to another problem $C$, then $A$ also reduces to $C$.

**ANSWER**

* e) If the problem $B$ reduces to another problem $C$, then $A$ also reduces to $C$.

### Problem 19.6

Assume that the $P \neq NP$ conjecture is true. Which of the following statements about the knapsack problem (Section 19.4.2) are correct?

* a) The special case in which all item sizes are positive integers less than or equal to $n^5$ , where $n$ is the number of items, can be solved in polynomial time.
* b) The special case in which all item values are positive integers less than or equal to $n^5$ , where $n$ is the number of items, can be solved in polynomial time.
* c) The special case in which all item values, all item sizes, and the knapsack capacity are positive integers can be solved in polynomial time.
* d) There is no polynomial-time algorithm for the knapsack problem in general.

**ANSWER**

* a) The special case in which all item sizes are positive integers less than or equal to $n^5$, where $n$ is the number of items, can be solved in polynomial time.
* b) The special case in which all item values are positive integers less than or equal to $n^5$ , where $n$ is the number of items, can be solved in polynomial time.
* d) There is no polynomial-time algorithm for the knapsack problem in general.

## Challenge Problems

### Problem 19.7

The input in the traveling salesman path problem (TSPP) is the same as that in the TSP, and the goal is to compute a minimum-cost cycle-free path that visits every vertex (that is, a tour without its final edge). Prove that the TSPP reduces to the TSP and vice versa.

**ANSWER**

* TSPP reduces to TSP.
  * First create the graph $G'$ by adding a new vertex $v'$ to original graph $G$, this new vertex is connected to all other vertices by zero-cost edges
  * Then we run the TSP solver on $G'$, this will create a tour with value $T$.
  * As the tour must contains $v'$, the cycle must contain it.
  * So removing it will also remove the cycle.
  * We then remove the new vertex from the tour, as their edges are all 0 valued, the value of the path is also $T$.
  * Adding the new vertex is done in $O(n)$.
  * The removing is done in $O(1)$
* TSP reduces to TSPP
  * First create the graph $G'$ from $G$.
  * This is done by two steps:
    1. Splitting an arbitrary vertex $v$ into copies $v'$ and $v''$.
       * Both new vertices have the same edges as $v$ and a new one, which is $c_{v'v''} = + \infty$.
    2. Adding new vertices $x, y$.
       * They are connected to all the original vertices with $+\infty$ costs and $c_{xv'} = c_{yv''} =0$.
  * Then we run the TSPP solver on $G'$, which results in a minimum-cost cycle-free path containing every vertex.
  * In this path, the head and tail will be $x$ and $y$, so we remove them.
  * Now the head and tail are $v'$ and $v''$.
  * Then we remove then and put $v$ back connect by the edges that were in $v'$ and $v''$.
  * As $v'$ have $v''$ the same edges as $v$ and there is no cycle in the path, this merging process will keep the value of the path.
  * Creating the new graph is $O(n)$.
  * Transforming the path into a tour is $O(1)$.
  
* Therefore TSPP is NP-Hard.

### Problem 19.8

This problem describes a computationally tractable special case of the TSP. Consider a connected and acyclic graph $T = (V,F)$ in which each edge $e \in F$ has a nonnegative length $a_e \geq  0$. Define the corresponding **tree instance** $G = (V,E)$ of the TSP by setting the cost $c_{vw}$ of each edge $(v, w) \in E$ equal to the length $\sum_{e \in P_{vw}} a_e$ of the (unique) $v-w$ path $P_{vw}$ in $T$.
Design a linear-time algorithm that, given a connected acyclic graph with nonnegative edge lengths, outputs a minimum-cost traveling salesman tour of the corresponding tree instance. Prove that your algorithm is correct.

**ANSWER**

* Algorithm
  * We traverse the graph $T$ in the order which depth-first search would be traverse $G$, using an arbitrary starting vertex.
  * We traverse using the edge connecting the current vertex to the next vertex.
  * Then we connect the tail with the head of the path.
* Proof
  * As the traverse order used is based on the original graph that does not have cycles, the path created will be indeed a tour.
  * Let's number the vertices in the order they are traversed as $1$ being the first and $n$ the last: $\{1, 2, \dots, n\}$
  * In dfs, the idea is to follow the vertices until you get in a leaf.
  * So when following the dfs traversing we start adding the original edges until we get to a left.
  * The next vertex will be one that wasn't originally connected to the current one, so the value of the edge connecting them is the value of the path that has some original edges already traversed and others don't.
  * So the original ones already traversed are counted twice.
  * The ones not traversed will now be traversed and will be counted once more when going from a leaf to the next vertex.
  * As the traverse order used is based on the original graph that does not have cycles, each edge will only be counted twice.
  * So each original edge will be counted twice and the total cost of any tour will be $2 \sum_{e\in F}a_e$.
  * This is the minimum value a tour can have, as any tour will necessarily count each original edge twice.


## Programming Problems

### Problem 19.9

Implement in your favorite programming language the exhaustive search algorithm for the TSP (as seen in Quiz 19.2). Give your implementation a spin on instances with edge costs chosen independently and uniformly at random from the set $\{1, 2, \dots, 100\}$. How large an input size (that is, how many vertices) can your program reliably process in under a minute? What about in under an hour?

**ANSWER**

The algorithms used here are based on **Naive Exhaustive-Search for TSP** and **Naive Branch-and-Bound for TSP** available on [CS267. Assignment 4: Traveling Salesman Problem](https://people.eecs.berkeley.edu/~demmel/cs267/assignment4.html).

#### Graph Class

```ruby
class Graph
  def initialize
    @edges = {}
    @vertices = {}
  end

  def tsp
    tspBase { |s, currentResult| tspSearch(s, currentResult) }
  end

  def tspNaive
    tspBase { |s, currentResult| tspSearch(s, currentResult, true) }
  end

  def addEdge(firstVertex, secondVertex, value)
    @vertices[firstVertex.to_s] = nil
    @vertices[secondVertex.to_s] = nil
    @edges["#{firstVertex}:#{secondVertex}"] = value
    @edges["#{secondVertex}:#{firstVertex}"] = value
  end

  private

  def tspBase
    n = @vertices.size
    w = (1..(n - 1)).inject { |sum, i| sum + getEdgeValue(i, i + 1) } + getEdgeValue(n, 1)
    currentResult = [n, (1..n).to_a, w]
    s = [1, [1], 0]
    yield(s, currentResult)
  end

  def getEdgeValue(firstVertex, secondVertex)
    @edges["#{firstVertex}:#{secondVertex}"]
  end

  def tspSearch(s, currentResult, naive = false)
    k, arr, w = s
    n = currentResult[0]
    wB = currentResult[2]
    if k == n
      new_w = w + getEdgeValue(arr[k - 1], arr[0])
      currentResult = [k, arr, new_w] if new_w < wB
    else
      notInArr = (1..n).to_a - arr
      notInArr.each do |j|
        new_w = w + getEdgeValue(arr[k - 1], j)
        if new_w < wB || naive
          new_S = [k + 1, arr + [j], new_w]
          currentResult = tspSearch(new_S, currentResult, naive)
        end
      end
    end
    currentResult
  end
end

```

#### Performance tests

```ruby
STDOUT.sync = true
require_relative "./ExhaustiveSearchTSP"
require "benchmark"

def generateGraphWithNVertices(n)
  graph = Graph.new
  (1..n).each do |i|
    (1..n).each do |j|
      next if i == j
      graph.addEdge(i, j, rand(0..100))
    end
  end
  graph
end

def testToVerifyPerformance(n)
  graph = generateGraphWithNVertices(n)
  time = Benchmark.measure { graph.tsp }
  puts "for n: #{n} time: #{time.real}"
end

testToVerifyPerformance(11)
testToVerifyPerformance(12)
testToVerifyPerformance(13)
```



### Input size analysis

#### Without the improvement

Under a minute it can reliably process 10, as 11 vertices sometimes took above 1 min.

Under an hour, it can reliably process 12 vertices, which took 471 s. 13 vertices took 6996 s, which are almost two hours!

#### With the improvement

Under a minute it can reliably process 15, as 16 vertices sometimes took above 1 min.

Under an hour, it can reliably process 17 vertices, which took in average 485 s, as 18 vertices frequently took more than an hour.

#### Time Comparison Between pure naïve and optimized for $3 \geq n \leq 11$

| $n$  | time naïve            | time optimized        |
| ---- | --------------------- | --------------------- |
| 3    | $5.16 \times 10^{-5}$ | $1.4 \times 10^{-5}$  |
| 4    | $5.49 \times 10^{-5}$ | $2.64 \times 10^{-5}$ |
| 5    | $1.68 \times 10^{-4}$ | $1.47 \times 10^{-4}$ |
| 6    | $6.87 \times 10^{-4}$ | $4.36 \times 10^{-4}$ |
| 7    | $7.82 \times 10^{-3}$ | $1.28 \times 10^{-3}$ |
| 8    | 0.05                  | 0.01                  |
| 9    | 0.43                  | 0.06                  |
| 10   | 3.66                  | 0.16                  |
| 11   | 91.55                 | 2.94                  |

The optimization indeed makes the code away faster than the complete naïve version.
