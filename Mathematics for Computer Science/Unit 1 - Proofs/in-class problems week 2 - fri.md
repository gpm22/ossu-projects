# In-Class Problems Week 2, Fri.

Questions in [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/04fc8e89039320c0b5cfa4a974507f12/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_cp4.pdf).

## Problem 1

Prove by truth table that OR distributes over AND, namely,

​	P OR (Q AND R) is equivalent to (P OR Q) AND (P OR R) (1)



| P    | Q    | E    | P OR (Q AND R) | (P OR Q) AND (P OR R)              |
| ---- | ---- | ---- | -------------- | ---------------------------------- |
| T    | T    | T    | T - **T** - T  | ( T - T - T) - **T** - ( T- T -T ) |
| F    | T    | T    | F - **T** - T  | ( F- T - T) - **T** - ( F- T - T)  |
| T    | F    | T    | T - **T** - F  | ( T- T - F) -  **T** - ( T- T -T ) |
| F    | F    | T    | F - **F** - F  | ( F- F - F) - **F** - ( F- T -T )  |
| T    | T    | F    | T - **T** - F  | ( T- T - T) -  **T** - ( T- T - F) |
| F    | T    | F    | F - **F** - F  | ( F- T - T) - **F** - (F - F - F)  |
| T    | F    | F    | T - **T** - F  | ( T- T - F) - **T** - ( T- T -F )  |
| F    | F    | F    | F - **F** - F  | ( F- F - F) - **F** - ( F- F - F)  |



## Problem 2

Examines whether the following specifications are *satisfiable*:

1. If the file system is not locked, then: 
   1. new messages will be queued. 
   2. new messages will be sent to the messages buffer. 
   3. the system is functioning normally, and conversely, if the system is functioning normally, then the file system is not locked.
2.  If new messages are not queued, then they will be sent to the messages buffer.
3. New messages will not be sent to the message buffer.

* a - Begin by translating the five specifications into propositional formulas using four propositional variables:
  * L ::= file system locked; 
  * Q ::= new messages are queued;
  * B ::= new messages are sent to the message buffer; 
  * N ::= system functioning normally:
  * **answer**
    * NOT(L) IMPLIES Q
    * NOT(L) IMPLIES B
    * NOT(L) IFF N
    * NOT(Q) IMPLIES B
    * NOT(B)
* b
  * **Answer** : L AND Q AND NOT(B) AND NOT(N)
* c
  * B must be F, then
    * Q must be T
    * L must be T, then
      * N must be F

## Problem 3

* a
  1. $c_0 = b$
  1. $s_0 = a_0\ XOR\ c_0$
  1. ...
  1. $s_i = a_i\ XOR\ c_i$
  1. $c_i = a_{i-1}\ AND\ c_{i-1}$ 
  1. ...
  1. $c_n = a_{n-1}\ AND\ c_{n-1}$ 
  1. $c = c_{n}$
* b
  1. $c_0 = 0$
  2. $s_0=a_0\ XOR\ b_0\ XOR\ c_0$
  3. ...
  4. $s_i=a_i\ XOR\ b_i\ XOR\ c_i$
  5. $c_i=(a_{i-1}\ AND\ b_{i-1})\ OR\ (a_{i-1}\ AND\ c_{i-1})\ OR\ (b_{i-1}\ AND\ c_{i-1})$
  6. ...
  7. $c_n=(a_{n-1}\ AND\ b_{n-1})\ OR\ (a_{n-1}\ AND\ c_{n-1})\ OR\ (b_{n-1}\ AND\ c_{n-1})$
  8. $c=c_{n+1}$
* c
  * It uses $3(n+1)$ ANDs, $2(n+1)$ ORs, and $2(n+1)$ XORs, so are used $7(n+1)$ operations;
  

## Problem 4

Because it is implicit considered in the current language, that if-then statements are IFF statements. But in a place where there are a formal understating of propositional logic, the translation is direct.