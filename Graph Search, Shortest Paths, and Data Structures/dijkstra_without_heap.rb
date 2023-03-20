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
        new_nodes = Hash[@nodes.map{|n| Node.new(n.value, [])}.collect { |n| [n.value, n]}]

        old_nodes = Hash[@nodes.collect { |n| [n.value, n]}]
        new_nodes.values.each do |n|
            old_node = old_nodes[n.value]
            next if old_node.nil?

            old_node.neighbors.each do |old_neighbor|
                new_neighbor = new_nodes[old_neighbor.value]
                next if new_neighbor.nil?
                if reversed
                    new_neighbor.neighbors.push(n)
                else 
                    n.neighbors.push(new_neighbor)
                end
            end
        end

        Graph.new(new_nodes.values)
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
        "value: " + @value + " - neighbors: "+ @neighbors.map(&:value).to_s
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

def dijkstra(graph, starting_vertex)
    shortest_distance = Hash[graph.nodes.collect { |n| [n.value, nil]}]
    shortest_distance[starting_vertex.value] = 0

    vertices_to_visit = Hash[graph.nodes.collect { |n| [n.value, n]}]

    visited_vertices = Hash.new
    visited_vertices[starting_vertex.value] = starting_vertex

    vertices_to_visit.delete(starting_vertex.value)
    possible_edges = Hash[starting_vertex.neighbors.collect {|n|  [[starting_vertex.value, n[0].value], n[1]]}]

    while !possible_edges.empty? 
        minimum_edge = get_minimum_edge(possible_edges, shortest_distance)
        visited_vertices[minimum_edge[1]] = vertices_to_visit.delete(minimum_edge[1])
        shortest_distance[minimum_edge[1]] = shortest_distance[minimum_edge[0]] + minimum_edge[2]
        possible_edges = get_possible_edges(visited_vertices, vertices_to_visit)
    end

    shortest_distance
end

def get_minimum_edge(edges, shortest_distance)
    puts "edges: #{edges.to_s}"
    initial_key = edges.keys[0]
    initial_len = edges[initial_key]
    minimal_dijkstra_number = shortest_distance[initial_key[0]] + initial_len
    minimum_edge = [initial_key[0], initial_key[1], initial_len]
    edges.each do |key, len|
        current_dijkstra_number = shortest_distance[key[0]] + len
        if current_dijkstra_number < minimal_dijkstra_number
            minimal_dijkstra_number = current_dijkstra_number
            minimum_edge = [key[0], key[1], len]
        end
    end

    minimum_edge
end


def get_possible_edges(visited_vertices, vertices_to_visit)
    possible_edges = Hash.new
    visited_vertices.each do |key, value|
        value.neighbors.each do |n|
            if vertices_to_visit.has_key?(n[0].value)
                possible_edges[[key, n[0].value]] = n[1]
            end
        end
    end
    possible_edges
end

def getTestGraph
    a = Node.new("a", [])
    b = Node.new("b", [])
    c = Node.new("c", [])
    d = Node.new("d", [])

    a.neighbors = [[d, 16], [c, 10]]
    b.neighbors = [[d, 3]]
    c.neighbors = [[b, 4]]

    Graph.new([a, b, c, d])
end

g = getTestGraph

puts dijkstra(g, g.nodes[0])