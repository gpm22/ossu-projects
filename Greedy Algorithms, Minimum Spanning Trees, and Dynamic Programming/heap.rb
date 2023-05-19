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
        "elements: #{@elements.map{ |pair| "heap key: #{pair[0]} - position #{@positions[pair[1]]} - element: #{pair[1].to_s}"}.to_s}"
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