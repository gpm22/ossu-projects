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
while Q1 is not empty or Q2 > 1 do
    q1_0 = peek(Q1, 0)
    q1_1 = peek(Q1, 1)
    q2_0 = peek(Q2, 0)
    q2_1 = peek(Q2, 1)
   
    if q2_1 < q1_0
		q0 = pop(Q2)
		q1 = pop(Q2)
    elsif q2_0 < q1_1
		q0 = pop(Q1)
		q1 = pop(Q2)
    else
		q0 = pop(Q1)
		q1 = pop(Q1)
    end
    
    q2 = merge(q0, q1)
    push(Q2, q2)
end
return the unique tree in Q2
```



## Programming Problems

### Problem 14.6

Implement in your favorite programming language the Huffman algorithm from Section 14.3 for the optimal prefix-free code problem.
How much faster is the heap-based implementation than the straightforward quadratic-time implementation? 
How much faster is the implementation in Problem 14.5 than the heap-based implementation?

**ANSWER**

#### Code

```ruby
class Alphabet

    def initialize(symbols)
        @symbols = symbols
    end

    def getHuffmanCodeStraightfoward
        # Initialization
        forest = []
        nodes = []

        @symbols.each do |symbol|
            newNode = Node.new
            newNode.label = symbol.value
            forest.push([newNode, symbol.frequency])
            nodes.push(newNode)
        end

        # Main Loop

        while forest.size > 1 
            tree1 = forest.delete(forest.min {|a, b| a[1] <=> b[1]})
            tree2 = forest.delete(forest.min {|a, b| a[1] <=> b[1]})
            tree3 = Node.merge(tree1[0], tree2[0])
            forest.push([tree3, (tree1[1] + tree2[1])])
        end

        Hash[nodes.collect {|n| [n.label, n.getCode]}]
    end

    def getHuffmanCodeWithHeap
        # Initialization
        heap = Heap.new 
        nodes = []

        @symbols.each do |symbol|
            newNode = Node.new
            newNode.label = symbol.value
            heap.insert([symbol.frequency, newNode])
            nodes.push(newNode)
        end

        # Main Loop

        while heap.size > 1 
            tree1 = heap.extractMin
            tree2 = heap.extractMin
            tree3 = Node.merge(tree1[1], tree2[1])
            heap.insert([(tree1[0] +tree2[0]), tree3])
        end

        Hash[nodes.collect {|n| [n.label, n.getCode]}]
    end

    def getHuffmanCodeWithSorting
        @symbols.sort! {|a, b| a.frequency <=> b.frequency}

        # Initialization
        firstQueue = []
        secondQueue = []
        nodes = []

        @symbols.each do |symbol|
            newNode = Node.new
            newNode.label = symbol.value
            firstQueue.push([newNode, symbol.frequency])
            nodes.push(newNode)
        end

        #main loop
        until firstQueue.empty? && secondQueue.size == 1

            q1_0 = firstQueue[0]
            q1_1 = firstQueue[1]

            q2_0 = secondQueue[0]
            q2_1 = secondQueue[1]

            if  q1_0.nil? || (!q2_1.nil? && q2_1[1] < q1_0[1])
                q0 = secondQueue.shift
                q1 = secondQueue.shift
            elsif q1_1.nil? || (!q2_0.nil? && q2_0[1] < q1_1[1])
                q0 = firstQueue.shift
                q1 = secondQueue.shift
            else
                q0 = firstQueue.shift
                q1 = firstQueue.shift
            end
            q2 = Node.merge(q0[0], q1[0])
            secondQueue.push([q2, q1[1] + q0[1]])
        end
        
        Hash[nodes.collect {|n| [n.label, n.getCode]}]
    end

    private

    class Node
        attr_accessor :leftChild, :rightChild, :parent, :label

        def self.merge(firstNode, secondNode)
            newNode = Node.new
            newNode.leftChild = firstNode
            newNode.rightChild = secondNode
            firstNode.parent = newNode
            secondNode.parent = newNode
            newNode.label= firstNode.label + secondNode.label
            newNode
        end

        def isRoot?
            @parent.nil?
        end

        def isLeftChild?
            raise "cannot be called on the root" if isRoot?
            !@parent.leftChild.nil? && @parent.leftChild.equal?(self)
        end

        def isRightChild?
            raise "cannot be called on the root" if isRoot?
            !@parent.rightChild.nil? && @parent.rightChild.equal?(self)
        end

        def getCode
            code = ''
            currentNode = self
            until currentNode.isRoot?
                code = currentNode.getCodeHelper + code
                currentNode = currentNode.parent
            end
            code
        end

        def getCodeHelper
            return '0' if self.isLeftChild?
            return '1' if self.isRightChild?

            raise "cannot be called on the root"
        end

        def to_s
            "Node label: #{@label}"
        end
    end
end

class MySymbol
    attr_reader :value, :frequency

    def initialize(value, frequency)
        @value = value
        @frequency = frequency
    end

    def to_s
        "MySymbol[value: #{value.to_s}, frequency: #{@frequency}]"
    end
end
```

#### Questions

The comparison was made using an alphabet of 5000 symbols.

##### How much faster is the heap-based implementation than the straightforward quadratic-time implementation? 

Away faster, the reason straightforward/heap is 44.

##### How much faster is the implementation in Problem 14.5 than the heap-based implementation?

Really faster, the reason heap/sorting is 3.