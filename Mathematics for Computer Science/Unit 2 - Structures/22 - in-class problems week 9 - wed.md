# In-Class Problems Week 9, Wed.

Questions available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/50fd349418ec06b1623524f760239263/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp22.pdf).

## Problem 1

* **a)** Use The Mating Ritual to find two stable assignments of Students to Companies.

  * Students:
    $$
    Albert & : & [HP, BellCore, AT\&T, Draper] \\
    Sarah & : & [AT\&T, BellCore, Draper, HP] \\
    Tasha & : & [HP, Draper, AT\&T, Bellcore] \\
    Elizabeth & : & [Draper, AT\&T, Bellcore, HP]
    $$

  * Companies:
    $$
    AT\&T & : & [Elizabeth, Albert, Tasha, Sarah] \\
    Bellcore & : & [Tasha, Sarah, Albert, Elizabeth] \\
    HP & : & [Elizabeth, Tasha, Albert, Sarah]\\
    Draper & : & [Sarah, Elizabeth, Tasha, Albert]\\
    $$

  * Steps for matching 1:

    1. $$
       Albert & \to & HP (NOT) & | & [HP, BellCore, AT\&T, Draper] \\
       Sarah & \to & AT\&T & | &  [AT\&T, BellCore, Draper, HP] \\
       Tasha & \to & HP & | & [HP, Draper, AT\&T, Bellcore] \\
       Elizabeth & \to & Draper & | & [Draper, AT\&T, Bellcore, HP]
       $$

    2. $$
       Albert & \to & Bellcore \\
       Sarah & \to & AT\&T \\
       Tasha & \to & HP \\
       Elizabeth & \to & Draper \\
       $$

  * 

  * 

  * Steps for Matching 2

    1. $$
       AT\&T & \to & Elizabeth & | & [Elizabeth, Albert, Tasha, Sarah] \\
       Bellcore & \to & Tasha & | & [Tasha, Sarah, Albert, Elizabeth] \\
       HP & \to & Elizabeth(NOT) & | & [Elizabeth, Tasha, Albert, Sarah]\\
       Draper & \to & Sarah & | & [Sarah, Elizabeth, Tasha, Albert]\\
       $$

    2. $$
       AT\&T & \to & Elizabeth & | & [Elizabeth, Albert, Tasha, Sarah] \\
       Bellcore & \to & Tasha (NOT) & | & [Tasha, Sarah, Albert, Elizabeth] \\
       HP & \to & Tasha & | & [Tasha, Albert, Sarah]\\
       Draper & \to & Sarah & | & [Sarah, Elizabeth, Tasha, Albert]\\
       $$

    3. $$
       AT\&T & \to & Elizabeth & | & [Elizabeth, Albert, Tasha, Sarah] \\
       Bellcore & \to & Sarah & | & [Sarah, Albert, Elizabeth] \\
       HP & \to & Tasha & | & [Tasha, Albert, Sarah]\\
       Draper & \to & Sarah(NOT) & | & [Sarah, Elizabeth, Tasha, Albert]\\
       $$

    4. $$
       AT\&T & \to & Elizabeth (NOT) & | & [Elizabeth, Albert, Tasha, Sarah] \\
       Bellcore & \to & Sarah & | & [Sarah, Albert, Elizabeth] \\
       HP & \to & Tasha & | & [Tasha, Albert, Sarah]\\
       Draper & \to & Elizabeth & | & [Elizabeth, Tasha, Albert]\\
       $$

    5. $$
       AT\&T & \to & Albert & | & [Albert, Tasha, Sarah] \\
       Bellcore & \to & Sarah & | & [Sarah, Albert, Elizabeth] \\
       HP & \to & Tasha & | & [Tasha, Albert, Sarah]\\
       Draper & \to & Elizabeth & | & [Elizabeth, Tasha, Albert]\\
       $$

    6. 

    7. $$
       Albert & \to & At\&T\\
       Sarah & \to &  Bellcore\\
       Tasha  & \to & HP \\
       Elizabeth & \to & Draper  \\
       $$

  

* **b)** Describe a simple procedure to determine whether any given stable marriage problem has a unique solution, that is, only one possible stable matching.

  * Do the Ritual Matching from $A \to B$, then from $B \to A$. If the result is the same, there is a unique solution.

## Problem 2

Suppose that Harry is one of the boys and Alice is one of the girls in the Mating Ritual. Which of the properties below are preserved invariants? Why? 

* **a)** Alice is the only girl on Harry’s list. 
  * Preserved, as this means they are together
* **b)** There is a girl who does not have any boys serenading her. 
  * Not preserved, as it can be true only at the first iteration;
* **c)** If Alice is not on Harry’s list, then Alice has a suitor that she prefers to Harry. 
  * Preserved, as this means that Alice rejected Harry
* **d)** Alice is crossed off Harry’s list and Harry prefers Alice to anyone he is serenading. 
  * Preserved, as this means Harry was rejected by Alice and therefore she was above the actual serenaded girls;
* **e)**If Alice is on Harry’s list, then she prefers to Harry to any suitor she has. 
  * Not preserved, as can exist other boy which is not a suitor of her, got her in his list, and is above Harry on her list;

## Problem 3

Use the following invariant to prove that the Mating Algorithm produces stable marriages:

**For every girl, $G$, and every boy, $B$, if $G$ is crossed off $B$'s list, then $G$ has a favorite suitor, and she prefers him over $B$**

**Answer**

To the matching be unstable, must exist a rouge couple, but that invariant guarantees that this is impossible:

1. As the boy is with the top girl of his list, he won't care for the girls outside his list (as they don't care about him).
2. Without the boys whose cut off the girl from their lists, remains only the boys she has interest. But at the end she will have only one of them, as the other are with girls they like better. 

## Problem 4

We can treat each available residence separately, so they will have the same preference list. Assuming that will exist more students than residences, the definition of stable matching is that every residence got a student, whose is not wanted and wants other residence.

The students without residence will not affect the stability, as they less wanted than the ones with residence.

