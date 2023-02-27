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

def calulate_size(sub1, sub2)
    size = 0
    sub1.each  do |n_1|
        size = size + (n_1.neighbors & sub2).length
    end
    size
end

def get_a_min_global_cut(graph)
    puts "Starting get a min global cut"
    results = []
    n = graph.nodes.length
    n = n*n/2
    min = n*2
    min_r = nil
    # run contraction n²/2 times
    (0..n).each do |i|
        puts "running contraction #{i}/#{n}"
        g = graph.clone
        graph_contraction(g)
        result = []
        result[0]= g.nodes[0].value.split("-").map {|value| graph.nodes.find {|n1| n1.value == value}}
        result[1]= g.nodes[1].value.split("-").map {|value| graph.nodes.find {|n1| n1.value == value}}
        result[2] = calulate_size(result[0], result[1]) 
        if result[2] < min
            min = result[2]
            min_r = result
            puts "new min is #{min}"
        end
    end

    puts "returning minimal global cut"
    min_r
end

def get_test_graph_min_cut_size_1
    a = Node.new("a", [])
    b = Node.new("b", [])
    c = Node.new("c", [a, b])

    b.neighbors = [a, c]
    a.neighbors = [b, c]

    d = Node.new("d", [c])
    Graph.new([a, b, c, d])
end

def get_test_graph_min_cut_size_2
    a = Node.new("a", [])
    b = Node.new("b", [])
    c = Node.new("c", [a, b])

    b.neighbors = [a, c]
    a.neighbors = [b, c]

    d = Node.new("d", [c, a])
    Graph.new([a, b, c, d])
end

def get_graph_from_file
    arr = File.open("graph.txt").readlines.map{ |l| l.split("\t").map(&:to_i).filter(&:positive?)}
    nodes = [] 

    # creating the nodes
    arr.each {|line| nodes.push(Node.new(line[0].to_s, []))}

    # adding the neighbors

    arr.each do |line|
        node = nodes.find{ |n| n.value == line[0].to_s}

        line.drop(1).each do |neighbor|
            node_neighbor = nodes.find{|n| n.value == neighbor.to_s}
            node.neighbors.push(node_neighbor)
        end
    end

    Graph.new(nodes)
end

puts "test cut with size 1\n #{(get_a_min_global_cut(get_test_graph_min_cut_size_1).take(2).map do |r|
    r.map{|n| n.to_s.gsub! '"', ''}
end).to_s.gsub! '],', "]\n"}"

puts "test cut with size 2\n #{(get_a_min_global_cut(get_test_graph_min_cut_size_2).take(2).map do |r|
    r.map{|n| n.to_s.gsub! '"', ''}
end).to_s.gsub! '],', "]\n"}"


#min_cut_real_graph = get_a_min_global_cut(get_graph_from_file)  
#puts "test cut with real graph\n size: #{min_cut_real_graph[2]}\n#{(min_cut_real_graph.take(2).map do |r|
    #r.map{|n| n.to_s.gsub! '"', ''}
#end).to_s.gsub! ', "value', "\n\"value"}"