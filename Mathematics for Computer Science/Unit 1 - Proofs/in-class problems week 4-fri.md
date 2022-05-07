# In-Class Problems Week 4, Fri.

Questions available in [MIT](https://openlearninglibrary.mit.edu/assets/courseware/v1/f23aa2c4f34101bde4851e022006774c/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp9.pdf).

## Problem 1

**State machine, $R$:**

* **States** $::= \N^3$ (triples of nonnegative integers)
* **Start state** $::= (x, y, 0)$
* **Transitions** $::= (r, s, a) \rightarrow \begin{cases} (2r, s/2, a)       & \quad \text{for even } s>0 \\ (2r, (s-1)/2, a+r)   & \quad \text{for odd } s >0\end{cases} $

* **a)** Verify that $P((r,s,a)) ::= [rs+a = xy]$ is a preserved invariant of $R$.

  * **Answer**

    To prove that $P$ is preserved, assume that $P((r, s, a))$ holds and that $(r, s, a) \rightarrow (r_ t,s_t,a_t)$. We must probe that $P((r_ t,s_t,a_t))$ holds, that is,
    $$
    P((r_ t,s_t,a_t)) = [r_ts_t+a_t = xy] \ \ \ \ (1)
    $$
    Since there is a transition from $(r, s, a)$, we have $s \neq 0$, so we can consider just two cases:

    * If $s$ is even, then we have $r_t=2r$, $s_t = s/2$, and $a_t = a$. Therefore
      $$
      r_ts_t + a_t = 2r(s/2)+a
      \\
      r_ts_t + a_t = rs+a
      \\
      r_ts_t + a_t =  xy \quad (\text{by (1)})
      $$
    
  * If $s$ is odd, then we have $r_t=2r$, $s_t = (s-1)/2$, and $a_t = a+r$. Therefore
      $$
      r_ts_t + a_t = 2r((s-1)/2)+a+r
      \\
      r_ts_t + a_t = r(s-1)+a+r
      \\
      r_ts_t + a_t = rs-r+a+r
      \\
      r_ts_t + a_t = rs+a
      \\
      r_ts_t + a_t =  xy \quad (\text{by (1)})
      $$
  
  So, as in both cases (1) holds, $P$ is a preserved invariant.
  
* **b)** Prove that $R$ is partially correct.

  As $P$ is a preserved invariant, if the program terminates, it does with $xy$ in register $a$. This works as $P$ holds for the start state $(x,y,0)$:
  $$
  P((x,y,0)) = xy+0
  \\
  P((x,y,0)) = xy
  $$

* **c)** Briefly explain why this state machine will terminate after a number of transitions bounded by a small constant times the length of the binary representation of $y$.

  This happens as the number in register $s$ is initially $y$, and gets at least halved with each transition, so it can't be halved more than $(log(b) + 1)$, which is roughly the length of the binary representation of $y$. The small constant will be due to the multiplications and adding.

## Problem 2

* **a)** Write out the "list" representation of the start state and the "impossible" state:

  * **start state**: (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
  * **impossible state:** (15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
    * (n-1) + (n-2) + ... (1) =  (n-1)(n-2)/2

* **b)** Let a state, $S$, be a pair $(L, (i, j))$, we define parity as:
  $$
  \text{parity}(S) ::= \begin{cases} 0      & \quad \text{if } p(L) + i \text{ is even.} \\ 1   & \quad \text{otherwise.} \end{cases}
  $$
  Verify that the parity of the start state and the target state are different.

  * **Parity of start state**:
    $$
    p((1, 2, ..., 15)) + i = 0 + 4 = 4 
    \\
    \text{parity}(((1, 2, ..., 15), (4, 4))) = 0
    $$

  * **Parity of the impossible state:**
    $$
    p((15, 14, ..., 1)) + i = 91 + 4 = 95 
    \\
    \text{parity}(((15, 14, ..., 1), (4, 4))) = 1
    $$

* **c)** Show that the parity of the state is preserved under transitions. Conclude that "the impossible" is impossible to reach.

  * **transitions:**

    * $(L, (i, j)) \rightarrow (L, (i, j \pm 1)) $
      * For this case the parity is preserved, as $L$ and $i$ did not changed.
    * $(L, (i, j)) \rightarrow (L', (i \pm 1, j)) $
      * $| p(L) - p(L')| = 3$ is constant, as the puzzle is a 4x4 square, so $4-1 =3$.
      * If $p(L) + i$ is even, so $p(L) \pm 3 +i \pm 1$ will also be even;
      * If $p(L) + i$ is odd, so $p(L) \pm 3 +i \pm 1$ will also be odd;

    So the parity of the state is preserved under transitions, therefore is impossible to reach "the impossible" from the start state.

## Problem 3

* **a)** Give a mathematical model of the Authority's system for letting cars on and off the bridge by specifying a transition relation between states of the form (A, B, C) above.

  * **Transition Relations:** 
    * $x$ cars have entered and $y$ have leaved: $\{ (A, B, C) \rightarrow (A+3x, B+2y, C+x-y) \}\ |\ 0  \leq x \leq (1000-C),\ 0 \leq y \leq C  \}$

* **b)** Characterize each of the following derived variables:

  * $A$

    * **WI**, as it will keep receiving money, but it is possible that cars do not enter between transitions.

  * $B$

    * **WI**, as it will keep receiving money, but it is possible that cars do not leave between transitions.

  * $A+B$

    * **WI**, as it will keep receiving money, but it is possible that cars do not enter or leave between transitions.

  * $A-B$

    * $A-B \rightarrow A+3x -B - 2y = A-B +3x-2y$
    * **N**, as this variable can increase and decrease after each transaction, it depends on the number of cars entering and leaving.

  * $3C-A$

    * $3C-A \rightarrow 3(C+x-y) - (A + 3x) = 3C + 3x -3y - A -3x = 3C - A -3y$
    * So, it is **WD**, as $y \geq 0$.

  * $2A-3B$

    * **N**, as this variable can increase and decrease after each transaction, it depends on the number of cars entering and leaving.

  * $B+3C$

    * $B+3C \rightarrow B+2y +3(C-y+x) = B +3C +3x -y$
    * **N**, as this variable can increase and decrease after each transaction, it depends on the number of cars entering and leaving.

  * $2A-3B-6C$
    $$
    2A-3B-6C \rightarrow 2(A+3x)-3(B+2y)-6(C+x-y) 
    \\
    2A-3B-6C \rightarrow 2A - 3B -6C +6x -6y-6x +6y 
    \\
    2A-3B-6C \rightarrow 2A - 3B -6C
    $$

    * **C**.

  * $2A-2B-3C$
    $$
    2A-2B-3C \rightarrow 2(A+3x)-2(B+2y)-3(C+x-y)
    \\
    2A-2B-3C \rightarrow 2A-2B-3C+6x-4y-3x+3y
    \\
    2A-2B-3C \rightarrow 2A-2B-3C+3x-y
    $$
    

    * **N**, as this variable can increase and decrease after each transaction, it depends on the number of cars entering and leaving.

* **c)** Use the results of part **b)** to define a simple predicate, $P$, on states of the transition system which is satisfied by the start state, that is $P(A_0, B_0, C_0)$ holds - is not satisfied by any collapsed stated, and is preserved invariant of the system. Explain why your $P$ has these properties. Conclude that the traffic won't cause the bridge to collapse.

  Defining $T_0 ::= 3(1000-C_0) + (A_0 - B_0)$

  $P(A, B, C) ::= [A - B < T_0] \text{ AND } [2A-3B-6C = 2A_0-3B_0-6C_0]$

  * **start state**: $P(A_0, B_0, C_0) = [A_0 - B_0 < T_0] \text{ AND } [2A_0-3B_0-6C_0 = 2A_0-3B_0-6C_0]$ is **true**;

  * The defined $P$ is not satisfied by any collapsed state, since in those cases $A-B \geq T_0$.

  * The defined $P$ is a preserved invariant, as was shown in the previous question.

    As none collapsed states are allowed, the traffic won't cause the bridge to collapse.

* **d)** Explain, in terms of system transitions, why this policy will lead to a deadlock situation. 

  A deadlock will happen when the bridge has 1000 cars on it and the number, $x$, of cars wanting to enter the bridge is bigger than the number, $y$ of cars leaving it.
  $$
  (A, B, C) \rightarrow (A+3x, B+2y, C+x-y)
  $$

## Problem 4

Prove the theorem:

" If fewer than $n$ students among those in an $n \times n$ arrangement are initially infected in a flu outbreak, then there will be at least one student who never gets infected in this outbreak, even if students attend all the lectures."

As the rule for someone be infected is to be adjacent to at least two already-infected students, then for everyone be infected at least $n$ students should be in the diagonal. Therefore, if the number of initial infected students is less than $n$, there will be at least on student who never gets infected.
