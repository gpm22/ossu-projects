class Graph
    attr_reader :nodes
    def initialize(nodes)
        @nodes = nodes
    end

    def getMaximumWeightedIndependentSet
        self.getMaximumWeightedIndependentSetValue
        self.reconstructIndependentSet
    end

    def getMaximumWeightedIndependentSetValue
        @subproblemsSolutions = Array.new(@nodes.size + 1)
        @subproblemsSolutions[0] = 0 #base case 1
        @subproblemsSolutions[1] = @nodes[0].weight #base case 2
        (2..@nodes.size).each do |i|
            @subproblemsSolutions[i] = [@subproblemsSolutions[i-1], (@subproblemsSolutions[i-2] + @nodes[i-1].weight)].max
        end
        @subproblemsSolutions[-1]
    end

    def to_s
        "Graph[nodes: #{nodes.map(&:to_s).to_s}]"
    end

    private

    def reconstructIndependentSet
        independentSet = []
        i = @nodes.size

        while i >= 2
            if @subproblemsSolutions[i-1] >= @subproblemsSolutions[i-2] + @nodes[i-1].weight # case 1 wins
                i = i -1 #exclude node[i-1]
            else #case 2 wins
                independentSet.push(@nodes[i-1]) #include node[i-1]
                i = i - 2 #exclude node[i-2]
            end
        end

        if i == 1 #base case 2
            independentSet.push(nodes[0])
        end

        independentSet
    end

end

class Node
    
    attr_accessor :neighbors, :key, :weight

    def initialize(key, weight)
        @key = key
        @weight = weight
    end

    def to_s
        "Node:[key: #{@key.to_s}, weight: #{@weight.to_s}, neighbors: #{@neighbors.map(&:key).to_s}]"
    end

    def ==(other)
        return false unless other.is_a? Node

        other.key == @key
    end
end

def getTestGraph
    node1 = Node.new(1, 3)
    node2 = Node.new(2, 2)
    node3 = Node.new(3, 1)
    node4 = Node.new(4, 6)
    node5 = Node.new(5, 4)
    node6 = Node.new(6, 5)

    node1.neighbors = [node2]
    node2.neighbors = [node1, node3]
    node3.neighbors = [node2, node4]
    node4.neighbors = [node3, node5]
    node5.neighbors = [node4, node6]
    node6.neighbors = [node5]

    nodes = [node1, node2, node3, node4, node5, node6]

    Graph.new(nodes)
end

def testGetMWISValue

    graph = getTestGraph()

    expected = 14
    real = graph.getMaximumWeightedIndependentSetValue

    puts("getMaximumWeightedIndependentSetValue testing")
    puts("#{expected == real ? "approved" : "wrong: real #{real} and not #{expected}"}")
end

def testGetMWIS
    graph = getTestGraph()
    nodes = graph.nodes
    expected = [nodes[0], nodes[3], nodes[5]]
    real = graph.getMaximumWeightedIndependentSet.sort {|v, w| v.key <=> w.key}
    puts("getMaximumWeightedIndependentSet testing")
    puts("#{expected == real ? "approved" : "wrong: real #{real.map(&:to_s).to_s} and not #{expected.map(&:to_s).to_s}"}")
end

def getGraphFromFile(file)
    nodes = []
    i = 0
    File.open(file).each_line do |line|
        if i == 0 
            i += 1
            next
        end
        nodes.push(Node.new(i, line.strip.to_i))
        i += 1
    end
    Graph.new(nodes)
end

def testFile1
    puts "testing with file 1"
    graph = getGraphFromFile("MWIS_file_1.txt")
    puts "MWIS value"
    puts graph.getMaximumWeightedIndependentSetValue
    puts "MWIS"
    puts graph.getMaximumWeightedIndependentSet.map(&:key).sort.to_s
end

def testFile2
    puts "testing with file 2"
    graph = getGraphFromFile("MWIS_file_2.txt")
    puts "MWIS value"
    puts graph.getMaximumWeightedIndependentSetValue
    puts "MWIS"
    puts graph.getMaximumWeightedIndependentSet.map(&:key).sort.to_s
end
testGetMWISValue
testGetMWIS
testFile1
testFile2
