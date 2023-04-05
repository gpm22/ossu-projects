require './unbalanced_search_tree'

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

  def delete(key)
    nodeToDelete = search(key)
    deleteHelper(nodeToDelete)
  end


  :private

  def deleteHelper(nodeToDelete)

    return if nodeToDelete.nil?

    @nodesMap.delete(nodeToDelete.value)

    if nodeToDelete.isRoot? && nodeToDelete.isLeaf?
        @root = nil
        return 
    end

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

def generateRedBlackTestTree
  node1 = RedBlackNode.new(-4, 'a', true)

  node2 = RedBlackNode.new(-2, 'b', true)

  node3 = RedBlackNode.new(-3, 'c', false)
  node3.leftChild = node1
  node3.rightChild = node2

  node4 = RedBlackNode.new(4, 'd', true)

  node5 = RedBlackNode.new(20, 'e', true)

  node6 = RedBlackNode.new(10, 'f', false)
  node6.leftChild = node4
  node6.rightChild = node5

  node7 = RedBlackNode.new(1, 'g', true)
  node7.leftChild = node3
  node7.rightChild = node6

  RedBlackTree.new(node7)
end

def testInsert
    tree = RedBlackTree.new(nil)

    testInsertHelper(tree, 10, "a");
    testInsertHelper(tree, -1, "a");
    testInsertHelper(tree, 1, "a");
    testInsertHelper(tree, 0, "a");
    testInsertHelper(tree, 100, "a");
    testInsertHelper(tree, 1000, "a");
    testInsertHelper(tree, 11, "a");
    testInsertHelper(tree, 12, "a");
    testInsertHelper(tree, -10, "a");
    testInsertHelper(tree, -110, "a");
    testInsertHelper(tree, 15, "a");
    tree
end

def testInsertHelper(tree, key, value)
    tree.insert(key, value)
    arr = tree.outputSorted.map(&:to_s)
    if arr.size > 1
        puts arr.to_s.gsub! ',', "\n"
    else
        puts arr.to_s
    end
    puts "--------------------------"
end

testTree = testInsert #generateRedBlackTestTree

#puts testTree.outputSorted.map(&:to_s).to_s.gsub! ',', "\n"

#puts testTree.successor('a')

#puts testTree.predecessor('d')

testTree.insert(-5, 'h')

#puts testTree.outputSorted.map(&:to_s).to_s.gsub! ',', "\n"

#puts testTree.min

puts testTree.outputSorted.map(&:to_s).to_s.gsub! ',', "\n"
keyToDelete = 1 
puts "deletando #{keyToDelete}"
testTree.delete(keyToDelete)

puts testTree.outputSorted.map(&:to_s).to_s.gsub! ',', "\n"


puts testTree.select(1)

puts testTree.select(4)

puts testTree.select(7)