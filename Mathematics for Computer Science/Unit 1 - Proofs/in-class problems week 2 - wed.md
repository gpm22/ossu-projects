# In-Class Problems Week 1, Wed.

## Problem 1

Let the notation ""$ j\ |\ k $" indicate that integer $j$ is a divisor of integer $k$, and let $S(n)$ mean that exactly $n$ cents postage can be assembled using only 6 and 15 cent stamps. Then the proof shows that

​							$S(n)\ IMPLIES\ 3\ |\ n$; 	for all nonnegative integers $n$: (1)

**Proof:**

​	Let $C$ be the set of counterexamples to (1), namely
$$
C ::= \{n\ |\ S(n)\ NOT\ IMPLIES\ 3\ |\ n \}
$$

	1. Assume for the purpose of obtaining a contradiction that $C$ is nonempty. Then by the WOP, there is a smallest number, $m\ \in\ C$. This $m$ must be positive because **$S(0)\ IMPLIES\ 3\ |\ 0$**.
	1. But if $S(m)$ holds and $m$ is positive, then $S(m-6)$ or $S(m-15)$ must hold, **because $(m-3)$ and $(m-6)$ are less than $m$, therefore they are not part of $C$.**
 	3. So suppose $S(m-6)$ holds. Then $3\ |\ m-6$, because **$(m-6)$ is not part of $C$.**
 	4. But if $3\ |\ m- 6$, then $3\ |\ m$, because **6 is obviously divisible by 3 and a number which is the result of the subtraction of two numbers divisible by 3 is also divisible by 3.**
     contradicting the fact that $m$ is a counterexample.
 	5. Next, if $S(m-15)$ holds, we arrive at a contradiction in the same way. Since we get a contradiction in both cases, we conclude that **$C$ must be empty and therefore $S(n)\ IMPLIES\ 3\ |\ n$**
     which proves that (1)

## Problem 2

Use the *Well Ordering Principle* to prove that
$$
f(n) = \sum_{k=0}^{n}{k²}= \frac{n(n+1)(2n+1)}{6}\ \ \ \ \ \ \ (2.1)
$$
for all nonnegative integers, $n$.

**Proof:**

​	Let $C$ be the set of counterexamples to (2.2), namely
$$
C ::= \{n\ \in \N\ |\ f(n) = \sum_{k=0}^{n}{k²} \neq \frac{n(n+1)(2n+1)}{6} \}\ \ \ \ \ \ \ (2.2)
$$

 1. Assume for the purpose of obtaining a contradiction that $C$ is nonempty. Then by the WOP,
    there is a smallest number, $m\ \in\ C$. This $m$ must be positive because **$f(0) = 0$**.

 2. But if $f(m)$ holds and $m$ is positive, then $f(m-1)$must hold, **because $(m-1)$ is less than $m$, therefore it is not part of $C$.**

 3. So $f(m-1)$ is
    $$
    f(m-1) = \sum_{k=0}^{m-1}{k²}= \frac{(m-1)(m-1+1)(2(m-1)+1)}{6} 
    
    \\
    
    f(m-1) = \sum_{k=0}^{m-1}{k²}= \frac{m(m-1)(2m-2+1)}{6}
    
    \\
    
    f(m-1) = \sum_{k=0}^{m-1}{k²}= \frac{m(m-1)(2m-1)}{6}
    
    \\
    
    f(m-1) = \sum_{k=0}^{m-1}{k²}= \frac{m(m-1)(2m-1)}{6}\ \ \ \ \ \ \ (2.3)
    $$

 4. Adding $m^{2}$ to both sides:
    $$
    f(m) = \sum_{k=0}^{m}{k²}= \frac{m(m-1)(2m-1)}{6} + m^{2}
    
    \\
    
    f(m) = \sum_{k=0}^{m}{k²}= \frac{(m^2-m)(2m-1) + 6m^{2}}{6} 
    
    \\
    
    f(m) = \sum_{k=0}^{m}{k²}= \frac{2m^3-3m²+m + 6m^{2}}{6} 
    
    \\
    
    f(m) = \sum_{k=0}^{m}{k²}= \frac{2m^3+3m²+m}{6} 
    
    \\
    
    f(m) = \sum_{k=0}^{m}{k²}= \frac{m(2m^2+3m+1)}{6} 
    
    \\
    
    f(m) = \sum_{k=0}^{m}{k²}= \frac{m(m+1)(2m+1)}{6} \ \ \ \ \ \ \ (2.4)
    $$
    
 5. The equation (2.4)  shows that  we arrive at a contradiction, because $f(m)$ holds, so we conclude that **$C$ must be empty and therefore $f(n)$ holds for all nonnegative integers, $n$,**
    which proves that (1)

## Problem 3

Prove that Lehman's Equation (3.1) really does not have any positive integer solutions.
$$
8a^4+4b^4+2c^4=d^4 \ \ \ \ \ \ \ (3.1)
$$
**Proof:**

​	Let $C$ be the set of counterexamples to (3.2), namely
$$
C ::= \{a, b, c, d\ \in\ \N\ |\ 8a^4+4b^4+2c^4 = d^4\} \ \ \ \ \ \ \ \ \ \ (3.2)
$$

 	1. Assume for the purpose of obtaining a contradiction that $C$ is nonempty. Then by the WOP,
 	 there is a smallest number, $a\ \in\ C$. $a$ must be even:
 	 * This is true, because the left hand side will always be even, so $d^4$, and therefore $d$, will always be even too.
 	 * $d$ being even implies that both sides can be divided by 2, so $c$ must also be even.
 	 * $c$ being even implies that both sides can be divided by 4, so $b$ must be even, 
 	 * finally, $b$ being even imples that both sides can be divided by 8, so $a$ must also be even.
 	2. If $a$ is even and positive, this means that it is not the smallets possible value, so we arrive at a contradiction. Since we get a contradiction, we conclude that **$C$ must be empty and therefore no solution exists** which proves what was claimed.

## Problem 5

Use the Well Ordering Principle to prove that any integer greater than or equal to 30 can be represented as the sum of nonnegative integer multiples of 6, 10, and 15.

**Proof:**

​	First lets define $S(n)$ meaning that $n$ can be represented as the sum of nonnegative integer multiples of 6, 10, and 15. Let $C$ be the set of counterexamples to (1), namely
$$
C ::= \{n\ \in \N\ |\ n\ \geq 30\ \ NOT\ \ IMPLIES\ S(n) \}
$$

 1. Assume for the purpose of obtaining a contradiction that $C$ is nonempty. Then by the WOP,
    there is a smallest number, $m\ \in\ C$. Thus $m$ must be greater than 30, because **$S(30)$** is true:.
    $$
    30 = 5 \cdot 6 = 3 \cdot 10=2 \cdot 15
    $$

 2. So $(m-30)$ is not part of $C$ and therefore $S(m-30)$ is true;

 3. But if $S(m-30)$, then $S(m)$, because **30 is obviously divisible by 30 and a number which is the result of the subtraction of two numbers divisible by 30 is also divisible by 30.**
    contradicting the fact that $m$ is a counterexample.

 4. Since we get a contradiction, we conclude that **$C$ must be empty and therefore $n\ \geq 30\ \ IMPLIES\ S(n)$** which proves what was claimed.



