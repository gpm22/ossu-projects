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