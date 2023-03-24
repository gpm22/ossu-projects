require 'benchmark'
require './heap'

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
            puts "Filling node with neighbors #{i}/#{nodes.size}"
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

    nodesMap = Hash[graph.nodes.collect { |n| [n.value, n]}]
    shortest_distance = Hash[graph.nodes.collect { |n| [n.value, nil]}]
    shortest_distance[starting_vertex.value] = 0

    vertices_to_visit = Heap.new
    vertices_to_visit.heapify(graph.nodes.map do |n| 
        if n == starting_vertex
            [0, n.value]
        else
            [Float::INFINITY, n.value] 
        end 
    end)
    

    visited_vertices = Hash.new

    while !vertices_to_visit.empty? 
        new_vertice = vertices_to_visit.extractMin
        new_vertice_node = nodesMap[new_vertice[1]]
        visited_vertices[new_vertice[1]] =  new_vertice_node
        shortest_distance[new_vertice[1]] = new_vertice[0]

        new_vertice_node.neighbors.each do |neighbor|
            if vertices_to_visit.include?(neighbor[0].value)
                deleted = vertices_to_visit.delete(neighbor[0].value)
                new_key = [deleted[0], shortest_distance[new_vertice[1]] + neighbor[1]].min
                vertices_to_visit.insert([new_key, neighbor[0].value])
            end
        end 

    end

    shortest_distance
end

def getTestGraph
    a = Node.new("a", [])
    b = Node.new("b", [])
    c = Node.new("c", [])
    d = Node.new("d", [])

    a.neighbors = [[d, 19], [c, 10]]
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

g = getTestGraph

#puts getDistanceFromSpecificNodes.to_s 

puts "starting test to verify size of the graph so dijkstra runs in less than 5 minutes" 
n = 14700 
puts "creating graph with #{n} nodes"
g = Graph.newCompleteGraphWithRandomLenghts(n)
puts "running dijkstra"
time = Benchmark.measure {
    dijkstra(g, g.nodes[0])
}
puts "finishing test executed in #{time.real} s"