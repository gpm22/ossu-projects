# In-Class Problems Week 7, Fri.

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/1f5977990f3867d4602d5bec13c56abe/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp17.pdf).

## Problem 1

* **a)** Explain why exactly six terms are required to finish all these subjects, if you can take as many subjects as you want per term. 

  Because in order to do 6.857, you have to do 6.033 before and in order to do it, you have to do 6.004 before, but in order to do it, you need to do 6.001 and 6.002 before it, but in order to do 6.002, you have to do 18.03 and 8.02 before, but in order to do them you need to do 18.01 and 8.01 first.

  1. 18.01, 8.01, 6.001 
  2. 6.042, 18.02, 18.03, 8.02, 6.034
  3. 6.046, 6.002, 
  4. 6.003, 6.004, 6.840
  5. 6.033
  6. 6.857

* **b)** In the second term of the greedy schedule, you took five subjects including 18.03. Identify a set of five subjects not including 18.03 such that it would be possible to take them in any one term (using some nongreedy schedule). 

  18.002, 8.002, 6.034, 6.003, 6.840

* **c)** Exhibit a schedule for taking all the courses—but only one per term.

  1. 18.01
  2. 8.01
  3. 6.001 
  4. 6.042
  5. 18.02
  6. 18.03
  7. 8.02
  8. 6.034
  9. 6.046
  10. 6.002 
  11. 6.003
  12. 6.004
  13. 6.840
  14. 6.033
  15. 6.857

* **d)** ) Suppose that you want to take all of the subjects, but can handle only two per term. Exactly how many terms are required to graduate? Explain why.

  8 terms, because you need 6 to do 6.857, which 1 is only for 18.03 and 8.02, and 2 terms to do the non-blocking subjects;

  1. 18.01, 8.01, 
  2. 18.03, 8.02
  3. 6.001, 6.002,                  
  4. 6.004, 6.042
  5. 6.033, 6.046
  6. 6.857, 6.840
  7. 18.02, 6.034
  8. 6.003

* **e)** What if you could take three subjects per term?

  It would be 6, because you only need to move some non-blocking subjects.

  1. 18.01, 8.01, 6.001 
  2. 6.042, 18.03, 8.02, 
  3. 6.046, 6.002, 18.02
  4. 6.003, 6.004, 6.840
  5. 6.033, 6.034
  6. 6.857

## Problem 2

* **a)** Give some valid order in which the tasks might be completed.

  40 days;

  1. L1, A2 
  2. L3
  3. L4
  4. A5
  5. L6
  6. L8, A7

* **b)** Lisa and Annie want to know how long conquering the galaxy will take. Annie suggests dividing the total number of days of work by the number of workers, which is two. What lower bound on the time to conquer the galaxy does this give, and why might the actual time required be greater?

  * This gives 37 days, the actual time may be greater as the job cannot be perfect spited between the workers. 

* **c)** Lisa proposes a different method for determining the duration of their project. She suggests looking at the duration of the critical path, the most time-consuming sequence of tasks such that each depends on the one before. What lower bound does this give, and why might it also be too low?

  * This gives 39, and it is low as they don't have infinite workers and they cannot do parallel work;

* **d)** What is the minimum number of days that Lisa and Annie need to conquer the galaxy? No proof is required.

  * 40 days;

## Problem 3

* **a)**  Sauron is trying to describe various features of his scheduling problem using standard terminology. For each feature below, indicate the number of the corresponding term.
  1. A set of tasks that can be worked on simultaneously. 
     4. Antichain;
  2. A possible order in which all the tasks could be completed, if only one Ringwraith were available.
     2. Topological sort;
  3. The minimum number of weeks required to complete all tasks, if an unlimited number of Ringwraiths were available.
     7. Length of the longest chain
* **b)** Write a simple formula involving $n$ and $t$ for the smallest number of Ringwraiths that could possibly be able to complete all $n$ tasks in $t$ week. Given any $n$ and $t$, describe a DAG that can be completed in $t$ weeks using this number of Ringwraiths.
  * The number of ringwraiths is defined by the largest antichain, so the smallest number of ringwraiths is $n/t$
  * The DAG of problem 1 illustrates this;
* **c)** Write a simple formula involving $n$ and $t$ for the largest number of Ringwraiths that could possibly be able to complete all $n$ tasks in $t$ weeks. 
  * If he is unlucky, then the largest chain is bigger than $t$, so he is need at most $n-t+1$;


## Problem 4

If $a$ and $b$ are distinct nodes of a digraph, then $a$ is said to **cover** $b$ if there is an edge from $a$ to $b$ and every path from $a$ to $b$ includes this edge. If $a$ covers $b$, the edge from $a$ to $b$ is called a **covering edge**.

* **a)** What are the covering edges in the DAG in Figure 2?
  $$
  \langle1, 2 \rangle, \langle 2, 4 \rangle, \langle 3, 6 \rangle, \langle 1, 5 \rangle, \langle 1, 3 \rangle, \langle 2, 6 \rangle
  $$
  

* **b)** Let covering $(D)$ be the subgraph of $D$ consisting of only the covering edges. Suppose $D$ is a finite DAG. Explain why covering $(D)$ has the same positive walk relation as $D$.

  * Because the only difference between them is that we remove the "redundant edges";

* **c)** Show that if two DAG’s have the same positive walk relation, then they have the same set of covering edges;

  * The positive walk relation just shows that two vertices are connected or not, and the covering edges are the minimum edges necessary to have some walk relation, so for a walk relation $W$, every graph that posses it wil have the same **covering edges** that creates $W$. 

* **d)** Conclude that covering $(D)$ is the unique DAG with the smallest number of edges among all digraphs with the same positive walk relation as $D$.

  * As said in question **c)**, the covering edges are the minimum edges necessary to have some walk relation. therefore  the covering $(D)$ is the unique DAG with the smallest number of edges among all digraphs with the same positive walk relation as $D$.

* **e)** Describe two graphs with vertices $\{1, 2 \}$ which have the same set of covering edges, but not the same positive walk relation;
  
  1. $\{ \langle 1 \to 2 \rangle \}$
  2. $\{ \langle 1 \to 2 \rangle , \langle 1 \to 1 \rangle \}$

* **f)**

  1. The complete digraph without self-loops on vertices 1; 2; 3 has edges between every two distinct vertices. What are its covering edges?
     * There is not a unique set of covering edges in this case, because you remove the edges of 2 adjacent vertices, you will got a set of covering edges, like:
     * $\{ \langle 2 \to 1 \rangle, \langle 1 \to 3 \rangle, \langle 3\to 2 \rangle \}$
  2. What are the covering edges of the graph with vertices $1, 2, 3$ and edges $\{ \langle 1 \to 2 \rangle, \langle 2 \to 3 \rangle, \langle 3 \to 1 \rangle \}$
     * $\{ \langle 1 \to 2 \rangle, \langle 2 \to 3 \rangle, \langle 3 \to 1 \rangle \}$
  3. What about their positive walk relations?
     * They are the same;
