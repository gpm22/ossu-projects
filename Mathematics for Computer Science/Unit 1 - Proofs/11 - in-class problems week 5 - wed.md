# In-Class Problems Week 5, Wed.

Questions in [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/5dab1f6349109604b1497194094ca47a/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp11.pdf)

## Problem 1

* **a)** Several students felt the proof of Lemma 7.1.7 was worrisome, if not circular, in the course textbook. What do you think?
  * At the beginning I thought that the proof was kind of strange, as it seemed to be circular, but after reading it several times I got its essence and now it does not seem strange at all.
* **b)** Use the proof of Lemma 7.1.7 to show that if $A$ is an infinite set, then $A \text{ surj } \N$, that is, every infinite set is "as big as" the set of nonnegative integers in the course textbook.
  * **Proof.** We prove that if $A$ is an infinite set, then $A \text{ surj } \N$.
  * **Predicate**: $P(A) ::= A \text{ is an infinite set} \Rightarrow A \text{ surj } \N$.
  * Lemma 7.1.7 says that adding a finite number of elements to an infinite set will not change its size, we have to prove that adding a countable infinite set will also not change its size, as $\N$ is a countable infinite set.
  * By their definition, countable infinite sets can be ordered, so if you keep adding the elements in the ordered order to an infinite set, you will not change the size of the infinite set. This happens as lemma 7.1.7 shows that there is an infinite sequence of different elements in the infinite set. That means:
    * If $A$ is an infinite set and $C$ is a countable set, then $A \text{ bij } A \cup C$
  * So, as $A \text{ bij } A \cup \N$, then $A \text{ surj } \N$.

## Problem 2

Prove that if there is a surjective function ($[ \leq 1 \text{ out. } \geq \text{ in}]$ mapping) $f : \N \rightarrow S$, then $S$ is countable.

**Proof.** We prove that if $f : \N \rightarrow S$ is a surjective function, than $S$ is countable.

**Predicate**: $P(S) ::= \N \text{ surj } S \Rightarrow S \text{ is countable}$.

As shown in the **problem 1**, if $A$ is an infinite set, then $A \text{ surj } \N$, as this is true for all infinite sets, countable and uncountable, so $\N \text{ surj } S$ means that $S$ has a size equivalent to $\N$, then $S$ must be countable.

If $S$ is not infinite it will also be countable, as all finite sets are countable.

## Problem 3

The rational numbers fill the space between integers, so a first thought is that there must be more of them than the integers, but it’s not true. In this problem you’ll show that there are the same number of positive rationals as positive integers. That is, the positive rationals are countable.

**a)** Define a bijection between the set, $\Z^+$, of positive integers, and the set, $(\Z^+ \times \Z^+)$ of all pairs of positive integers:
$$
1 \rightarrow (1, 1)
\\ 2 \rightarrow (1, 2) 
\\ 3 \rightarrow (1, 3)
\\ \vdots
\\ n \rightarrow (1, n) 
\\ \vdots
\\ a \rightarrow (b, c)
$$
​	So will always have a different positive integer to a different pair of positive integers.

**b)** Conclude that the set, $\Q^+$, of all positive rational numbers is countable.

$\Q^+$ is countable, as $\N \text{ bij } \Q^+$: 
$$
1 \rightarrow 1/1
\\ 2 \rightarrow 1/2
\\ 3 \rightarrow 1/3
\\ \vdots
\\ n \rightarrow 1/n
\\ \vdots
\\ a \rightarrow b/c
$$
So will always have a different nonnegative integer to a different positive rational number.

## Problem 4

* **a)** Describe how a recognizer would work for the set of strings containing only lowercase Roman letters —`a,b,...,z` — such that each letter occurs twice in a row. For example, `aaccaabbzz`, is such a string, but `abb`, `00bb`, `AAbb`, and `a` are not. (Even better, actually write a recognizer procedure in your favorite programming language).

  * The procedure will first verify the size of the string, if it is odd the procedure will return false, is its is even, the procedure will continue.

  * Then the procedure will iterate over the string starting from the second element and will advance two indexes at a time.

    * It will verify if the actual character is a lower case letter, if it is not, the procedure will return false, if it is, the procedure will continue.
    * The actual character will be compared with the previous one (actual index - 1).
      * If they are different, the procedure return false.
      * if they equal, the procedure goes to the next iteration.

  * The procedure will return true.

  * Code in JavaScript

    ```js
    const verifyString = (string) => {
        if(string.length%2 != 0){
            return false;
        }
        
        for(let i = 1; i < string.length; i+=2){
            
            if(isCharNotALowerCaseLetter(string[i])){
                return false;
            }
            
            if(string[i] != string[i-1]){
                return false;
            }
        }
        return true;
    }
    
    const isCharNotALowerCaseLetter = (char) => {
        return !(/^[a-z]*$/.test(char));
    }
    ```

    

* **b)** Explain why $\text{range}(f)$ is the set of all recognizable sets of strings.

  * By definition, $\text{range}(f) = f(\text{domain}(f)) =f(\text{string})$.
  * As $f(s)$ maps **every** string $s$ to the set of strings recognized by $P_s$, therefore $\text{range}(f)$ is the set of all recognizable sets of strings.

* **c)** Prove that $N ::= \{s \in \text{string}\ | \ s \notin f(s) \}$ is not recognizable.

  * By definition $ s \in N \iff s \notin f(s)$ for every string $s$.
  * So $N \notin \text{range}(f)$ , therefore $N$ is not in the set of all recognizable sets of strings.

* **d)** It is not possible to write a program analyzer that recognizes every string.
