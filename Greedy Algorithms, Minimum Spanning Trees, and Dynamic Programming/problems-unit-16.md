# Chapter 16 - Introduction to Dynamic Programming

Questions available in the book **Algorithms Illuminated Part 3: Greedy Algorithms and Dynamic Programming** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 16.1

Consider the input graph

```
5 - 3 - 1 - 7 - 2 - 4 - 6
```

where vertices are labeled with their weights. What are the final array entries of the WIS algorithm from Section 16.2, and which vertices belong to the MWIS?

**ANSWER**

Array: `A = [0, 5, 5, 6, 12, 12, 16, 18]`

Vertices: `{5, 7, 6}`

### Problem 16.2

Which of the following statements hold? (Choose all that apply.)

* **a)** The WIS and WIS Reconstruction algorithms of Sections 16.2 and 16.3 always return a solution that includes a maximum-weight vertex.
* **b)** When vertices’ weights are distinct, the `WIS` and `WIS Reconstruction` algorithms never return a solution that includes a minimum-weight vertex.
* **c)** If a vertex $v$ does not belong to an MWIS of the prefix $G_i$ comprising the first $i$ vertices and $i-1$ edges of the input graph, it does not belong to any MWIS of $G_{i+1}, G_{i+2}, \dots,G_n$ either.
* **d)** If a vertex $v$ does not belong to an MWIS of $G_{i-1}$ or $G_i$, it does not belong to any MWIS of $G_{i+1}, G_{i+2},\dots,G_n$ either.

**ANSWER**

* **d)** If a vertex $v$ does not belong to an MWIS of $G_{i-1}$ or $G_i$, it does not belong to any MWIS of $G_{i+1}, G_{i+2},\dots,G_n$ either.

### Problem 16.3

This problem outlines an approach to solving the WIS problem in graphs more complicated than paths. Consider an arbitrary undirected graph $G = (V,E)$ with nonnegative vertex weights, and an arbitrary vertex $v \in V$ with weight $w_v$. Obtain $H$ from $G$ by removing $v$ and its incident edges from $G$. Obtain $K$ from $H$ by removing $v$’s neighbors and their incident edges:

```
.-.-v-.-.-. -> .-. .-.-. -> . .-.
    G              H          K 
```

Let $W_G$, $W_H$, and $W_K$ denote the total weight of an MWIS in $G$, $H$, and $K$, respectively, and consider the formula
$$
W_G = \max \{W_H, W_K + w_v\}
$$
Which of the following statements are true? (Choose all that apply.)

* **a)** The formula is not always correct in path graphs.
* **b)** The formula is always correct in path graphs but not always correct in trees.
* **c)** The formula is always correct in trees but not always correct in arbitrary graphs.
* **d)** The formula is always correct in arbitrary graphs.
* **e)** The formula leads to a linear-time algorithm for the WIS problem in trees.
* **f)** The formula leads to a linear-time algorithm for the WIS problem in arbitrary graphs.

**ANSWER**

* **c)** The formula is always correct in trees but not always correct in arbitrary graphs.
* **e)** The formula leads to a linear-time algorithm for the WIS problem in trees.

### Problem 16.4

Consider an instance of the knapsack problem with five items:

| Item | Value | Size |
| ---- | ----- | ---- |
| 1    | 1     | 1    |
| 2    | 2     | 3    |
| 3    | 3     | 2    |
| 4    | 4     | 5    |
| 5    | 5     | 4    |

and knapsack capacity $C = 9$.

What are the final array entries of the Knapsack algorithm from Section 16.5, and which items belong to the optimal solution?

**ANSWER**

Array: 

| C \ i | 0    | 1    | 2    | 3    | 4    | 5    |
| ----- | ---- | ---- | ---- | ---- | ---- | ---- |
| 0     | 0    | 0    | 0    | 0    | 0    | 0    |
| 1     | 0    | 1    | 1    | 1    | 1    | 1    |
| 2     | 0    | 1    | 1    | 3    | 3    | 3    |
| 3     | 0    | 1    | 2    | 4    | 4    | 4    |
| 4     | 0    | 1    | 3    | 4    | 4    | 5    |
| 5     | 0    | 1    | 3    | 5    | 5    | 6    |
| 6     | 0    | 1    | 3    | 6    | 6    | 8    |
| 7     | 0    | 1    | 3    | 6    | 7    | 9    |
| 8     | 0    | 1    | 3    | 6    | 8    | 9    |
| 9     | 0    | 1    | 3    | 6    | 8    | 10   |

Set: `S={2, 3, 5}`

## Challenge Problems

### Problem 16.5

This problem describes four generalizations of the knapsack problem. In each, the input consists of item values $v_1, v_2, \dots,v_n$, item sizes $s_1, s_2,\dots,s_n$, and additional problem-specific data (all positive integers).
Which of these generalizations can be solved by dynamic programming in time polynomial in the number $n$ of items and the largest number $M$ that appears in the input? (Choose all that apply.)

* **a)** Given a positive integer capacity $C$, compute a subset of items with the maximum-possible total value subject to having total size **exactly** $C$. (If no such set exists, the algorithm should correctly detect that fact.)
* **b)** Given a positive integer capacity $C$ and an item budget $k \in \{1, 2, \dots,n\}$, compute a subset of items with the maximum-possible total value subject to having total size at most $C$ and at most $k$ items.
* **c)** Given capacities $C_1$ and $C_2$ of two knapsacks, compute disjoint subsets $S_1, S_2$ of items with the maximum-possible total value $\sum_{i \in S_1} v_i + \sum_{i \in S_2} v_i$, subject to the knapsack capacities: $\sum_{i \in S_1} s_i \leq C_1$ and $\sum_{i \in S_2} s_i \leq C_2$.
* **d)** Given capacities $C_1, C_2, \dots,C_m$ of $m$ knapsacks, where $m$ could be as large as $n$, compute disjoint subsets $S_1, S_2, \dots,S_m$ of items with the maximum-possible total value $\sum_{i \in S_1} v_i+ \sum_{i \in S_2} v_i+ \cdots+ \sum_{i \in S_m} v_i$, subject to the knapsack capacities: $\sum_{i \in S_1} s_i  \leq C_1, \sum_{i \in S_2} s_i \leq C_2,  \dots ,$ and $\sum_{i \in S_m} s_i \leq C_m$.

**Answer**

* **a)** Given a positive integer capacity $C$, compute a subset of items with the maximum-possible total value subject to having total size **exactly** $C$. (If no such set exists, the algorithm should correctly detect that fact.)
* **b)** Given a positive integer capacity $C$ and an item budget $k \in \{1, 2, \dots,n\}$, compute a subset of items with the maximum-possible total value subject to having total size at most $C$ and at most $k$ items.
* **c)** Given capacities $C_1$ and $C_2$ of two knapsacks, compute disjoint subsets $S_1, S_2$ of items with the maximum-possible total value $\sum_{i \in S_1} v_i + \sum_{i \in S_2} v_i$, subject to the knapsack capacities: $\sum_{i \in S_1} s_i \leq C_1$ and $\sum_{i \in S_2} s_i \leq C_2$.
* **d)** Given capacities $C_1, C_2, \dots,C_m$ of $m$ knapsacks, where $m$ could be as large as $n$, compute disjoint subsets $S_1, S_2, \dots,S_m$ of items with the maximum-possible total value $\sum_{i \in S_1} v_i+ \sum_{i \in S_2} v_i+ \cdots+ \sum_{i \in S_m} v_i$, subject to the knapsack capacities: $\sum_{i \in S_1} s_i  \leq C_1, \sum_{i \in S_2} s_i \leq C_2,  \dots ,$ and $\sum_{i \in S_m} s_i \leq C_m$.

## Programming Problems

### Problem 16.6

Implement in your favorite programming language the `WIS` and `WIS Reconstruction` algorithms.

**ANSWER**

```ruby
class Graph
    attr_reader :nodes
    def initialize(nodes)
        @nodes = nodes
    end

    def getMaximumWeightedIndependentSet
        self.getMaximumWeightedIndependentSetValue
        self.reconstructIndependentSet
    end

    def getMaximumWeightedIndependentSetValue
        @subproblemsSolutions = Array.new(@nodes.size + 1)
        @subproblemsSolutions[0] = 0 #base case 1
        @subproblemsSolutions[1] = @nodes[0].weight #base case 2
        (2..@nodes.size).each do |i|
            @subproblemsSolutions[i] = [@subproblemsSolutions[i-1], (@subproblemsSolutions[i-2] + @nodes[i-1].weight)].max
        end
        @subproblemsSolutions[-1]
    end

    def to_s
        "Graph[nodes: #{nodes.map(&:to_s).to_s}]"
    end

    private

    def reconstructIndependentSet
        independentSet = []
        i = @nodes.size

        while i >= 2
            if @subproblemsSolutions[i-1] >= @subproblemsSolutions[i-2] + @nodes[i-1].weight # case 1 wins
                i = i -1 #exclude node[i-1]
            else #case 2 wins
                independentSet.push(@nodes[i-1]) #include node[i-1]
                i = i - 2 #exclude node[i-2]
            end
        end

        if i == 1 #base case 2
            independentSet.push(nodes[0])
        end

        independentSet
    end

end

class Node
    
    attr_accessor :neighbors, :key, :weight

    def initialize(key, weight)
        @key = key
        @weight = weight
    end

    def to_s
        "Node:[key: #{@key.to_s}, weight: #{@weight.to_s}, neighbors: #{@neighbors.map(&:key).to_s}]"
    end

    def ==(other)
        return false unless other.is_a? Node

        other.key == @key
    end
end
```



### Problem 16.7

Implement in your favorite programming language the `Knapsack` and `Knapsack Reconstruction` algorithms.

```ruby
class Knapsack
  attr_reader :items, :size

  def initialize(items, size)
    @items = items
    @size = size
  end

  def getIterativeSolution
    getIterativeSolutionValue
    reconstructKnapsacIterative
  end

  def getRecursiveSolution
    getRecursiveSolutionValue
    reconstructKnapsacRecursive
  end

  def getIterativeSolutionValue
    puts 'generating subproblems solutions array'
    @subproblemsSolutions = Array.new(@items.size + 1)
    (0..@subproblemsSolutions.size - 1).each do |i|
      @subproblemsSolutions[i] = Array.new(size + 1)
    end
    puts "subproblems solutions array size: #{@subproblemsSolutions.size * @subproblemsSolutions[0].size}"
    puts 'solving base case i = 0'
    # base case (i = 0)
    (0..size).each do |c|
      @subproblemsSolutions[0][c] = 0
    end

    # systematically solve all problems
    puts 'solving all problems systemativally'
    (1..@subproblemsSolutions.size - 1).each do |i|
      (0..size).each do |c|
        if items[i - 1].size > c
          @subproblemsSolutions[i][c] = @subproblemsSolutions[i - 1][c]
        else
          @subproblemsSolutions[i][c] =
            [@subproblemsSolutions[i - 1][c],
             (@subproblemsSolutions[i - 1][c - @items[i - 1].size] + @items[i - 1].value)].max
        end
      end
    end

    @subproblemsSolutions[-1][-1]
  end

  def getRecursiveSolutionValue
    @recursiveSubproblemsSolutions = {}
    result = getIterativeSolutionValueHelper(@items.size, size)
    puts "recursive subproblems size: #{@recursiveSubproblemsSolutions.size}" 
    result
  end

  def to_s
    "Knapsack:[size: #{@size}, number of items: #{@items.size}, items:\n#{@items.map(&:to_s)}]"
  end

  def getInfo
    "Knapsack:[size: #{@size}, number of items: #{@items.size}]"
  end

  private

  def reconstructKnapsacIterative
    reconstructKnapsac {|i, c| @subproblemsSolutions[i][c]}
  end

  def reconstructKnapsacRecursive
    reconstructKnapsac {|i, c| @recursiveSubproblemsSolutions["#{i}-#{c}"]}
  end

  def reconstructKnapsac
    solutionItems = []
    c = size

    @items.size.downto(1).each do |i|
      if @items[i - 1].size <= c && (yield((i - 1), (c - @items[i - 1].size)) + @items[i - 1].value) >= yield((i - 1),c)
        solutionItems.push(items[i - 1])
        c -= @items[i - 1].size
      end
    end

    solutionItems
  end

  def getIterativeSolutionValueHelper(n, c)
    return @recursiveSubproblemsSolutions["#{n}-#{c}"] if @recursiveSubproblemsSolutions.include? "#{n}-#{c}"

    return 0 if n == 0

    if @items[n - 1].size > c
      result = getIterativeSolutionValueHelper(n - 1, c)
    else
      case1 = getIterativeSolutionValueHelper(n - 1, c)
      case2 = getIterativeSolutionValueHelper(n - 1, c - @items[n - 1].size) + @items[n - 1].value

      result = [case1, case2].max
    end

    @recursiveSubproblemsSolutions["#{n}-#{c}"] = result
    result
  end
end

class Item
  attr_reader :key, :value, :size

  def initialize(key, value, size)
    @key = key
    @value = value
    @size = size
  end

  def to_s
    "Item[key: #{@key}, value: #{@value}, size: #{@size}]"
  end
end
```

