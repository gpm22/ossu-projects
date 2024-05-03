# 20 - Compromising on Speed: Exact Inefficient Algorithms

Questions available in the book **Algorithms Illuminated Part 4: Algorithms For NP-Hard Problems** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 21.1

Does the `BellmanHeldKarp` algorithm for the `TSP` (Section 21.1.6) refute the $P \neq NP$ conjecture? (Choose all that apply.)

* **a)** Yes, it does.
* **b)** No. A polynomial-time algorithm for the `TSP` does not necessarily refute the $P \neq NP$ conjecture.
* **c)** No. Because the algorithm uses an exponential (in the input size) number of subproblems, it does not always run in polynomial time.
* **d)** No. Because the algorithm might perform an exponential amount of work to solve a single subproblem, it does not always run in polynomial time.
* **e)** No. Because the algorithm might perform an exponential amount of work to extract the final solution from the solutions to its subproblems, it does not always run in polynomial time.

**ANSWER**

* **c)** No. Because the algorithm uses an exponential (in the input size) number of subproblems, it does not always run in polynomial time.

### Problem 21.2

For the `TSP` input in Quiz 20.7, what are the final subproblem array entries of the `BellmanHeldKarp` algorithm from Section 21.1.6?

**ANSWER**

* The graph is defined by 
  $$
  V = \{a, b, c, d, e\} \\
  E = \{ (a, b, 1), (a, c, 4), (a, d, 5), (a, e, 10), \\
         (b, c, 2), (b, d, 6), (b, e, 3), \\
         (c, d, 7), (c, e, 8), \\
         (d, e, 9) \}
  $$
  
* The $15 \times 4$ final array is

  ```ruby
      #| b | c | d | e |
  A = [[ 1, NA, NA, NA], #|S| = 2, s = {a, b}
       [NA,  4, NA, NA], #|S| = 2, s = {a, c}
       [NA, NA,  5, NA], #|S| = 2, s = {a, d}
       [NA, NA, NA, 10], #|S| = 2, s = {a, e}
       [ 6,  3, NA, NA], #|S| = 3, s = {a, b, c}
       [11, NA,  7, NA], #|S| = 3, s = {a, b, d}
       [13, NA, NA,  4], #|S| = 3, s = {a, b, e}
       [NA, 12, 11, NA], #|S| = 3, s = {a, c, d}
       [NA, 18, NA, 12], #|S| = 3, s = {a, c, e}
       [NA, NA, 19, 14], #|S| = 3, s = {a, d, e}
       [14, 13, 10, NA], #|S| = 4, s = {a, b, c, d}
       [15, 12, NA,  9], #|S| = 4, s = {a, b, c, e}
       [NA, 22, 21, 20], #|S| = 4, s = {a, c, d, e}
       [17, NA, 13, 14], #|S| = 4, s = {a, b, d, e}
       [23, 19, 18, 17]] #|S| = 5, s = {a, b, c, d, e}
  ```
  

### Problem 21.3

Consider the following proposed subproblems for an instance $G = (V,E)$​ of the TSP:

**Subproblems (Attempt)**

* Compute $C_{i,v}$, the minimum cost of a cycle-free path that begins at vertex 1, ends at vertex $v$, and visits exactly $i$ vertices (or $+\infty$, if there is no such path).
* For each $i \in \{2, 3, \dots, |V|\}$ and $v \in V - \{1\}$.

What prevents us from using these subproblems, with $i$ as the measure of subproblem size, to design a polynomial-time dynamic programming algorithm for the TSP? (Choose all that apply.)

* **a)** The number of subproblems is super-polynomial in the input size.
* **b)** Optimal solutions to bigger subproblems cannot be computed easily from optimal solutions to smaller subproblems.
* **c)** The optimal tour cannot be computed easily from the optimal solutions to all the subproblems.
* **d)** Nothing!

**ANSWER**

* **b)** Optimal solutions to bigger subproblems cannot be computed easily from optimal solutions to smaller subproblems.

Because will be necessary to verify if cycles are not being created.

### Problem 21.4

Which of the following problems can be solved in $O(n^2 2^n)$ time for $n$-vertex graphs using a minor variation of the `BellmanHeldKarp` algorithm? (Choose all that apply.)

* **a)** Given an $n$-vertex undirected graph, determine whether it has a Hamiltonian path (a cycle-free path with $n - 1$ edges).
* **b)** Given an $n$-vertex directed graph, determine whether it has a directed Hamiltonian path (a cycle-free directed path with $n - 1$ edges).
* **c)** Given a complete undirected graph and real-valued edge costs, compute the maximum cost of a traveling salesman tour.
* **d)** Given a complete $n$-vertex directed graph (with all $n(n - 1)$ directed edges present) and real-valued edge costs, compute the minimum cost of a directed traveling salesman tour (a directed cycle that visits every vertex exactly once).
* **e)** The cycle-free shortest path problem defined on page 29 in Section 19.5.4.

**ANSWER**

* **a)** Given an $n$-vertex undirected graph, determine whether it has a Hamiltonian path (a cycle-free path with $n - 1$ edges).
* **b)** Given an $n$-vertex directed graph, determine whether it has a directed Hamiltonian path (a cycle-free directed path with $n - 1$ edges).
* **c)** Given a complete undirected graph and real-valued edge costs, compute the maximum cost of a traveling salesman tour.
* **d)** Given a complete $n$-vertex directed graph (with all $n(n - 1)$ directed edges present) and real-valued edge costs, compute the minimum cost of a directed traveling salesman tour (a directed cycle that visits every vertex exactly once).
* **e)** The cycle-free shortest path problem defined on page 29 in Section 19.5.4.

### Problem 21.5

For the instance
$$
V = \{a, b, c, d, e, f, g, h\} \\
E = \{ (a, c, 1), (a, f, 2), \\
       (b, e, 6), (b, d, 4), \\
       (c, e, 7), (c, h, 8), \\
       (d, g, 5), (d, f, 3), \\
       (e, g, 9), (f, h, 10)\} \\
\text{red} = \{a, b \}\\
\text{green} = \{c, d\}\\
\text{blue} = \{e, f\}\\
\text{yellow} = \{g, h\}\\
$$


what are the final subproblem array entries of the `PanchromaticPath` algorithm from Section 21.2.5?

**ANSWER**

* The $15 \times 8$ final array is

  ```ruby
  #    | a|  b|  c|  d|  e|  f|  g|  h|
  A = [[ 0,  0, NA, NA, NA, NA, NA, NA], #|S| = 1, S ={red}
       [NA, NA,  0,  0, NA, NA, NA, NA], #|S| = 1, S ={green}
       [NA, NA, NA, NA,  0,  0, NA, NA], #|S| = 1, S ={blue}
       [NA, NA, NA, NA, NA, NA,  0,  0], #|S| = 1, S ={yellow}
       [ 1,  4,  1,  4, NA, NA, NA, NA], #|S| = 2, S ={red, green}
       [ 2,  6, NA, NA,  6,  2, NA, NA], #|S| = 2, S ={red, blue}
       [NA, NA, NA, NA, NA, NA, NA, NA], #|S| = 2, S ={red, yellow}
       [NA, NA,  7,  3,  7,  3, NA, NA], #|S| = 2, S ={green, blue}
       [NA, NA,  8,  5, NA, NA,  5,  8], #|S| = 2, S ={green, yellow}
       [NA, NA, NA, NA,  9, 10,  9, 10], #|S| = 2, S ={blue, yellow}
       [ 5,  7,  3,  5,  8,  3, NA, NA], #|S| = 3, S ={red, green, blue}
       [ 9,  9, NA, NA, NA, NA,  9,  9], #|S| = 3, S ={red, green, yellow}
       [12, 15, NA, NA, NA, NA, 15, 12], #|S| = 3, S ={red, blue, yellow}
       [NA, NA, 16, 13, 14,  8,  8, 13], #|S| = 3, S ={green, blue, yellow}
       [10, 17, 13, 19, 15, 11, 10, 11]] #|S| = 4, S ={red, green, blue, yellow}
  ```

### Problem 21.6

Propose an implementation of a postprocessing step that reconstructs a minimum-cost traveling salesman tour from the subproblem array computed by the `BellmanHeldKarp` algorithm. Can you achieve a linear (in the number of vertices) running time, perhaps after adding some extra bookkeeping to the `BellmanHeldKarp` algorithm?

**ANSWER**

I suggest first creating an map $M$ that relates a subset $S$​ with the last vertex of the path, that will be the one that creates the minimum path.

Next the map will be traversed first with $S = V$, then $S = V - \{v_n\}, S = V - \{v_n, v_{n-1}\}, \dots, S = \{v_1, v_2\}$.

Then we add the vertices from this map to the path and finally we add the first vertex to the path, concluding it.

The new `BellmanHeldKarp` algorithm will be:

```ruby
def BellmanHeldKarp(V, E)
    # subproblems (1 in S, |S| >= 2, j in V - {1})
    # (only subproblems with j in S are ever used)
    A := (2^(n-1) - 1) * (n - 1) two-dimensional array

    # Hash map to relate subproblems to last vertex
    M := {} 
    # base cases (|S| = 2)
    for j = 2 to n do
        A[{1, j}][j] := c_1j
        M[{1, j}] = j
    end

    # systematically solve all subproblems
    for s = 3 to n do # s=subproblem size
        for S with |S| = s and 1 in S do
            for j in S - {1} do
            # use recurrence from Corollary 21.2
                A[S][j], M[S] := getMinAndVertex(j, S, A)
            end
        end
    end

	# use (21.6) to compute the optimal tour cost
    tour_cost, last_vertex = getMinAndVertex(nil, n, A)
    M[n] = last_vertex
	return tour_cost, createPath(M, n)
end


def getMinAndVertex(j, S, A)
	value = MAX
    vertex = nil
    
    for k in S
        next if k == 1
		
        new_value = j ? A[S - {j}][k] + c_kj : A[S][k] + c_kj
        
        if new_value < value
            value = new_value
            vertex = k
        end
    end
    
    return value, vertex
end

def createPath(M, S)
    path = [S[0]] # initiates with v_1
    S = S - S[0]
    while |S| > 0
        new_vertex = M[S]
        path.push(new_vertex)
        S = S-new_vertex
    end
    return path
end
```

### Problem 21.7

Propose an implementation of a postprocessing step that reconstructs a minimum-cost panchromatic path from the subproblem array computed by the `PanchromaticPath` algorithm. Can you achieve a linear (in the number of colors) running time, perhaps after adding some extra bookkeeping to the `PanchromaticPath` algorithm?

**ANSWER**

I suggest first creating an array $M$ of the same size as A that relates a colors subset $S$​ and a vertex with the previous vertex of the selected minimum path.

Next $M$ will be traversed first with $S = C$ and the last select vertex, then $S = C - \{c_n\}, S = C - \{c_n, c_{n-1}\}, \dots, S = \{c_1\}$.

Then we add the vertices from this map to the path and return it at the end.

The new `PanchromaticPath` algorithm will be:

```ruby
def PanchromaticPath(V, color, E)
    # subproblems (indexed by S, a subset of {1,...,k}, v in V )
    A := (2^k - 1) x |V| two-dimensional array
    M := (2^k - 1) x |V| two-dimensional array
    # base cases (|S| = 1)
    for i = 1 to k do #colors
        for v in V do
            if color(v) = i then
                A[{i}][v] := 0 # via the empty path
            else
                A[{i}][v] := +inf # no such path
            end
        end
    end
    # systematically solve all subproblems
    for s = 2 to k do # s=subproblem size
        for S with |S| = s do
            for v in V do
                # use recurrence from Lemma 21.4
                A[S][v], M[S][v] := getMinAndVertex(v, color, E, A)
            end
        end
    end		
    # best of solutions to largest subproblems
    
    min_path, last_vertex = getTotalMinAndLastVertex(V, A, k)
    return min_path, createPath(last_vertex, M)
end    
    
def getMinAndVertex(v, color, E, A)
	value = MAX
    vertex = nil

    for (w, v) in E
        next if not color(v)
		
        new_value = A[S - {color(v)}][w] + cwv
        
        if new_value < value
            value = new_value
            vertex = w
        end
    end
    
    return value, vertex
end
    
def getTotalMinAndLastVertex(V, A, k)
    min_path = MAX
    vertex = nil
    
    for v in V
        new_min = A[{1, 2,...,k}][v])
        if new_min < min_path
            new_min = min_path
            vertex = v
        end
	end
    
    return min_path, vertex
end

def createPath(last_vertex, M, S, color)
    path = [last_vertex]
    current_vertex = M[S][last_vertex]
    S = S - color(last_vertex)
    while current_vertex
        path.push(current_vertex)
        new_vertex = M[S][current_vertex]
        break if !new_vertex
        S = S-color(current_vertex)
        current_vertex = new_vertex
    end
    return path
end
```



## Challenge Problems

### Problem 21.8

Optimize the `BellmanHeldKarp` algorithm for the TSP (Section 21.1.6) so that its memory requirement drops from $O(n \cdot 2 ^n )$ to $O( \sqrt n \cdot 2 ^ n )$ for $n$​-vertex instances. (You are responsible only for computing the minimum cost of a tour, not an optimal tour itself.)

**ANSWER**

A idea would be to keep only the values of the vertices that appears in the subproblem.

So if the subproblem is $\{a, b\}$, only have the value $A[\{a, b\}][b]$​.

But for this case the number of subproblems will be $\sum_{i=1}^{n} i \cdot \binom ni = n \cdot 2 ^ {n-1}$, which is just half of the current subproblems.

To really decrease the use of memory we need to keep just the strict necessary values of the array, that way after calculating for $|S| = i$, remove the records for $|S| = i -1$, as they are not necessary any longer.

As for a level $|S| = i$ the number of necessary space is $f(i) = i \cdot \binom n i$, the biggest needed memory will happen where $\frac {df}{di} = 0$, with $ 1 \leq i \leq n$.

Using the assistance of wolfram alpha:
$$
\frac {df}{di} = \binom n i \left( i \psi^{(0)}(n-i+1)-i\psi^{(0)}(i+1)+1 \right)
$$
Where $\psi^{(0)}$​​ is 0th derivative of the digamma function.

It roots will be a function of $n$, so let's take its values for $n$ from $10, 20, \dots, 50$:

| $n$  | root |
| ---- | ---- |
| 10   | 5.5  |
| 20   | 10.5 |
| 30   | 15.5 |
| 40   | 20.5 |
| 50   | 25.5 |

We can observe that the root is at $\frac {n+1} 2$​.

So the maximum value needed is 
$$
\frac {n+1} 2 \binom {n}{\frac {n+1}2} & = & \frac{n+1} 2 \frac {n!}{(\frac {n-1}2)!(\frac {n+1}2)!} \\ 
& \approx & \frac n2 \frac {n!}{(n/2)!^2}
$$
Using Stirling's approximation:
$$
n! \approx \sqrt {2 \pi n} \left(\frac n e \right)^n
$$

We get:
$$
\frac n2 \frac {\sqrt {2 \pi n} \left(\frac n e \right)^n}{\left(\sqrt {\pi n} \left(\frac n {2e} \right)^{n/2}\right)^2} & = & \frac n2 \frac {\sqrt {2 \pi n} \left(\frac n e \right)^n}{\pi n \left(\frac n {2e} \right)^{n}} \\
& = & \frac 12 \frac {\sqrt {2 \pi n}}{\pi \left(\frac 1 {2} \right)^{n}} \\
& = & \frac {\sqrt {2 \pi n} 2^n}{2\pi} \\ 
& = & \frac {\sqrt n 2^n}{\sqrt {2 \pi}} 
$$
Which is $O(\sqrt n \cdot 2^n)$.

### Problem 21.9

Show how to encode instances of the following problems as mixed integer programs:

* **a)** Maximum-weight independent set (Section 19.4.2).
* **b)** Makespan minimization (Section 20.1.1).
* **c)** Maximum coverage (Section 20.2.1).

**ANSWER**

* **a)** Maximum-weight independent set (Section 19.4.2).
  * Decision variables $x_j$​ is 1 or 0.
    * With 1 is present in the solution and 0 is not.
  * The constraints is that vertex cannot be adjacent:
    * For each edge $(u, v)$ we have $x_u + x_v \leq 1$.
  * Objective function $\sum_{v \in S} w_v$ is $\sum_{j=1}^n x_j w_j$.
* **b)** Makespan minimization (Section 20.1.1).
  * Decision variables $x_{ij}$​ is 1 or 0.
    * 1 represents that the job $j$ is assigned to machine $i$.
  * The constraints
    * For every job $j$ we have $\sum_{i=1}^m x_{ij} =1$.
    * For every machine $i$ we have $\sum_{j=1}^n \ell_jx_{ij} \leq M$.
  * Objective function $M$ (makespan) to be minimized.
* **c)** Maximum coverage (Section 20.2.1).
  * Decision variables:
    * $x_i$​ is 1 or 0.
      * 1 represents that the subset is part of the final solution.
    * $y_e$ is 1 or 0.
      * 1 represents that element $e$ belongs to a chosen subset.
  * The constraints
    * Choice $K \subset \{ 1, 2, \dots, m\}$ size must be $k$, which means $\sum_{i=1}^m x_i = k$.
    * For every element $e \in U$, $y_e \leq \sum_{i: e \in A_i}x_i$.
  * Objective function $f_\text{cov}(K) = \left|\cup_{i \in K} A_i\right|$​ to be maximized.
    * Which results in maximizing $\sum_{e \in U}y_e$.

### Problem 21.10

### Problem 21.11

### Problem 21.12

### Problem 21.13

## Programming Problems

### Problem 21.14

### Problem 21.15