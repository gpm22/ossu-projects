class Graph
    attr_accessor :nodes

    def initialize(nodes)
        @nodes = nodes
    end

    def to_s
        @nodes.map{|n| n.to_s.gsub! '"', ''}.to_s
    end

    def contract(edge)
        
        #contracting edge
        u, v = edge
        uv_value = u.value.to_s + "-" + v.value.to_s
        uv_neighbours = u.neighbors | v.neighbors
        uv_neighbours = uv_neighbours - edge

        uv = Node.new(uv_value, uv_neighbours)

        # removing u and v from other nodes and adding uv in their place
        self.nodes = self.nodes - edge
        self.nodes.push(uv)

        self.nodes.each do |node|
            if node.neighbors.member?(u) || node.neighbors.member?(v)
                node.neighbors.delete(u)
                node.neighbors.delete(v)
                node.neighbors.push(uv)
            end
        end
        self
    end

    def get_random_edge
        u = self.nodes.sample
        v = u.neighbors.sample
        [u, v]
    end

    def clone
        new_nodes = @nodes.map{|n| Node.new(n.value, [])}

        new_nodes.each do |n|
            old_node = @nodes.find{|n1| n1.value == n.value }

            next if old_node.nil?

            old_node.neighbors.each do |old_neighbor|
                new_neighbor = new_nodes.find{|n1| n1.value == old_neighbor.value}
                next if new_neighbor.nil?
                n.neighbors.push(new_neighbor)
            end
        end

        Graph.new(new_nodes)
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

    def ==(other)
        false if !(other.instance_of? Node)
        self.value == other.value && self.neighbors == other.neighbors
    end

    def hash
        [self.value, self.neighbors].hash
    end
end

def graph_contraction(graph)
    if graph.nodes.length == 2
        return graph
    end

    graph.contract(graph.get_random_edge)
    graph_contraction(graph)
end

def get_graph
    a = Node.new("a", [])
    b = Node.new("b", [])
    c = Node.new("c", [a, b])

    b.neighbors = [a, c]
    a.neighbors = [b, c]

    d = Node.new("d", [c])
    Graph.new([a, b, c, d])
end

def run_contraction(graph)
    results = []
    n = graph.nodes.length
    n = n*n

    (0..n).each do
        g = graph.clone
        graph_contraction(g)

        result = [g.nodes[0].value.split("-"), g.nodes[1].value.split("-") ]
        results.push(result)
    end
    # TODO return the min cut
    results
end


puts run_contraction(get_graph).map {|x| x.to_s}