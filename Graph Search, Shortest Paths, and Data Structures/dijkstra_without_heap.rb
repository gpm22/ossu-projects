require 'benchmark'

class Graph
    attr_accessor :nodes

    def initialize(nodes)
        @nodes = nodes
    end

    def to_s
        @nodes.map{|n| n.to_s.gsub! '"', ''}.to_s
    end

    def self.newCompleteGraphWithRandomLenghts(number_of_vertices)
        nodes = (0..number_of_vertices).map {|i| Node.new(i.to_s, [])}
        nodes.each_index do |i|
            neighbors = nodes.map {|n| [n, rand(0..100000)]} 
            neighbors.delete_at(i)
            nodes[i].neighbors = neighbors
        end
        Graph.new(nodes)
    end

end

class Node
    attr_accessor :neighbors, :value
    def initialize(value, neighbors)
        @value = value
        @neighbors = neighbors
        @explored = false
        @scc = -1
    end

    def to_s
        "value: " + @value + " - neighbors: "+ @neighbors.map{|pair| [pair[0].value.to_s, pair[1].to_s]}.to_s
    end

    def ==(other)
        false if !(other.instance_of? Node)
        self.value == other.value
    end

    def hash
        self.value.hash
    end
end

def dijkstra(graph, starting_vertex)
    puts "starting dijkstra"
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

def get_graph_from_file
    puts "getting graph from file"
    nodes = Hash.new 
    arr = File.open("dijkstra_without_heap_graph.txt").each_line do |line|
        values = line.split(" ")
        new_node = Node.new(values[0], [])
        nodes[values[0]] = new_node

        values.drop(1).each do |pair|

            neighbor_value, lenght = pair.split(",")

            neighbor = nodes[neighbor_value]

            if neighbor.nil?
                neighbor = Node.new(neighbor_value, [])
                nodes[neighbor_value] = neighbor
            end
            new_node.neighbors.push([neighbor, lenght.to_i])
        end
    end
    Graph.new(nodes.values)
end

def getDistanceFromSpecificNodes
    nodes = ["7","37","59","82","99","115","133","165","188","197"]
    g = get_graph_from_file 
    shortest_distance = dijkstra(g, g.nodes[0])
    nodes.map{|n| shortest_distance[n]}
end

# puts getDistanceFromSpecificNodes.to_s 

puts "starting test to verify size of the graph so dijkstra runs in less than 5 minutes" 
n = 1350
puts "creating graph with #{n} nodes"
g = Graph.newCompleteGraphWithRandomLenghts(n)
puts "running dijkstra"
time = Benchmark.measure {
    dijkstra(g, g.nodes[0])
}
puts "finishing test executed in #{time.real} s"
