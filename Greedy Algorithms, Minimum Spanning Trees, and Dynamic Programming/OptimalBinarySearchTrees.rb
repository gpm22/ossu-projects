class OptimaBinarySearchTree
  attr_reader :arr

  def initialize(arr)
    @arr = arr
  end

  def calculateMinimumWeightedSearchTime
    @subproblems = Array.new(@arr.size + 1) { Array.new(@arr.size + 1) }
    @roots = []
    #base cases
    (0..(@arr.size)).each { |i| @subproblems[i][i] = 0 }

    #systematically solve all @subproblems (i <= j)
    (0..@arr.size - 1).each do |s|
      (0..(@arr.size - s - 1)).each do |i|
        sumOfFrequencies = @arr[i..(i + s)].sum

        cases = []
        (i..(i + s)).each { |r| cases.push([@subproblems[i][r] + @subproblems[r + 1][i + s + 1], [r, i, i + s + 1]]) } if i != (i + s)
        minCases = cases.size > 0 ? cases.min { |a, b| [a[0], a[1][0]] <=> [b[0], b[1][0]] } : [0, [i, i, s]]
        @roots.push(minCases[1])
        @subproblems[i][i + s + 1] = sumOfFrequencies + minCases[0]
      end
    end
    @subproblems[0][@arr.size]
  end

  def getBinaryTree
    self.calculateMinimumWeightedSearchTime if @roots.nil?

    puts "roots:\n#{@roots.reverse.to_s}"
    rootValue = @roots[-1][0]
    root = Node.new(rootValue, @arr[rootValue])
    alreadyAdded = { rootValue.to_s => nil }
    filteredRoots = @roots.filter { |n| n[2] != 0 && ((n[1] <= rootValue && n[2] <= rootValue) || n[1] >= rootValue) && n[0] != rootValue }.sort { |a, b| (b[2] - b[1]).abs <=> (a[2] - a[1]).abs }
    baseCases = Array.new(@arr.size) { |i| [i, i, 0] }.reverse

    puts "filteredRoots: #{filteredRoots.concat(baseCases).to_s}"
    filteredRoots.each do |n|
      next if alreadyAdded.include?(n[0].to_s)

      root.addChild(Node.new(n[0], @arr[n[0]]))
      alreadyAdded[n[0].to_s] = nil
    end
    baseCases.each do |n|
      next if alreadyAdded.include?(n[0].to_s)

      root.addChild(Node.new(n[0], @arr[n[0]]))
      alreadyAdded[n[0].to_s] = nil
    end
    root
  end
end

class Node
  attr_accessor :value, :frequency, :leftChild, :rightChild, :parent

  def initialize(value, frequency)
    @value = value
    @frequency = frequency
  end

  def isRoot?
    @parent.nil?
  end

  def addChild(node)
    if node.value < @value
      self.addLeftChild(node)
    else
      self.addRightChild(node)
    end
  end

  def addLeftChild(node)
    if @leftChild.nil?
      @leftChild = node
      node.parent = self
      return
    end

    @leftChild.addChild(node)
  end

  def addRightChild(node)
    if @rightChild.nil?
      @rightChild = node
      node.parent = self
      return
    end

    @rightChild.addChild(node)
  end

  def weightedSearchTime
    currentNode = self
    until currentNode.isRoot?
      currentNode = currentNode.parent
    end

    weightedSearchTime = currentNode.frequency
    level = 2

    childrenArr = currentNode.children

    until childrenArr.size == 0
      weightedSearchTime += level * childrenArr.sum { |n| n.frequency }
      newChildren = []
      childrenArr.each { |n| newChildren.concat(n.children) }
      childrenArr = newChildren
      level += 1
    end

    weightedSearchTime
  end

  def treeFormat
    currentNode = self
    until currentNode.isRoot?
      currentNode = currentNode.parent
    end

    tree = currentNode.to_s

    childrenArr = currentNode.children

    until childrenArr.size == 0
      tree += "\n" + childrenArr.map(&:to_s).to_s
      newChildren = []
      childrenArr.each { |n| newChildren.concat(n.children) }
      childrenArr = newChildren
    end

    tree
  end

  def children
    return [] unless self.hasChildren?

    return [@rightChild] if @leftChild.nil?

    return [@leftChild] if @rightChild.nil?

    [@leftChild, @rightChild]
  end

  def hasChildren?
    !@leftChild.nil? || !@rightChild.nil?
  end

  def to_s
    "value: #{value} - frequency: #{frequency} - parent: #{self.isRoot? ? "" : @parent.value.to_s}"
  end
end

def test(arr, expected, testName = nil)
  testName = "arr:#{arr.to_s}\nexpected:#{expected}" if testName.nil?
  classResult = OptimaBinarySearchTree.new(arr)
  result = classResult.calculateMinimumWeightedSearchTime

  raise "test failed!: #{testName}\nactual result: #{result} different from the expected one: #{expected}" unless result == expected

  tree = classResult.getBinaryTree
  puts tree.treeFormat
  treeResult = tree.weightedSearchTime
  raise "test failed!: #{testName}\nactual tree result: #{treeResult} different from the expected one: #{expected}" unless treeResult == expected
  puts "test passed!: #{testName}"
end

def tests
  test([20, 5, 17, 10, 20, 3, 25], 223, "test book")
  test([25, 10, 20], 95, "ninja test")
  test([5, 4, 5, 9, 5, 5, 2, 10], 110, "personal 2")
  test([20, 5, 7, 4, 17, 10, 9, 20, 3, 25, 5, 4, 2, 10], 393, "personal 1")
  #test([2, 8, 2, 5, 5, 2, 8, 3, 6, 1, 1, 6, 3, 2, 6, 7, 4, 63, 2, 9, 10, 1, 60, 5, 2, 7, 34, 11, 31, 76, 21, 6, 8, 1, 81, 37, 15, 6, 8, 24, 12, 18, 42, 8, 51, 21, 8, 6, 5, 7], 2780, "web site problem")
end

def testNode
  root = Node.new(4, 20)
  rootCL = Node.new(2, 17)
  rootCR = Node.new(6, 25)
  rootGCLL = Node.new(0, 20)
  rootGCLR = Node.new(3, 10)
  rootGCRL = Node.new(5, 3)
  rootGGCLLL = Node.new(1, 5)

  rootGCLL.leftChild = rootGGCLLL
  rootGGCLLL.parent = rootGCLL
  rootCL.leftChild = rootGCLL
  rootGCLL.parent = rootCL
  rootCL.rightChild = rootGCLR
  rootGCLR.parent = rootCL
  rootCR.leftChild = rootGCRL
  rootGCRL.parent = rootCR
  root.leftChild = rootCL
  rootCL.parent = root
  root.rightChild = rootCR
  rootCR.parent = root

  puts root.weightedSearchTime
  puts rootGGCLLL.weightedSearchTime
  puts root.treeFormat
end

testNode
tests
