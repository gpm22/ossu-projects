class UnionFind

    def initialize(elements)
        @nodes = {}
        elements.each do |element|
            @nodes[element] = Node.new(element, nil, 1)
        end
    end

    def find(element)
        node = @nodes[element]
        return node.value if node.isRoot?
        node.parent.value 
    end

    def union(firstElement, secondElement)
        firstRoot = @nodes[self.find(firstElement)]
        secondRoot = @nodes[self.find(secondElement)]
        
        return if firstRoot == secondRoot

        if firstRoot.size < secondRoot.size
            firstRoot.parent = secondRoot 
            secondRoot.size = secondRoot.size + firstRoot.size
        else
            secondRoot.parent = firstRoot
            firstRoot.size = firstRoot.size + secondRoot.size
        end
        self
    end

    private

    class Node
        attr_accessor :parent, :value, :size

        def initialize(value, parent, size)
            @value = value
            @parent = parent
            @size = size
        end

        def isRoot?
            @parent.nil?
        end

        def == other
           return false if other.nil? || other.is_a?(Node)
           @value == other.value
        end
    end
end