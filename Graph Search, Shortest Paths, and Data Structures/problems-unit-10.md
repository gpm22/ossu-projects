# Chapter 10 - The Heap Data Structure

Questions available in the book **Algorithms Illuminated Part 2: Graph Algorithms and Data Structures** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 10.1

Which of the following patterns in a computer program suggests that a heap data structure could provide a significant speed-up? (Check all that apply.)

* **a)** Repeated lookups.
* **b)** Repeated minimum computations.
* **c)** Repeated maximum computations.
* **d)** None of the other options.

**ANSWER**

* **b)** Repeated minimum computations.
* **c)** Repeated maximum computations.

### Problem 10.2

Suppose you implement the functionality of a priority queue (that is, `Insert` and `ExtractMin`) using an array **sorted** from largest to smallest. What is the worst-case running time of `Insert` and `ExtractMin`, respectively? Assume you have a large enough array to accommodate all your insertions.

* **a)** $\Theta(1)$ and $\Theta(n)$.
* **b)** $\Theta(n)$ and $\Theta(1)$.
* **c)** $\Theta(\log n)$ and $\Theta(1)$.
* **d)** $\Theta(n)$ and $\Theta(n)$.

**ANSWER**

**b)** $\Theta(n)$ and $\Theta(1)$.

### Problem 10.3

Suppose you implement the functionality of a priority queue (that is, `Insert` and `ExtractMin`) using an **unsorted** array. What is the worst-case running time of `Insert` and `ExtractMin`, respectively? Assume you have a large enough array to accommodate all your insertions.

* **a)** $\Theta(1)$ and $\Theta(n)$.
* **b)** $\Theta(n)$ and $\Theta(1)$.
* **c)** $\Theta(1)$ and $\Theta(\log n)$.
* **d)** $\Theta(n)$ and $\Theta(n)$.

**ANSWER**

* **a)** $\Theta(1)$ and $\Theta(n)$.

### Problem 10.4

You are given a heap with $n$ objects. Which of the following tasks can you solve using $O(1)$ `Insert` and `ExtractMin` operations and $O(1)$ additional work? (Choose all that apply.)

* **a)** Find the object stored in the heap with the fifth-smallest key.
* **b)** Find the object stored in the heap with the maximum key.
* **c)** Find the object stored in the heap with the median key.
* **d)** None of the above.

**ANSWER**

* **a)** Find the object stored in the heap with the fifth-smallest key.

## Challenge Problems

### Problem 10.5

Continuing Problem 9.7, show how to modify the heap-based implementation of Dijkstra’s algorithm to compute, for each vertex $v \in V$, the smallest bottleneck of an $s$-$v$ path. Your algorithm should run in $O((m+n) \log n)$ time, where $m$ and $n$ denote the number of edges and vertices, respectively.

**ANSWER**

* **Input**:

	* Directed graph $G = (V, E)$ in adjacency-list representation, a vertex $s \in V$, a length $l_e \geq 0$ for each $e \in E$.

* **Postcondition**:

	* For every vertex $v$, the value $\text{bot}(v)$ equals the bottleneck of path $s$-$t$.

* **Pseudocode**

	```ruby
	# Initialization
	X := empty set, H := empty heap
	key(s) := 0
	for every v != s do
	    key(v) := +inf
	end
	for every v in V do
	    Insert v into H # or use Heapify
	end
	# Main loop
	while H is non-empty do
	    w* := ExtractMin(H)
	    add w* to X
	    bot(w*) := key(w*)
	    # update heap to maintain invariant
	    for every edge (w*, y) do
	        Delete y from H
	        key(y) := max{key(y),l_w*y}
	        Insert y into H
	    end
	end
	```

### Problem 10.6

We can do better. Suppose now the graph is undirected. Give a linear-time (that is, $O(m + n)$-time) algorithm to compute a minimum-bottleneck path between two given vertices.

**ANSWER**

Based on the paper [**On the bottleneck shortest path problem** (KAIBEL, Volker; PEINHARDT, Matthias; 2006)](https://opus4.kobv.de/opus4-zib/files/916/ZR-06-22.pdf).

```ruby
i := 0
max_iteration = floor(log m)
while i < max_iteration do
    M := median of the graph weights currently in the graph
    remove edges with weight less than M
    if graph is not s-t connected then
        Let V be the set of connected components
        Reinsert all edges removed in this iteration
        Shrink V
    end
    i := i + 1 
end
return the last remaining edge
```

This algorithm is $O(m)$.

### Problem 10.7

What if the graph is directed? Can you compute a minimum-bottleneck path between two given vertices in less than $O((m + n) \log n)$ time?

**ANSWER**

The paper [**On the bottleneck shortest path problem** (KAIBEL, Volker; PEINHARDT, Matthias; 2006)](https://opus4.kobv.de/opus4-zib/files/916/ZR-06-22.pdf) shows that this is only possible in the case where an ordering of the edge weights is known, for which the algorithm is linear.

## Programming Problems

### Problem 10.8

Implement in your favorite programming language the heap-based version of the Dijkstra algorithm from Section 10.4, and use it to solve the single-source shortest path problem in different directed graphs. With this heap-based implementation, what’s the size of the largest problem you can solve in five minutes or less?

**ANSWER**

* `Heap` class

  ```ruby
  class Heap
      attr_accessor :elements
  
      def initialize
          @elements=[]
          @positions=Hash.new
      end
  
      def findMin
          @elements[0]
      end
  
      def extractMin
          self.delete(@elements[0][1])
      end
  
      def heapify(arr)
          @elements = arr
          @positions = Hash[@elements.collect.with_index {|e, i| [e[1], i]}]
          (1..arr.size).each do |i|
              self.bubbleDown(i)
          end
      end
  
      def insert(element)
          @elements.push(element)
          @positions[element[1]] = (@elements.size) - 1 
          self.bubbleUp
          element
      end
  
      def delete(element)
          position = @positions[element]
          @elements[position], @elements[-1], @positions[element], @positions[@elements[-1][1]] = @elements[-1], @elements[position] , @positions[@elements[-1][1]], @positions[element]
          deleted = @elements.pop
          @positions.delete(element)
          self.bubbleDown(position+1)
          deleted
      end
  
      def to_s
          "elements: #{@elements.to_s}\npositions: #{@positions.to_s}"
      end
  
      def empty?
          @elements.empty?
      end
  
      def include?(element)
          @positions.has_key?(element)
      end
  
      private
  
      def bubbleUp
          position = @elements.size
          parentPosition = getParentPosition(position)
          while @elements[parentPosition][0] > @elements[position-1][0]
              @elements[parentPosition], @elements[position-1] , @positions[@elements[parentPosition][1]], @positions[@elements[position-1][1]] = @elements[position-1], @elements[parentPosition], @positions[@elements[position -1][1]], @positions[@elements[parentPosition][1]]
              position = parentPosition+1
              return if parentPosition == 0
              parentPosition = getParentPosition(position)
          end
      end
  
      def bubbleDown(startPosition)
          position = startPosition
          smallerChildPosition = getSmallerChildPosition(position)
          return if smallerChildPosition > @elements.size-1
          while @elements[smallerChildPosition][0] < @elements[position-1][0]
              @elements[smallerChildPosition], @elements[position-1] , @positions[@elements[smallerChildPosition][1]], @positions[@elements[position-1][1]] = @elements[position-1], @elements[smallerChildPosition], @positions[@elements[position-1][1]], @positions[@elements[smallerChildPosition][1]]
              position = smallerChildPosition+1
              smallerChildPosition = getSmallerChildPosition(position)
              return if smallerChildPosition > @elements.size-1
          end
      end
  
      def getParentPosition(position)
          (position/2).floor - 1
      end
  
      def getLeftChildPosition(position)
          2*position-1
      end
  
      def getRightChildPosition(position)
          2*position
      end
  
      def getSmallerChildPosition(position)
          left = getLeftChildPosition(position)
          right = getRightChildPosition(position)
  
          return left if right > (@elements.size - 1)
  
          if @elements[left][0] < @elements[right][0]
              left
          else
              right
          end
      end
  end
  ```

* `Graph` and `Node` Classes

  ```ruby
  class Graph
      attr_accessor :nodes
  
      def initialize(nodes)
          @nodes = nodes
      end
  
      def to_s
          @nodes.map{|n| n.to_s.gsub! '"', ''}.to_s
      end
  
      def self.newCompleteGraphWithRandomLenghts(number_of_vertices)
          nodes = (0..number_of_vertices).map {|i| Node.new(i.to_s, [])}
          nodes.each_index do |i|
              puts "Filling node with neighbors #{i}/#{nodes.size}"
              neighbors = nodes.map {|n| [n, rand(0..100000)]} 
              neighbors.delete_at(i)
              nodes[i].neighbors = neighbors
          end
          Graph.new(nodes)
      end
  
  end
  
  class Node
      attr_accessor :neighbors, :value
      def initialize(value, neighbors)
          @value = value
          @neighbors = neighbors
          @explored = false
          @scc = -1
      end
  
      def to_s
          "value: " + @value + " - neighbors: "+ @neighbors.map{|pair| [pair[0].value.to_s, pair[1].to_s]}.to_s
      end
  
      def ==(other)
          false if !(other.instance_of? Node)
          self.value == other.value
      end
  
      def hash
          self.value.hash
      end
  end
  ```

* `dijkstra` implementation

  ```ruby
  def dijkstra(graph, starting_vertex)
      puts "starting dijkstra"
  
      nodesMap = Hash[graph.nodes.collect { |n| [n.value, n]}]
      shortest_distance = Hash[graph.nodes.collect { |n| [n.value, nil]}]
      shortest_distance[starting_vertex.value] = 0
  
      vertices_to_visit = Heap.new
      vertices_to_visit.heapify(graph.nodes.map do |n| 
          if n == starting_vertex
              [0, n.value]
          else
              [Float::INFINITY, n.value] 
          end 
      end)
      
  
      visited_vertices = Hash.new
  
      while !vertices_to_visit.empty? 
          new_vertice = vertices_to_visit.extractMin
          new_vertice_node = nodesMap[new_vertice[1]]
          visited_vertices[new_vertice[1]] =  new_vertice_node
          shortest_distance[new_vertice[1]] = new_vertice[0]
  
          new_vertice_node.neighbors.each do |neighbor|
              if vertices_to_visit.include?(neighbor[0].value)
                  deleted = vertices_to_visit.delete(neighbor[0].value)
                  new_key = [deleted[0], shortest_distance[new_vertice[1]] + neighbor[1]].min
                  vertices_to_visit.insert([new_key, neighbor[0].value])
              end
          end 
  
      end
  
      shortest_distance
  end
  ```

* Code to verify largest possible graph to be solved in less than 5 minutes:

  ```ruby
  require 'benchmark'
  
  puts "starting test to verify size of the graph so dijkstra runs in less than 5 minutes" 
  n = 14700 #number of nodes of the complete graph
  puts "creating graph with #{n} nodes"
  g = Graph.newCompleteGraphWithRandomLenghts(n)
  puts "running dijkstra"
  time = Benchmark.measure {
      dijkstra(g, g.nodes[0])
  }
  puts "finishing test executed in #{time.real} s"
  ```

* A complete graph of 14700 nodes took 297 s to run, so as for complete graphs $m+n = (n^2+n)/2$, the maximum size is $m + n \approx 108 \times 10^6$