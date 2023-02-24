require 'set'

class Graph
    attr_accessor :nodes

    def initialize(nodes)
        @nodes = nodes
    end

    def to_s
        @nodes.map{|n| n.to_s.gsub! '"', ''}.to_s
    end
end

class Node
    attr_accessor :neighbors, :value
    def initialize(value, neighbors)
        @value = value
        @neighbors = neighbors
    end

    def to_s
        "value: " + @value.to_s + " - neighbors: "+ @neighbors.map{|v| v.value.to_s}.to_s
    end
end

def graph_contraction(graph)
    if graph.nodes.length == 2
        return graph.nodes
    end

    edge = choose_edge(graph)

    contracted_graph = contract_graph(graph, edge)

    graph_contraction(contracted_graph)

end

def choose_edge(graph)
    u = graph.nodes.to_a.sample
    v = u.neighbors.to_a.sample
    [u, v]
end

def contract_graph(graph, edge)
    [u, v] = edge
    uv = Node.new()
    contracted_graph = Graph.new(graph.nodes)
    graph
end


a = Node.new("a", [])
b = Node.new("b", [])
c = Node.new("c", Set[a, b])

b.neighbors = Set[a, c]
a.neighbors = Set[b, c]

g = Graph.new(Set[a, b, c])


puts a
puts b
puts c
puts g
puts choose_edge(g).map{|v| v.value.to_s}.to_s