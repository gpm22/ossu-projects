# Chapter 9 - Dijkstra’s Shortest-Path Algorithm

Questions available in the book **Algorithms Illuminated Part 2: Graph Algorithms and Data Structures** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 9.1

Consider a directed graph $G$ with distinct and nonnegative edge lengths. Let $s$ be a starting vertex and $t$ a destination vertex, and assume that $G$ has at least one $s$-$t$ path. Which of the following statements are true? (Choose all that apply.) 

* **a)**  might have as many as $n-1$ edges, where $n$ is the number of vertices.
* **b)** There is a shortest $s$-$t$ path with no repeated vertices.
* **c)** The shortest $s$-$t$ path must include the minimum-length edge of $G$.
* **d)** The shortest $s$-$t$ path must exclude the maximum-length edge of $G$.

**ANSWER**

* **a)**  might have as many as $n-1$ edges, where $n$ is the number of vertices.
* **b)** There is a shortest $s$-$t$ path with no repeated vertices.

### Problem 9.2

Consider a directed graph $G$ with a starting vertex $s$, a destination $t$, and nonnegative edge lengths. Under what conditions is the shortest $s$-$t$ path guaranteed to be unique?

* **a)** When all edge lengths are distinct positive integers.
* **b)** When all edge lengths are distinct powers of 2.
* **c)** When all edge lengths are distinct positive integers and the graph G contains no directed cycles.
* **d)** None of the other options are correct.

**ANSWER**

* **b)** When all edge lengths are distinct powers of 2.

### Problem 9.3

Consider a directed graph $G$ with nonnegative edge lengths and two distinct vertices, $s$ and $t$. Let $P$ denote a shortest path from $s$ to $t$. If we add 10 to the length of every edge in the graph, then: (Choose all that apply.)

* **a)** $P$ definitely remains a shortest $s$-$t$ path.
* **b)** $P$ definitely does not remain a shortest $s$-$t$ path.
* **c)** $P$ might or might not remain a shortest s-t path (depending on the graph).
* **d)** If $P$ has only one edge, then $P$ definitely remains a shortest s-t path.

**ANSWER**

* **c)** $P$ might or might not remain a shortest s-t path (depending on the graph).
* **d)** If $P$ has only one edge, then $P$ definitely remains a shortest s-t path.

### Problem 9.4

Consider a directed graph $G$ and a starting vertex $s$ with the following properties:

* no edges enter the starting vertex $s$;
* edges that leave $s$ have arbitrary (possibly negative) lengths;
* and all other edge lengths are nonnegative.

Does Dijkstra’s algorithm correctly solve the single-source shortest path problem in this case? (Choose all that apply.)

* **a)** Yes, for all such inputs.
* **b)** Never, for no such inputs.
* **c)** Maybe, maybe not (depending on the specific choice of $G$, $s$, and edge lengths).
* **d)** Only if we add the assumption that $G$ contains no directed cycles with negative total length.

**ANSWER**

* **a)** Yes, for all such inputs.

### Problem 9.5

Consider a directed graph $G$ and a starting vertex $s$. Suppose $G$ has some negative edge lengths but no negative cycles, meaning $G$ does not have a directed cycle in which the sum of its edge lengths is negative. Suppose you run Dijkstra’s algorithm on this input. Which of the following statements are true? (Choose all that apply.)

* **a)** Dijkstra’s algorithm might loop forever.
* **b)** It’s impossible to run Dijkstra’s algorithm on a graph with negative edge lengths.
* **c)** Dijkstra’s algorithm always halts, but in some cases the shortest path distances it computes will not all be correct. 
* **d)** Dijkstra’s algorithm always halts, and in some cases the shortest path distances it computes will all be correct.

**ANSWER**

* **c)** Dijkstra’s algorithm always halts, but in some cases the shortest path distances it computes will not all be correct. 
* **d)** Dijkstra’s algorithm always halts, and in some cases the shortest path distances it computes will all be correct.

### Problem 9.6

Continuing the previous problem, suppose now that the input graph $G$ does contain a negative cycle, and also a path from the starting vertex $s$ to this cycle. Suppose you run Dijkstra’s algorithm on this input. Which of the following statements are true? (Choose all that apply.)

* **a)** Dijkstra’s algorithm might loop forever.
* **b)** It’s impossible to run Dijkstra’s algorithm on a graph with a negative cycle.
* **c)** Dijkstra’s algorithm always halts, but in some cases the shortest path distances it computes will not all be correct.
* **d)** Dijkstra’s algorithm always halts, and in some cases the shortest path distances it computes will all be correct.

**ANSWER**

* **c)** Dijkstra’s algorithm always halts, but in some cases the shortest path distances it computes will not all be correct.
* **d)** Dijkstra’s algorithm always halts, and in some cases the shortest path distances it computes will all be correct.

## Challenge Problems

### Problem 9.7

Consider a directed graph $G = (V,E)$ with nonnegative edge lengths and a starting vertex $s$. Define the bottleneck of a path to be the maximum length of one of its edges (as opposed to the sum of the lengths of its edges). Show how to modify Dijkstra’s algorithm to compute, for each vertex $v \in V$, the smallest bottleneck of any $s$-$v$ path. Your algorithm should run in $O(mn)$ time, where $m$ and $n$ denote the number of edges and vertices, respectively.

**ANSWER**

* **Input**:

	* Directed graph $G = (V, E)$ in adjacency-list representation, a vertex $s \in V$, a length $l_e \geq 0$ for each $e \in E$.

* **Postcondition**:

	* For every vertex $v$, the value $\text{bot}(v)$ equals the bottleneck of path $s$-$t$.

* **Pseudocode**

	```ruby
	# Initialization
	X := {s}
	bot(v) := 0 for every v in V
	# Main loop
	while there is an edge (v, w) with v in X, w not in X do
		(v*, w*) := such an edge maximizing max{bot(v), l_vw}
		add w* to X
		bot(w*) := max{bot(v*),l_v*w*}
	end
	```

## Programming Problems

### Problem 9.8

Implement in your favorite programming language the Dijkstra algorithm from Section 9.2, and use it to solve the single-source shortest path problem in different directed graphs. With the straightforward implementation in this chapter, what’s the size of the largest problem you can solve in five minutes or less?

**ANSWER**

* `Graph`and `Node` classes:

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

  

* `dijkstra` implementation:

  ```ruby
  def dijkstra(graph, starting_vertex)
      puts "starting dijkstra"
      shortest_distance = Hash[graph.nodes.collect { |n| [n.value, nil]}]
      shortest_distance[starting_vertex.value] = 0
  
      vertices_to_visit = Hash[graph.nodes.collect { |n| [n.value, n]}]
  
      visited_vertices = Hash.new
      visited_vertices[starting_vertex.value] = starting_vertex
  
      vertices_to_visit.delete(starting_vertex.value)
      possible_edges = Hash[starting_vertex.neighbors.collect {|n|  [[starting_vertex.value, n[0].value], n[1]]}]
  
      while !possible_edges.empty? 
          minimum_edge = get_minimum_edge(possible_edges, shortest_distance)
          visited_vertices[minimum_edge[1]] = vertices_to_visit.delete(minimum_edge[1])
          shortest_distance[minimum_edge[1]] = shortest_distance[minimum_edge[0]] + minimum_edge[2]
          possible_edges = get_possible_edges(visited_vertices, vertices_to_visit)
      end
  
      shortest_distance
  end
  
  def get_minimum_edge(edges, shortest_distance)
      initial_key = edges.keys[0]
      initial_len = edges[initial_key]
      minimal_dijkstra_number = shortest_distance[initial_key[0]] + initial_len
      minimum_edge = [initial_key[0], initial_key[1], initial_len]
      edges.each do |key, len|
          current_dijkstra_number = shortest_distance[key[0]] + len
          if current_dijkstra_number < minimal_dijkstra_number
              minimal_dijkstra_number = current_dijkstra_number
              minimum_edge = [key[0], key[1], len]
          end
      end
      minimum_edge
  end
  
  
  def get_possible_edges(visited_vertices, vertices_to_visit)
      possible_edges = Hash.new
      visited_vertices.each do |key, value|
          value.neighbors.each do |n|
              if vertices_to_visit.has_key?(n[0].value)
                  possible_edges[[key, n[0].value]] = n[1]
              end
          end
      end
      possible_edges
  end
  ```

* Code to verify largest possible graph to be solved in less than 5 minutes:

  ```ruby
  require 'benchmark'
  
  puts "starting test to verify size of the graph so dijkstra runs in less than 5 minutes" 
  n = 1350 #number of nodes of the complete graph
  puts "creating graph with #{n} nodes"
  g = Graph.newCompleteGraphWithRandomLenghts(n)
  puts "running dijkstra"
  time = Benchmark.measure {
      dijkstra(g, g.nodes[0])
  }
  puts "finishing test executed in #{time.real} s"
  ```

* A complete graph of 1350 nodes took 303 s to run, so as for complete graphs $mn = (n^3-n^2)/2$, the maximum size is $mn \approx 1.23 \times 10^9$

