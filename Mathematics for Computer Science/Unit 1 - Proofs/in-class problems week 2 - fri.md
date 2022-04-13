# In-Class Problems Week 1, Fri.

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

## Problem 4