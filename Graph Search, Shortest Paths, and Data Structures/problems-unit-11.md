# Chapter 11 - Search Trees

Questions available in the book **Algorithms Illuminated Part 2: Graph Algorithms and Data Structures** by **Tim Roughgarden**.

## Test Your Understanding

### Problem 11.1

Which of the following statements are true?

* **a)** The height of a binary search tree with $n$ nodes cannot be smaller than $\Theta(\log n)$.
* **b)** All the operations supported by a binary search tree (except `OutputSorted`) run in $O(\log n)$ time.
* **c)** The heap property is a special case of the search tree property.
* **d)** Balanced binary search trees are always preferable to sorted arrays.

**ANSWER**

* **a)** The height of a binary search tree with $n$ nodes cannot be smaller than $\Theta(\log n)$.

### Problem 11.2

You are given a binary tree with $n$ nodes (via a pointer to its root). Each node of the tree has a `size` field, as in Section 11.3.9, but these fields have not been filled in yet. How much time is necessary and sufficient to compute the correct value for all the size fields?

* **a)** $\Theta(\text{height})$
* **b)** $\Theta(n)$
* **c)** $\Theta(n \log n)$
* **d)** $\Theta(n^2)$

**ANSWER**

**b)** $\Theta(n)$

## Programming Problems

### Problem 11.3

This problem uses the median maintenance problem from Section 10.3.3 to explore the relative performance of heaps and search trees.

* **a)** Implement in your favorite programming language the heap based solution in Section 10.3.3 to the median maintenance problem.
* **b)** Implement a solution to the problem that uses a single search tree and its `Insert` and `Select` operations.

Which implementation is faster?

**ANSWER**

I have implemented 3 data structures:

1. Heap
2. Unbalanced Search Tree
3. Red and Black Tree

With them I implement 3 versions of the Median Maintenance problem and using these I ran 3 different tests:

1. Adding elements in ascending order.
2. Adding elements in descending order.
3. Adding elements at random.

Which I got the following results:

* **Ascending test:**
  * **Heap**: 0.018868999999540392
  * **Unbalanced Search Tree**: 1.3934171000000788
  * **Red and Black Tree**: 0.02651309999964724
* **Descending test:**
  * **Heap**: 0.02447329999995418
  * **Unbalanced Search Tree**: 1.2983760999995866
  * **Red and Black Tree**: 0.02611830000023474
* **Random test:**
  * **Heap**: 0.03476105999998254
  * **Unbalanced Search Tree**: 0.036630260000189686
  * **Red and Black Tree**: 0.041285853333223106

**So the heap version is the faster one.**

### Implementations

#### Data Structures

##### Heap

```ruby
class Heap
    attr_accessor :elements

    def initialize
        @elements=[]
        @positions=Hash.new
    end

    def findMin
        @elements[0]
    end

    def extractMin
        self.delete(@elements[0][1])
    end

    def heapify(arr)
        @elements = arr
        @positions = Hash[@elements.collect.with_index {|e, i| [e[1], i]}]
        (1..arr.size).each do |i|
            self.bubbleDown(i)
        end
    end

    def insert(element)
        @elements.push(element)
        @positions[element[1]] = (@elements.size) - 1 
        self.bubbleUp
        element
    end

    def delete(element)
        position = @positions[element]
        @elements[position], @elements[-1], @positions[element], @positions[@elements[-1][1]] = @elements[-1], @elements[position] , @positions[@elements[-1][1]], @positions[element]
        deleted = @elements.pop
        @positions.delete(element)
        self.bubbleDown(position+1)
        deleted
    end

    def to_s
        "elements: #{@elements.to_s}\npositions: #{@positions.to_s}"
    end

    def empty?
        @elements.empty?
    end

    def include?(element)
        @positions.has_key?(element)
    end

    private

    def bubbleUp
        position = @elements.size
        parentPosition = getParentPosition(position)
        while @elements[parentPosition][0] > @elements[position-1][0]
            @elements[parentPosition], @elements[position-1] , @positions[@elements[parentPosition][1]], @positions[@elements[position-1][1]] = @elements[position-1], @elements[parentPosition], @positions[@elements[position -1][1]], @positions[@elements[parentPosition][1]]
            position = parentPosition+1
            return if parentPosition == 0
            parentPosition = getParentPosition(position)
        end
    end

    def bubbleDown(startPosition)
        position = startPosition
        smallerChildPosition = getSmallerChildPosition(position)
        return if smallerChildPosition > @elements.size-1
        while @elements[smallerChildPosition][0] < @elements[position-1][0]
            @elements[smallerChildPosition], @elements[position-1] , @positions[@elements[smallerChildPosition][1]], @positions[@elements[position-1][1]] = @elements[position-1], @elements[smallerChildPosition], @positions[@elements[position-1][1]], @positions[@elements[smallerChildPosition][1]]
            position = smallerChildPosition+1
            smallerChildPosition = getSmallerChildPosition(position)
            return if smallerChildPosition > @elements.size-1
        end
    end

    def getParentPosition(position)
        (position/2).floor - 1
    end

    def getLeftChildPosition(position)
        2*position-1
    end

    def getRightChildPosition(position)
        2*position
    end

    def getSmallerChildPosition(position)
        left = getLeftChildPosition(position)
        right = getRightChildPosition(position)

        return left if right > (@elements.size - 1)

        if @elements[left][0] < @elements[right][0]
            left
        else
            right
        end
    end
end
```

##### Unbalanced Search Tree

```ruby
class UnbalancedSearchTree
  attr_accessor :root

  def initialize(root)
    @root = root

    @nodesMap = {}
    
    initializeMap(@root) unless root.nil?
  end

  def search(key)
    @root.search(key)
  end

  def min
    @root.min
  end

  def max
    @root.max
  end

  def predecessor(value)
    @nodesMap[value].predecessor
  end

  def successor(value)
    @nodesMap[value].successor
  end

  def outputSorted
    sorted = []
    outputSortedHelper(@root, sorted)
    sorted
  end

  def insert(key, value)
    newNode = TreeNode.new(key, value)
    @nodesMap[value] = newNode
    if @root.nil?
        @root = newNode
        return 
    end
    @root.insert(newNode)
  end

  def delete(key)
    nodeToDelete = search(key)
    return if nodeToDelete.nil?

    @nodesMap.delete(nodeToDelete.value)

    if nodeToDelete.isRoot? && nodeToDelete.isLeaf?
        @root = nil
        return 
    end

    deleteHelper(nodeToDelete)
  end

  def select(position)
    return nil if position < 1 || position > @root.size

    @root.select(position)
  end

  :private

  def deleteHelper(nodeToDelete)
     return updateParentCorrectlyWithChild(nodeToDelete, nil) if nodeToDelete.isLeaf?

    if nodeToDelete.hasOnlyOneChild?
      child = if nodeToDelete.leftChild.nil?
                nodeToDelete.rightChild
              else
                nodeToDelete.leftChild
              end

      return updateParentCorrectlyWithChild(nodeToDelete, child)
    end

    maxLeftDescendant = nodeToDelete.leftChild.max
    if nodeToDelete.isRoot?
        @root = maxLeftDescendant
    end
    nodeToDelete.swap(maxLeftDescendant)

    deleteHelper(nodeToDelete)
  end

  def outputSortedHelper(node, sorted)
    outputSortedHelper(node.leftChild, sorted) unless node.leftChild.nil?

    sorted.push(node)

    return if node.rightChild.nil?

    outputSortedHelper(node.rightChild, sorted)
  end

  def initializeMap(node)
    initializeMap(node.leftChild) unless node.leftChild.nil?

    @nodesMap[node.value] = node

    return if node.rightChild.nil?

    initializeMap(node.rightChild)
  end

  def updateParentCorrectlyWithChild(nodeToDelete, child)

    if !nodeToDelete.isRoot?
        if nodeToDelete.isLeftChild?
            nodeToDelete.parent.leftChild = child
        else
            nodeToDelete.parent.rightChild = child
        end
    elsif !child.nil?
        @root = child
        child.parent = nil
    end
    nodeToDelete
  end
end
```

###### Search Tree Node

```ruby
class TreeNode
  attr_accessor :value, :key, :parent, :leftChild, :rightChild, :size

  def initialize(key, value)
    @key = key
    @value = value
    @size = 1
  end

  def leftChild=(leftChild)
    @size -= @leftChild.size unless @leftChild.nil?
    unless leftChild.nil?
      @size += leftChild.size
      leftChild.parent = self
    end
    @parent.updateSize unless isRoot?
    @leftChild = leftChild
  end

  def rightChild=(rightChild)
    @size -= @rightChild.size unless @rightChild.nil?

    unless rightChild.nil?
      rightChild.parent = self
      @size += rightChild.size
    end
    @parent.updateSize unless isRoot?
    @rightChild = rightChild
  end

  def search(key)
    return self if @key == key

    if key < @key
      return nil if @leftChild.nil?

      @leftChild.search(key)
    else
      return nil if @rightChild.nil?

      @rightChild.search(key)
    end
  end

  def max
    return self if @rightChild.nil?

    @rightChild.max
  end

  def min
    return self if @leftChild.nil?

    @leftChild.min
  end

  def predecessor
    return @leftChild.max unless @leftChild.nil?

    return @parent if isRightChild?

    @parent.predecessorHelper
  end

  def successor
    return @rightChild.min unless @rightChild.nil?

    return @parent if isLeftChild?

    @parent.successorHelper
  end

  def insert(newNode)
    if newNode.key < @key
      if @leftChild.nil?
        self.leftChild = newNode
      else
        @leftChild.insert(newNode)
      end
    elsif @rightChild.nil?
      self.rightChild = newNode
    else
      @rightChild.insert(newNode)
    end
  end

  def select(position)
    leftSize = @leftChild.nil? ? 0 : @leftChild.size

    reference = leftSize + 1

    return self if position == reference

    return @leftChild.select(position) if position < reference

    @rightChild.select(position - leftSize - 1)
  end

  def swap(other)    
    intermediateParent = other.parent
    isOtherRightSide = other.isRightChild?
    intermediateLeftChild = other.leftChild
    intermediateRightChild = other.rightChild

    updateParentDuringSwaping(other)

    if intermediateParent == self
      if isOtherRightSide 
        other.setLeftChildWithoutUpdatingSize @leftChild
        other.setRightChildWithoutUpdatingSize self 
      else 
        other.setLeftChildWithoutUpdatingSize self
        other.setRightChildWithoutUpdatingSize @rightChild
      end
    else
      other.setLeftChildWithoutUpdatingSize @leftChild 
      other.setRightChildWithoutUpdatingSize @rightChild
    end
    self.leftChild =  intermediateLeftChild
    self.rightChild = intermediateRightChild

    if intermediateParent == self 
      intermediateParent = other
    end

    if isOtherRightSide
      intermediateParent.rightChild = self
    else
      intermediateParent.leftChild = self
    end
  end

  def isRightChild?
    return false if @parent.nil? || @parent.rightChild.nil?

    @parent.rightChild.key == key
  end

  def isLeftChild?
    return false if @parent.nil? || @parent.leftChild.nil?

    @parent.leftChild.key == key
  end

  def isLeaf?
    @leftChild.nil? && @rightChild.nil?
  end

  def hasOnlyOneChild?
    @leftChild.nil? ^ @rightChild.nil?
  end

  def isRoot?
    @parent.nil?
  end

  def to_s
    "key: #{@key} - value: #{@value} - size: #{size}"
  end

  def == other
    return false if other.nil? || !(other.is_a? TreeNode)
    self.key == other.key
  end

  :private

    def updateParentDuringSwaping(other)
      unless self.isRoot?
          if self.isRightChild?
              @parent.setRightChildWithoutUpdatingSize other
          else
              @parent.setLeftChildWithoutUpdatingSize other
          end
      else
          other.parent = nil
      end
    end



  def predecessorHelper
    return @parent if isRightChild?
    return nil if isRoot?

    @parent.predecessorHelper
  end

  def successorHelper
    return @parent if isLeftChild?
    return nil if isRoot?

    @parent.successorHelper
  end

  def updateSize
    leftSize = @leftChild.nil? ? 0 : @leftChild.size
    rightSize = @rightChild.nil? ? 0 : @rightChild.size
    @size = leftSize + rightSize + 1

    @parent.updateSize unless isRoot?
  end

    def setRightChildWithoutUpdatingSize(child)
      unless child.nil?
        child.parent = self
      end
        @rightChild = child
    end

    def setLeftChildWithoutUpdatingSize(child)
      unless child.nil?
        child.parent = self
      end
        @leftChild = child
    end
end
```

##### Red and Black Tree

```ruby
class RedBlackTree<UnbalancedSearchTree

  def initialize(root)
    super(root)
  end

  def insert(key, value)
    newNode = RedBlackNode.new(key, value, false)
    @nodesMap[value] = newNode
    if @root.nil?
        @root = newNode
        return 
    end
    @root.insert(newNode)
    begin  
        if newNode.isRoot?
            @root = newNode
            return
        end

        parent = newNode.parent

        return if parent.isBlack?

        if parent.isRoot?
            parent.black = true
            return 
        end

       grandParent = parent.parent

       uncle = if parent.isRightChild?
                   grandParent.leftChild
                else
                    grandParent.rightChild
                end 
    
        if uncle.nil? or uncle.isBlack?
           if newNode.isInnerGranchild?
                parent.rotate(newNode.isRightChild?)
                newNode = parent
                parent = newNode.parent
           end 

           isGrandParentRoot = grandParent.isRoot?
           grandParent.rotate(parent.isRightChild?)
           parent.black = true
           grandParent.black = false
           @root = parent if isGrandParentRoot      
           return 
        end

        parent.black = true
        uncle.black = true
        grandParent.black = false
        newNode = grandParent
      end until parent.isRoot?
    end

  :private

  def deleteHelper(nodeToDelete)

    if nodeToDelete.isRed? && nodeToDelete.isLeaf?
      return updateParentCorrectlyWithChild(nodeToDelete, nil)
    end
    if nodeToDelete.hasOnlyOneChild? #the child must be red
      child = if nodeToDelete.leftChild.nil?
                nodeToDelete.rightChild
              else
                nodeToDelete.leftChild
              end

      child.black = true
      return updateParentCorrectlyWithChild(nodeToDelete, child)
    end

    if nodeToDelete.hasTwoChildren?   
        maxLeftDescendant = nodeToDelete.leftChild.max
        nodeToDelete.black, maxLeftDescendant.black = maxLeftDescendant.black ,nodeToDelete.black

        if nodeToDelete.isRoot?
            @root = maxLeftDescendant
        end
        
        nodeToDelete.swap(maxLeftDescendant)
        return deleteHelper(nodeToDelete)
    end
    #the node is black non-root lead
    deleteBlackNonRootLeaf(nodeToDelete)
  end

  def deleteBlackNonRootLeaf(nodeToDelete)
    firstIteration = true
    isNodeToDeleteRightChild = nodeToDelete.isRightChild?
    nodeToDeleteOriginal = nodeToDelete
    updateParentCorrectlyWithChild(nodeToDelete, nil)

    begin
        parent = nodeToDelete.parent

        if firstIteration
            sibling = if isNodeToDeleteRightChild 
                          parent.leftChild
                      else
                          parent.rightChild
                      end
            firstIteration = false
        else
            sibling = if nodeToDelete.isLeftChild?
                        parent.rightChild
                      else 
                        parent.leftChild 
                      end
        end

        if sibling.nil?
            distantNephew = nil
            closeNephew = nil
        else
            distantNephew = if nodeToDelete.isLeftChild?
                        sibling.rightChild
                    else 
                        sibling.leftChild 
                    end
            closeNephew = if nodeToDelete.isLeftChild?
                        sibling.leftChild 
                    else 
                        sibling.rightChild
                    end
        end
        
        if !sibling.nil? && sibling.isRed?
            isParentRoot = parent.isRoot?
            parent.rotate(sibling.isRightChild?)
            @root = sibling if isParentRoot
            parent.black = false
            sibling.black = true

            sibling = closeNephew

            distantNephew = if nodeToDelete.isLeftChild?
                    sibling.rightChild
                  else 
                    sibling.leftChild 
                  end
        end

        if !distantNephew.nil? && distantNephew.isRed?
            isParentRoot = parent.isRoot?
            parent.rotate(sibling.isRightChild?)
            @root = sibling if isParentRoot

            sibling.black = parent.black

            parent.black = true
            distantNephew.black = true

            return nodeToDeleteOriginal
        end

        if !closeNephew.nil? && closeNephew.isRed?
            sibling.rotate(closeNephew.isRightChild?)
            sibling.black = false
            closeNephew.black = true
            distantNephew = sibling
            sibling = closeNephew
            isParentRoot = parent.isRoot?
            parent.rotate(sibling.isRightChild?)
            @root = sibling if isParentRoot

            sibling.black = parent.black
            parent.black = true
            distantNephew.black = true

            return nodeToDeleteOriginal
        end

        if parent.isRed?
            sibling.black = false unless sibling.nil?
            parent.black = true
            return nodeToDeleteOriginal
        end

        sibling.black = false unless sibling.nil?
        nodeToDelete = nodeToDelete.parent
    end until nodeToDelete.isRoot?
    nodeToDeleteOriginal
  end
end
```



###### Red and Black Node

```ruby
class RedBlackNode<TreeNode
    
    attr_accessor :black

    def initialize(key, value, black)
        super(key, value)
        @black = black
    end

    def rotate(isNewNodeRight)
        return self.rotateLeft if isNewNodeRight

        self.rotateRight
    end

    def isBlack?
        @black
    end

    def isRed? 
        !@black
    end

    def isInnerGranchild?
        (self.isLeftChild? && @parent.isRightChild?) || (self.isRightChild? && @parent.isLeftChild?)
    end

    def hasTwoChildren?
        !@rightChild.nil? && !@leftChild.nil?
    end

  def to_s
    "key: #{@key} - value: #{@value} - color: #{isBlack? ? "black" : "red"} - size: #{size}"
  end

    :private

    def rotateLeft
        intermediateLeftChild = @rightChild.leftChild
        updateParentDuringSwaping(@rightChild)
        @rightChild.setLeftChildWithoutUpdatingSize self
        self.rightChild = intermediateLeftChild
    end

    def rotateRight
        intermediateRightChild = @leftChild.rightChild
        updateParentDuringSwaping(@leftChild)
        @leftChild.setRightChildWithoutUpdatingSize self
        self.leftChild = intermediateRightChild
    end

end
```

#### Median Maintenance Solutions

##### Heap based

```ruby
class MendianMaintenanceHeap
    def initialize
        @smallerHeap = Heap.new #maximal heap, which is a miniminal with negative keys
        @biggerHeap = Heap.new #minimal heap
        @numberOfRounds = 0
    end

    def insert(number)
        insertNumber(number)
        @numberOfRounds = @numberOfRounds + 1
        balanceHeaps
        getMedian
    end

    :private

    def insertNumber(number)
        negativeNumber = number * (-1)
        return @biggerHeap.insert([number, number]) if @biggerHeap.elements.empty?

        biggerHeapMin = @biggerHeap.findMin[1]

        if number < biggerHeapMin
            @smallerHeap.insert([negativeNumber, number])
        else
            @biggerHeap.insert([number, number])
        end
    end

    def balanceHeaps
        return unless @numberOfRounds.even?

        smallerHeapSize = @smallerHeap.elements.size
        biggerHeapSize = @biggerHeap.elements.size

        return if smallerHeapSize == biggerHeapSize
        
        if smallerHeapSize < biggerHeapSize
            element = @biggerHeap.extractMin
            negativeNumber = element[0]*(-1)
            @smallerHeap.insert([negativeNumber, element[1]])
        else
            element = @smallerHeap.extractMin
            @biggerHeap.insert([element[1], element[1]])
        end
    end

    def getMedian
        if @smallerHeap.elements.size < @biggerHeap.elements.size
            @biggerHeap.findMin[1]
        else
            @smallerHeap.findMin[1]
        end
    end
end
```



##### Tree based

```ruby
class MendianMaintenanceBaseTree
    def insert(number)
        @elements.insert(number, number)
        median = (@elements.root.size/2).floor+1

        @elements.select(median)
    end
end

class MendianMaintenanceUnbalanced<MendianMaintenanceBaseTree
    def initialize
        @elements = UnbalancedSearchTree.new(nil)
    end
end

class MendianMaintenanceRedAndBlack<MendianMaintenanceBaseTree
    def initialize
        @elements = RedBlackTree.new(nil)
    end   
end
```



#### Tests

```ruby
def testMedian 

    timeHeapAscending = runTestAscending(MendianMaintenanceHeap.new) 
    timeUnbalancedAscending = runTestAscending(MendianMaintenanceUnbalanced.new)
    timeRedAndBlackAscending = runTestAscending(MendianMaintenanceRedAndBlack.new)

    puts "Ascending test:"
    puts "heap: #{timeHeapAscending} - Unbalanced: #{timeUnbalancedAscending} - Red and Black: #{timeRedAndBlackAscending}"

    timeHeapDescending = runTestDescending(MendianMaintenanceHeap.new) 
    timeUnbalancedDescending = runTestDescending(MendianMaintenanceUnbalanced.new)
    timeRedAndBlackDescending = runTestDescending(MendianMaintenanceRedAndBlack.new)

    puts "Descending test:"
    puts "heap: #{timeHeapDescending} - Unbalanced: #{timeUnbalancedDescending} - Red and Black: #{timeRedAndBlackDescending}"

    timeHeapRandom = 0.0
    timeUnbalancedRandom = 0.0
    timeRedAndBlackRandom = 0.0

    (0..14).each do 
        timeHeapRandom = timeHeapRandom + runTestRandom(MendianMaintenanceHeap.new)
        timeUnbalancedRandom = timeUnbalancedRandom + runTestRandom(MendianMaintenanceUnbalanced.new)
        timeRedAndBlackRandom = timeRedAndBlackRandom + runTestRandom(MendianMaintenanceRedAndBlack.new)
    end

    timeHeapRandom = timeHeapRandom/15
    timeUnbalancedRandom = timeUnbalancedRandom/15
    timeRedAndBlackRandom = timeRedAndBlackRandom/15

    puts "Random test:"
    puts "heap: #{timeHeapRandom} - Unbalanced: #{timeUnbalancedRandom} - Red and Black: #{timeRedAndBlackRandom}"
end 

def runTestAscending(medianMaintenance)
    Benchmark.measure do
        (0..4500).each do |i|
            medianMaintenance.insert(i)  
        end
    end.real
end

def runTestDescending(medianMaintenance)
    Benchmark.measure do
        4500.downto(0) do |i|
            medianMaintenance.insert(i)  
        end
    end.real
end

def runTestRandom(medianMaintenance)
    Benchmark.measure do
        (0..10000).each do
            i = rand(-100000000..100000000)
            medianMaintenance.insert(i)  
        end
    end.real
end
```

