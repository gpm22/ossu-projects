class Graph
    attr_accessor :nodes

    def initialize(nodes)
        @nodes = nodes
    end

    def to_s
        @nodes.map{|n| n.to_s.gsub! '"', ''}.to_s
    end

    def clone
        getCopy(false)
    end

    def getReversed
        getCopy(true)
    end

    def unexploreAll
        @nodes.each {|n| n.explored = false}
    end

    private

    def getCopy(reversed)
        new_nodes = @nodes.map{|n| Node.new(n.value, [])}

        new_nodes.each do |n|
            old_node = @nodes.find{|n1| n1.value == n.value }

            next if old_node.nil?

            old_node.neighbors.each do |old_neighbor|
                new_neighbor = new_nodes.find{|n1| n1.value == old_neighbor.value}
                next if new_neighbor.nil?
                if reversed
                    new_neighbor.neighbors.push(n)
                else 
                    n.neighbors.push(new_neighbor)
                end
            end
        end

        Graph.new(new_nodes)
    end
end

class Node
    attr_accessor :neighbors, :value, :explored, :scc
    def initialize(value, neighbors)
        @value = value
        @neighbors = neighbors
        @explored = false
        @scc = -1
    end

    def to_s
        "value: " + @value.to_s + " - neighbors: "+ @neighbors.map(&:value.to_s).to_s
    end

    def ==(other)
        false if !(other.instance_of? Node)
        self.value == other.value
    end

    def explored?
        @explored
    end

    def unexplored?
        !@explored
    end

    def hash
        self.value.hash
    end
end

def kosaraju(graph)
    graph_rev = graph.getReversed 
    graph_rev.unexploreAll

    # first pass of depth-first search
    # (computes f(w)’s, the magical ordering)
    nodes_sorted = topoSort(graph_rev).map{|n| graph.nodes.find{|n1| n==n1}}

    # second pass of depth-first search
    # (finds SCCs in reverse topological order)
    graph.unexploreAll
    numSCC = 0
    nodes_sorted.each do |w| 
        if w.unexplored? 
        	numSCC = numSCC + 1
        	# assign scc-values (details below)
        	dfs_scc(graph, w, numSCC)
        end
    end
end


def dfs_scc(graph, s, numSCC)
    s.explored = true
    s.scc = numSCC 
    s.neighbors.each do |v|
        if v.unexplored?
           dfs_scc(graph, v, numSCC)
        end
    end
end

def topoSort(graph)
    graph.unexploreAll
    sortedNodes = []
    graph.nodes.each do |v| 
        if v.unexplored? # in a prior DFS
        	dfs_topo(graph, v, sortedNodes)
        end
    end
    sortedNodes
end

def dfs_topo(graph, s, sortedNodes)
    s.explored = true
    s.neighbors.each do |v| 
        if v.unexplored? 
        	dfs_topo(graph, v, sortedNodes)
        end
    end
    sortedNodes.unshift(s)
end

def scc_groups(graph)
    kosaraju(graph)
    max = graph.nodes.map(&:scc).max
    groups = []
    (1..max).each do |i|
        groups.push(graph.nodes.filter{|n| n.scc == i}.map(&:value))
    end
    groups
end

a = Node.new("a", [])
b = Node.new("b", [])
c = Node.new("c", [])
d = Node.new("d", [])

a.neighbors = [c]
b.neighbors = [a, d]
c.neighbors = [b]


g = Graph.new([a, b, c, d])

puts "topo sort of g: #{topoSort(g).map(&:value)}"

puts "scc groups of g: #{scc_groups(g)}"