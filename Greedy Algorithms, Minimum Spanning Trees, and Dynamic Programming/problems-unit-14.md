# Chapter 14 - Huffman Codes

Questions available in the book **Algorithms Illuminated Part 3: Greedy Algorithms and Dynamic Programming** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 14.1

Consider the following symbol frequencies for a five-symbol alphabet:

| Symbol | Frequency |
| ------ | --------- |
| A      | .32       |
| B      | .25       |
| C      | .2        |
| D      | .18       |
| E      | .05       |

What is the average encoding length of an optimal prefix-free code?

* **a)** 2.23
* **b)** 2.4
* **c)** 3
* **d)** 3.45

**ANSWER**

The optimal prefix-free is

```
     -- . --
    /       \
   .         .
 /   \     /   \
A     B   C     .
              /   \
             E     D
```

Which results in the codes:

```
A -> 00
B -> 01
C -> 10
D -> 110
E -> 111
```

So the average encoding length is 
$$
2 \times 0.32 + 2 \times .25 + 2 \times .2 + 3 \times 0.18 + 3 \times 0.05 = 2.23
$$
Therefore the answer is 

* **a)** 2.23

### Problem 14.2

Consider the following symbol frequencies for a five-symbol alphabet:

| Symbol | Frequency |
| ------ | --------- |
| A      | .16       |
| B      | .08       |
| C      | .35       |
| D      | .07       |
| E      | .34       |

What is the average encoding length of an optimal prefix-free code?

* **a)** 2.11
* **b)** 2.31
* **c)** 2.49
* **d)** 2.5

**ANSWER**

The optimal prefix-free is

``` 
   . 
 /   \
C     .
    /   \
   E     .
       /   \
      A     .
          /   \
         B     D
```

Which results in the codes:

```
A -> 011
B -> 0111
C -> 0
D -> 1111
E -> 11
```

So the average encoding length is 
$$
1 \times 0.35 + 2 \times .34 + 3 \times .16 + 4 \times 0.08 + 4 \times 0.07 = 2.11
$$
Therefore the answer is 

* **a)** 2.11

### Problem 14.3

What is the maximum number of bits that Huffman’s greedy algorithm might use to encode a single symbol?

* **a)** $\log_2 n$
* **b)** $\ln n$
* **c)** $n - 1$
* **d)** $n$

**ANSWER**

We have an example of the worst case in the problem 14.2, therefore the answer is

* **c)** $n - 1$

### Problem 14.4

Which of the following statements about Huffman’s greedy algorithm are true? Assume that the symbol frequencies sum to 1.

* **a)** A letter with frequency at least 0.4 will never be encoded with two or more bits.
* **b)** A letter with frequency at least 0.5 will never be encoded with two or more bits.
* **c)** If all symbol frequencies are less than 0.33, all symbols will be encoded with at least two bits. 
* **d)** If all symbol frequencies are less than 0.5, all symbols will be encoded with at least two bits.

**ANSWER**

* **b)** A letter with frequency at least 0.5 will never be encoded with two or more bits.
* **c)** If all symbol frequencies are less than 0.33, all symbols will be encoded with at least two bits.

## Challenge Problems

### Problem 14.5

Give an implementation of Huffman’s greedy algorithm that uses a single invocation of a sorting subroutine, followed by a linear amount of additional work.

**ANSWER**

```ruby
sort Alphabet from least to greater frequency

Q1 = {} # queue 1
Q2 = {} # queue 2
# Initialization
for each a in Alphabet do
    Ta := tree containing one node, labeled “a”  
    P(Ta) := pa
    push(Q1, Ta)
end    
    
# Main loop
while Q1 is not empty do
    q1_0 = peek(Q1, 0)
    q1_1 = peek(Q1, 1)
    q2_0 = peek(Q2, 0)
    q2_1 = peek(Q2, 1)
   
    if q2_1 < q1_0
		q0 = pop(Q2, 0)
		q1 = pop(Q2, 1)
    elsif q2_0 < q1_1
		q0 = pop(Q1, 0)
		q1 = pop(Q2, 0)
    else
		q0 = pop(Q1, 0)
		q1 = pop(Q1, 1)
    end
    
    q3 = merge(q0, q1)
    push(Q2, q3)
end
return the unique tree in Q2
```



## Programming Problems

### Problem 14.6

Implement in your favorite programming language the Huffman algorithm from Section 14.3 for the optimal prefix-free code problem.
How much faster is the heap-based implementation than the straightforward quadratic-time implementation? 
How much faster is the implementation in Problem 14.5 than the heap-based implementation?