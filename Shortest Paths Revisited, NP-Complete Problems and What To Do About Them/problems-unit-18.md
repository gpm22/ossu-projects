# Chapter 18 - Shortest Paths Revisited

Questions available in the book **Algorithms Illuminated Part 3: Greedy Algorithms and Dynamic Programming** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 18.1

For the input graph

```
           w  <- -30
           |      \
          -10      \
           ↓        \
s ---10--> u ---20--> v
           |
          40
           ↓
           x
```

what are the final array entries of the Bellman-Ford algorithm?

**ANSWER**

| $i/v$ | s    | u         | x         | v         | w         |
| ----- | ---- | --------- | --------- | --------- | --------- |
| 0     | 0    | $+\infty$ | $+\infty$ | $+\infty$ | $+\infty$ |
| 1     | 0    | 10        | $+\infty$ | $+\infty$ | $+\infty$ |
| 2     | 0    | 10        | 50        | -10       | $+\infty$ |
| 3     | 0    | 10        | 50        | -10       | -40       |
| 4     | 0    | -50       | 50        | -10       | -40       |
| 5     | 0    | -50       | -10       | -70       | -40       |



### Problem 18.2

Lemma 18.3 shows that once the subproblem solutions stabilize in the Bellman-Ford algorithm (with $L_{k+1,v} = L_{k,v}$ for every destination $v$), they remain the same forevermore (with $L_{i,v} = L_{k,v}$ for all $i \geq k$ and $v \in V$). 
Is this also true on a per-vertex basis? That is, is it true that, whenever $L_{k+1,v} = L_{k,v}$ for some $k \geq 0$ and destination $v, L_{i,v} = L_{k,v}$ for all $i \geq k$? Provide either a proof or a counterexample.

**ANSWER**

That is not true, the problem 18.1 shows a counterexample.

### Problem 18.3

Consider a directed graph $G = (V,E)$ with $n$ vertices, $m$ edges, a source vertex $s \in V$, real-valued edge lengths, and no negative cycles. Suppose you know that every shortest path in $G$ from $s$ to another vertex has at most $k$ edges. How quickly can you solve the single-source shortest path problem? (Choose the strongest statement that is guaranteed to be true.)

* **a)** $O(m + n)$
* **b)** $O(kn)$
* **c)** $O(km)$
* **d)** $O(mn)$

**ANSWER**

* **c)** $O(km)$

### Problem 18.4

For the input graph

```
 2i -- 1 -> 3i
 ↑      ↗   |
 2     5    3
 |   /      ↓
 1i <- 4 -- 4i
```

what are the final array entries of the Floyd-Warshall algorithm?

**ANSWER**

* $k=0$

  | $v, w$ | 1         | 2         | 3         | 4         |
  | ------ | --------- | --------- | --------- | --------- |
  | 1      | 0         | 2         | 5         | $+\infty$ |
  | 2      | $+\infty$ | 0         | 1         | $+\infty$ |
  | 3      | $+\infty$ | $+\infty$ | 0         | 3         |
  | 4      | 4         | $+\infty$ | $+\infty$ | 0         |

* $k=1$

  | $v, w$ | 1         | 2         | 3    | 4         |
  | ------ | --------- | --------- | ---- | --------- |
  | 1      | 0         | 2         | 5    | $+\infty$ |
  | 2      | $+\infty$ | 0         | 1    | $+\infty$ |
  | 3      | $+\infty$ | $+\infty$ | 0    | 3         |
  | 4      | 4         | 6         | 9    | 0         |

* $k=2$

  | $v, w$ | 1         | 2         | 3    | 4         |
  | ------ | --------- | --------- | ---- | --------- |
  | 1      | 0         | 2         | 3    | $+\infty$ |
  | 2      | $+\infty$ | 0         | 1    | $+\infty$ |
  | 3      | $+\infty$ | $+\infty$ | 0    | 3         |
  | 4      | 4         | 6         | 7    | 0         |

* $k=3$

  | $v, w$ | 1         | 2         | 3    | 4    |
  | ------ | --------- | --------- | ---- | ---- |
  | 1      | 0         | 2         | 3    | 6    |
  | 2      | $+\infty$ | 0         | 1    | 4    |
  | 3      | $+\infty$ | $+\infty$ | 0    | 3    |
  | 4      | 4         | 6         | 7    | 0    |

* $k=4$

  | $v, w$ | 1    | 2    | 3    | 4    |
  | ------ | ---- | ---- | ---- | ---- |
  | 1      | 0    | 2    | 3    | 6    |
  | 2      | 8    | 0    | 1    | 4    |
  | 3      | 7    | 9    | 0    | 3    |
  | 4      | 4    | 6    | 7    | 0    |

### Problem 18.5

For the input graph

```
 2i --- 10 --> 3i
 ↑          ↗  |
 |        /    |
 |      /      |
 20    50      -3
 |    /        |
 |  /          ↓
 1i <- -40 -- 4i
```

what are the final array entries of the Floyd-Warshall algorithm?

**ANSWER**

* $k=0$

  | $v, w$ | 1         | 2         | 3         | 4         |
  | ------ | --------- | --------- | --------- | --------- |
  | 1      | 0         | 20        | 50        | $+\infty$ |
  | 2      | $+\infty$ | 0         | 10        | $+\infty$ |
  | 3      | $+\infty$ | $+\infty$ | 0         | -3        |
  | 4      | -40       | $+\infty$ | $+\infty$ | 0         |

* $k=1$

  | $v, w$ | 1         | 2         | 3    | 4         |
  | ------ | --------- | --------- | ---- | --------- |
  | 1      | 0         | 20        | 50   | $+\infty$ |
  | 2      | $+\infty$ | 0         | 10   | $+\infty$ |
  | 3      | $+\infty$ | $+\infty$ | 0    | -3        |
  | 4      | -40       | -20       | 10   | 0         |

* $k=2$

  | $v, w$ | 1         | 2         | 3    | 4         |
  | ------ | --------- | --------- | ---- | --------- |
  | 1      | 0         | 20        | 30   | $+\infty$ |
  | 2      | $+\infty$ | 0         | 10   | $+\infty$ |
  | 3      | $+\infty$ | $+\infty$ | 0    | -3        |
  | 4      | -40       | -20       | -10  | 0         |

* $k=3$

  | $v, w$ | 1         | 2         | 3    | 4    |
  | ------ | --------- | --------- | ---- | ---- |
  | 1      | 0         | 20        | 30   | 27   |
  | 2      | $+\infty$ | 0         | 10   | 7    |
  | 3      | $+\infty$ | $+\infty$ | 0    | -3   |
  | 4      | -40       | -20       | -10  | -13  |

* $k=4$

  | $v, w$ | 1    | 2    | 3    | 4    |
  | ------ | ---- | ---- | ---- | ---- |
  | 1      | -13  | 7    | 17   | 14   |
  | 2      | -33  | -13  | -3   | -6   |
  | 3      | -43  | -23  | -13  | -16  |
  | 4      | -53  | -33  | -23  | -26  |

## Challenge Problems

### Problem 18.6

The Floyd-Warshall algorithm runs in $O(n^3)$ time on graphs with $n$ vertices and $m$ edges, whether or not the input graph contains a negative cycle.
Modify the algorithm so that it solves the all-pairs shortest path problem in $O(mn)$ time for input graphs with a negative cycle and $O(n^3)$ time otherwise.

**ANSWER**

The modification is to create a new graph $G'$ from $G$, where it has a new vertex $s$ which has an zero-value edge to each other vertex.

Then we run the Bellman-Ford algorithm on $G'$, if it returns that $G'$ has a negative cycle, then we return the same, otherwise we run the Floyd-Warshall Algorithm o $G$.

### Problem 18.7

Which of the following problems can be solved in $O(n^3)$ time, where $n$ is the number of vertices in the input graph?

* **a)** Given a directed graph $G = (V,E)$ with nonnegative edge lengths, compute the maximum length of a shortest path between any pair of vertices (that is, $\max_{v,w \in V} \text{dist}(v, w)$).
* **b)** Given a directed acyclic graph with real-valued edge lengths, compute the length of a longest path between any pair of vertices.
* **c)** Given a directed graph with nonnegative edge lengths, compute the length of a longest cycle-free path between any pair of vertices.
* **d)** Given a directed graph with real-valued edge lengths, compute the length of a longest cycle-free path between any pair of vertices.

**ANSWER**

* **a)** Given a directed graph $G = (V,E)$ with nonnegative edge lengths, compute the maximum length of a shortest path between any pair of vertices (that is, $\max_{v,w \in V} \text{dist}(v, w)$).
* **b)** Given a directed acyclic graph with real-valued edge lengths, compute the length of a longest path between any pair of vertices.

## Programming Problems

### Problem 18.8
