require './unbalanced_search_tree'
require './red_black_tree'
require './heap'
require 'benchmark'

class MendianMaintenanceBaseTree
    def insert(number)
        @elements.insert(number, number)

        median = (@elements.root.size/2).floor

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
        return @smallerHeap.insert([negativeNumber, number]) if @smallerHeap.elements.empty?
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

def testMedianHeap 

    medianMaintenance = MendianMaintenanceHeap.new
    (0..10).each do |i|
        puts medianMaintenance.insert(i)
    end
end 

testMedianHeap