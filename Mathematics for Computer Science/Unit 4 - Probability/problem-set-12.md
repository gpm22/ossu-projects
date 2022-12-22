# Problem Set 12

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/69ffc68a8b45c24513d0a74a62a6eff1/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_ps12.pdf).

## Problem 1

Let $R$, $S$, and $T$ be random variables with same codomain $V$.

* **a)** Suppose $R$ is uniform ($\Pr[R=b]=1/|V|$ for all $b \in V$) and $R$ is independent of $S$. Prove that $\Pr[R=S]=1/|V|$.

  * We know that the event $[R = S]$ is a disjoint union of events, that is, $[R = S] = \bigcup_{b \in V}[R=b \text{ AND } S =b]$.

  * Then
    $$
    \begin{align*}
    	\Pr[R=S] & = \Pr \left[\bigcup_{b \in V}[R=b \text{ AND } S =b] \right] \\
    	         & =  \sum_{b \in V} \Pr[R=b \text{ AND } S =b] \\
    	         & =  \sum_{b \in V} \Pr[R=b] \cdot \Pr[S =b] \\
    	         & =  \sum_{b \in V} \frac 1 {|V|} \cdot \Pr[S =b] \\
    	         & = \frac 1 {|V|}  \cdot \sum_{b \in V}\Pr[S =b] \\
    	         & = \frac 1 {|V|} \cdot 1 \\
    	         & = \frac 1 {|V|} 
    \end{align*} 
                 
    $$
    

* **b)** Let $ S \times T$ be the random variable giving values of $S$ and $T$, ($(S \times T)(\omega) = (S(\omega), T(\omega))$). Now suppose $R$ is a uniform distribution and it is independent of $S \times T$. Prove that $[R = S]$ is independent of $[S = T]$.

  * The probability that $R = S$ is the same as the probability that $R$ equals the first coordinate of $S \times T$, that is:
    $$
    \Pr[R=S] = \Pr[(S = R, T)]
    $$

  * The event $\Pr[S=T]$ has the same probability of the event where the coordinates are equal in $S \times T$:
    $$
    \Pr[S = T] = \Pr[(S = b, T=b)]
    $$
    For all $b \in V$.

  * Then
    $$
    \begin{align*}
    	\Pr[R=S \text{ AND } S=T] & = \Pr[R=S \text{ AND } (S=b, T=b)] \\
    	& = \Pr[(S=R, T) \text{ AND } (S=b, T=b)]  \\
    	& = \Pr[(S=R, T=R)]  
    \end{align*}
    $$
    

  * As $R$ s independent of $S \times T$,  $[R = S]$ is independent of $[S = T]$.

  

* **c)** Let $V = \{1,2,3 \}$ and $(R, S, T)$ take the following triples of values with equal probability:
  $$
  (1, 1, 1), (2, 1, 1), (1, 2, 3), (2, 2, 3), (1, 3, 2), (2, 3, 2)
  $$
  Verify that:

  1. $R$ is independent of $S \times T$.
     * $R$ is independent of $S \times T$, as the value of $S \times T$ does not interferer in the value of $R$.
     * $R$ is 1 or 2 with probability $1/2$ in all triples. 
  2. The event $[R=S]$ is no independent of $[S=T]$.
     * The probability $\Pr[R=S \text{ AND } S=T] = 1/6$ is different from $\Pr[R=S] \cdot \Pr[S=T] = 1/9$. 
  3. $S$ and $T$ have a uniform distribution.
     * It is trivial to conclude as both values of $S$ and $T$ has the same probability of $1/3$.

## Problem 2

The army needs to test $n$ soldiers for a disease. There is a blood test that accurately determines when a blood sample contains blood from a diseased soldier. The army presumes, based on experience, that the fraction of soldiers with the disease is approximately equal to some small number $p$.

Approach (1) is to test blood from each soldier individually; this requires $n$ tests.

Approach (2) is to randomly group the soldiers into $g$ groups of $k$ soldiers, where $n=gk$.  For each group, blend the $k$ blood samples of the people in the group, and test the blended sample. If the group-blend is free of the disease, we are done with that group after one test. If the group-blend tests positive for the disease, then someone in the group has the disease, and we to test all the people in the group for a total of $k +1$ test on that group.

Since the groups are chosen randomly, each soldier in the group has the disease with probability p, and it is safe to assume that whether one soldier has the disease is independent of whether the others do. 

* **a)** What is the expected number of tests in Approach (2) as a function of the number of soldiers $n$, the disease fraction $p$, and the group size $k$? 

  * As each group has the probability $1-\binom k0 (1-p)^k = 1 -(1-p)^k$ of having the disease and $(1-p)^k$ of not having it and we got $g$ groups:

  $$
  \begin{align*}
  	\text{Ex}[\text{number os tests}] & = g((k+1)(1 -(1-p)^k)+(1-p)^k) \\ 
  	& = g(k -k(1-p)^k + 1 ) \\
  	& = n -n(1-p)^k + \frac nk
  \end{align*}
  $$

  

* **b)** Show how to choose k so that the expected number of tests using Approach (2) is approximately $n \sqrt p$.
  $$
  n \sqrt p = n -n(1-p)^k + \frac nk
  $$

  * Since $p$ is small, we assume $(1-p)^k \approx 1$, then:
    $$
    \sqrt p = 1 -1+ \frac 1k
    $$
    

  * Therefore $k$ is:
    $$
    k = \frac 1 {\sqrt p}
    $$

* **c)** What fraction of the work does Approach (2) expect to save over Approach (1) in a million-strong army of whom approximately 1% are diseased? 
  $$
  \frac{n - n\sqrt p}{n} = 1 - \sqrt{p} = 0.9
  $$
  

* **d)** Can you come up with a better scheme by using multiple levels of grouping, that is, groups of groups? 

  * First you do one test with all samples.
  * Then you divide by 2 the infected groups and do this until find the infected soldiers.

## Problem 3

* **a)** What is the probability that the last $k$-clause in $S$ is true under the random assignment?
  $$
  1 - \frac {1}{2^k}
  $$

* **b)** What is the expected number of true $k$-clauses in $S$?
  $$
  n \left( 1 - \frac {1}{2^k} \right)
  $$
  
* **c)** A set of propositions is **satisfiable** iff there is an assignment to the variables that makes all of the propositions true. Use your answer to part **b)** to prove that if $n < 2^k$, then $S$ is satisfiable.

  * The number of possible permutations for a $k$-clause is $2^k$, where one of them is false.
  * Therefore, $n < 2^k$ is needed to assure that $S$ is satisfiable.