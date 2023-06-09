require_relative './heap'

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
end

def alphabet2
    symbols = [MySymbol.new("A", 0.16), MySymbol.new("B", 0.08), MySymbol.new("C", 0.35), MySymbol.new("D", 0.07), MySymbol.new("E", 0.34)]
    Alphabet.new(symbols)
end

def alphabet1
    symbols = [MySymbol.new("A", 0.32), MySymbol.new("B", 0.25), MySymbol.new("C", 0.2), MySymbol.new("D", 0.18), MySymbol.new("E", 0.05)]
    Alphabet.new(symbols)
end

def tests
    alphabet1 = alphabet1()
    expectedHash1 = {"A" => "11", "B" => "10", "C" => "00", "D" => "011", "E" => "010"}
    testAux(alphabet1.getHuffmanCodeStraightfoward, expectedHash1)
    testAux(alphabet1.getHuffmanCodeWithHeap, expectedHash1)

    alphabet2 = alphabet2()
    expectedHash2 = {"A" => "101", "B" => "1001", "C" => "0", "D" => "1000", "E" => "11"}
    testAux(alphabet2.getHuffmanCodeStraightfoward, expectedHash2)
    testAux(alphabet2.getHuffmanCodeWithHeap, expectedHash2)
end

def testAux(actualHash, expectedHash)
    hasheseq = actualHash == expectedHash
    puts "hashes are equal? #{hasheseq}"
    unless hasheseq
        
        puts "expected hash: #{expectedHash.to_s}"
        puts "actual hash: #{actualHash.to_s}"
        raise "noooooooooooooo"
    end
    puts "hash: #{expectedHash.to_s}"
end 

tests