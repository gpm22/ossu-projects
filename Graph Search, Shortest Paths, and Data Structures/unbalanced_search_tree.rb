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
    deleteHelper(nodeToDelete)
  end

  def select(position)
    return nil if position < 1 || position > @root.size

    @root.select(position)
  end

  :private

  def deleteHelper(nodeToDelete)
    return if nodeToDelete.nil?

    @nodesMap.delete(nodeToDelete.value)

    if nodeToDelete.isRoot? && nodeToDelete.isLeaf?
        @root = nil
        return 
    end

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

def generateTestTree
  node1 = TreeNode.new(-4, 'a')

  node2 = TreeNode.new(-2, 'b')

  node3 = TreeNode.new(-3, 'c')
  node3.leftChild = node1
  node3.rightChild = node2

  node4 = TreeNode.new(4, 'd')

  node5 = TreeNode.new(20, 'e')

  node6 = TreeNode.new(10, 'f')
  node6.leftChild = node4
  node6.rightChild = node5

  node7 = TreeNode.new(1, 'g')
  node7.leftChild = node3
  node7.rightChild = node6

  UnbalancedSearchTree.new(node7)
end

#testTree = generateTestTree

#puts testTree.outputSorted.map(&:to_s).to_s.gsub! ',', "\n"

#puts testTree.successor('a')

#puts testTree.predecessor('d')

#testTree.insert(-5, 'h')

#puts testTree.outputSorted.map(&:to_s).to_s.gsub! ',', "\n"

#puts testTree.min

#testTree.delete(20)

#puts testTree.outputSorted.map(&:to_s).to_s.gsub! ',', "\n"


#puts testTree.select(1)

#puts testTree.select(4)

#puts testTree.select(7)
