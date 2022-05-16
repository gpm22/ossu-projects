# In-Class Problems Week 3, Tue.

Questions file in [MIT](https://openlearninglibrary.mit.edu/assets/courseware/v1/9faed471877e2f00828e9c6f6fe94e00/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp5.pdf).

## Problem 1

* $\exists x.\ x^2 = 2$
  * $\N$: **F**
  * $\Z$: **F**
  * $\Q$: **F**
  * $\R$: **T**
  * $\C$: **T**
* $\forall x.\ \exists y.\ x^2=y$
  * $\N$: **T**
  * $\Z$: **T**
  * $\Q$: **T**
  * $\R$: **T**
  * $\C$: **T**
* $\forall y.\ \exists x. x^2 = y$
  * $\N$: **F**
  * $\Z$: **F**
  * $\Q$: **F**
  * $\R$: **T**
  * $\C$: **T**
* $\forall x. \neq 0.\ \exists y.\ xy=1$
  * $\N$: **F**
  * $\Z$: **F**
  * $\Q$: **T**
  * $\R$: **T**
  * $\C$: **T**
* $\exists x.\ \exists y.\ x + 2y = 2\ \ AND\ \ 2x+4y=5$
  * $\N$: **F**
  * $\Z$: **F**
  * $\Q$: **T**
  * $\R$: **T**
  * $\C$: **T**

## Problem 2

* **a)**: $x$ consists of three copies of some string.
  * $\exists y. x = yyy$

* **b)**: $x$ is an even-length string of 0's.
  * $\exists y. x = yy\ AND\ NO-1S(x)$

* **c)**: $x$ does not contain both a 0 and a 1.
  * $NO-1S(x)\ XOR\ NOT(NO-1S(x))$

* **d)** $x$ is the binary representation of $2^k + 1$ for some integer $k \geq 0$.
  * Defining $BINARY(x)$ as the binary representation of a decimal number $x$.
  * $\exists k \in \N. x = BINARY(2^k + 1)$

* **e)** Explain why $PREFIX(x,0x)$ is true only when $x$ is a string of 0's.
  * $PREFIX(x, 0x) = \exists u \exists v. (uxv = 0x)$
  * So, $uv = 0$, then the $x$ is a string of 0's.


## Problem 3

* Translate the following sentence into a predicate formula:
  * "There is a student who has e-mailed at most two other people in the class, besides possibly himself."
  * $\exists x \in S\ \exists y \in S\ \exists z \in S. y \neq z\ AND\ (E(x, y)\ OR\ E(x, z))$

## Problem 4

* Provide a counter model for the implication that is not valid. Informally explain why the other one is valid.
  1. $\forall x. \exists y.\ P(x, y)\ IMPLIES\ \exists y. \forall x.\ P(x,y)$
     * If $P(x, y)$ means $x < y$ and the domain is the **integers**, the first one ($\forall x. \exists y.\ P(x, y)$) would be **true**, but the second one ($\exists y. \forall x.\ P(x,y)$) would be **false**, as it means that there is a **biggest integer**, which is clearly an absurd.
  2. $\exists y. \forall  x.\ P(x, y)\ IMPLIES\ \forall x. \exists y.\ P(x,y)$ 
     * It is **true**, as if there is at least **one valid** **y** for **all x**, so that **same y** will be **valid** **for all x**.

## Problem 5

​	A certain cabal within the Math for Computer Science course staff is plotting to make the final exam ridiculously hard. (“Problem 1. Prove the Poincare Conjecture starting from the axioms of ZFC. Express your answer in khipu—the knot language of the Incas.”) The only way to stop their evil plan is to determine exactly who is in the cabal. The course staff consists of seven people: 

​	{ Adam; Tom; Albert; Annie; Ben; Elizabeth; Siggi }

​	The cabal is a subset of these seven. A membership roster has been found and appears below, but it is deviously encrypted in logic notation. The predicate cabal indicates who is in the cabal; that is, $cabal(x)$ is true if and only if x is a member. Translate each statement below into English and deduce who is in the cabal.

1. $\exists x, y, z.\ (x \neq y\ AND x \neq z\ AND y \neq z\ AND\ cabal(x)\ AND\ cabal(y)\ AND\ cabal(z))$
   * **Cabal has at least 3 members**.
2. $NOT(cabal(Siggi)\ AND\ cabal(Annie))$
   * **Saggi or Annie are not in the cabal**.
3. $cabal(Elizabeth)\ IMPLIES\ \forall x.\ cabal(x)$
   * **If Elizabeth is in the cabal, so is everyone.** 
   * **So Elizabeth is not in the cabal.** 
4. $cabal(Annie)\ IMPLIES\ cabal(Siggie)$
   * **If Annie is in the cabal, so is Siggie**.
   * **As we know at least one of them is not in the cabal, so Annie is not in the cabal, nut Siggie maybe is part of it.**
5. $(cabal(Ben)\ OR\ cabal(Albert))\ IMPLIES\ NOT(cabal(Tom))$
   * **If Ben or Albert are in the cabal, so Tom cannot be part of it.**
6. $(cabal(Ben)\ OR\ cabal(Siggi))\ IMPLIES\ NOT(cabal(Adam))$
   * **If Ben or Siggi are in the cabal, so Adam cannot be part of it.**

Now use these facts to explai exactly who is on the cabal and why.

* **Suposing that the 6th statement is false, that Adam is part of the cabal. Then Siggi and Ben would not be part of the cabal. As of the first statment, So Adam, Tom, and Albert would be the cabal. But that contradict the 5th statment, so this cannot be true. So Adam and Tom are not part of the cabal and Ben, Siggi, or Albert are part of it.**.
* **As the cabal must has at least 3 members and Adam, Tom, Elizabeth, and Annie cannot be part of it, so the cabal is formed by Ben, Siggi, and Albert**. 