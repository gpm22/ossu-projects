require 'benchmark'
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
    expectedHash12 = {"D"=>"1110", "B"=>"1111", "A"=>"110", "E"=>"10", "C"=>"0"}
    expectedsHash1 = [expectedHash1, expectedHash12]
    time1 = Benchmark.measure {testAux(alphabet1.getHuffmanCodeStraightfoward, expectedsHash1)}.real
    time12 = Benchmark.measure {testAux(alphabet1.getHuffmanCodeWithHeap, expectedsHash1)}.real
    time13 = Benchmark.measure {testAux(alphabet1.getHuffmanCodeWithSorting, expectedsHash1)}.real
    puts "straightfoward: #{time1} - Heap: #{time12} - Sorting: #{time13}"

    alphabet2 = alphabet2()
    expectedHash2 = {"A" => "101", "B" => "1001", "C" => "0", "D" => "1000", "E" => "11"}
    expectedHash22 = {"D"=>"1110", "B"=>"1111", "A"=>"110", "E"=>"10", "C"=>"0"}
    expectedsHash2 = [expectedHash2, expectedHash22]
    time2 = Benchmark.measure {testAux(alphabet2.getHuffmanCodeStraightfoward, expectedsHash2)}.real
    time22 = Benchmark.measure {testAux(alphabet2.getHuffmanCodeWithHeap, expectedsHash2)}.real
    time23 = Benchmark.measure {testAux(alphabet2.getHuffmanCodeWithSorting, expectedsHash2)}.real
    puts "straightfoward: #{time2} - Heap: #{time22} - Sorting: #{time23}"
end

def testAux(actualHash, expectedsHash)
    hasheseq = expectedsHash.include?(actualHash)
    puts "hashes are equal? #{hasheseq}"
    unless hasheseq
        
        puts "expecteds hashes: #{expectedsHash.map(&:to_s).to_s}"
        puts "actual hash: #{actualHash.to_s}"
        raise "noooooooooooooo"
    end
    puts "hash: #{actualHash.to_s}"
end 

def getRandomAlphabet
    symbols = []
    used = {}
    while symbols.size < 5000
        o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
        randomString = (0...50).map { o[rand(o.length)] }.join
        next if used.include?(randomString)
        symbols.push(MySymbol.new(randomString, rand(1..1000)))
    end
    Alphabet.new(symbols)
end

def effiencyTest
    alphabet = getRandomAlphabet
    time1 = Benchmark.measure {alphabet.getHuffmanCodeStraightfoward}.real
    time12 = Benchmark.measure {alphabet.getHuffmanCodeWithHeap}.real
    time13 = Benchmark.measure {alphabet.getHuffmanCodeWithSorting}.real
    puts "straightfoward: #{time1} - Heap: #{time12} - Sorting: #{time13}"
    puts "straightfoward/Heap: #{time1/time12} - Heap/Sorting: #{time12/time13}"
end

effiencyTest