class Graph
  attr_accessor :nodes

  def initialize(nodes)
    @nodes = nodes
  end

  def to_s
    @nodes.map { |n| n.to_s.gsub! '"', '' }.to_s
  end

  def clone
    getCopy(false)
  end

  def getReversed
    getCopy(true)
  end

  def unexploreAll
    @nodes.each { |n| n.explored = false }
  end

  private

  def getCopy(reversed)
    new_nodes = Hash[@nodes.map { |n| Node.new(n.value, []) }.collect { |n| [n.value, n] }]

    old_nodes = Hash[@nodes.collect { |n| [n.value, n] }]
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
    'value: ' + @value + ' - neighbors: ' + @neighbors.map(&:value).to_s
  end

  def ==(other)
    false unless other.instance_of? Node
    value == other.value
  end

  def explored?
    @explored
  end

  def unexplored?
    !@explored
  end

  def hash
    value.hash
  end
end

def kosaraju(graph)
  puts 'starting kosaraju'
  puts 'getting the reversed graph'
  graph_rev = graph.getReversed

  puts 'putting reversed graph is unexplored'
  #    graph_rev.unexploreAll

  # first pass of depth-first search
  # (computes f(w)’s, the magical ordering)

  puts 'creating hash nodes'
  hash_nodes = Hash[graph.nodes.collect { |n| [n.value, n] }]
  puts 'toposorting the reversed graph'
  nodes_sorted = topoSort(graph_rev).map { |n| hash_nodes[n.value] }

  # second pass of depth-first search
  # (finds SCCs in reverse topological order)
  puts 'putting graph as unexplored'
  #    graph.unexploreAll
  numSCC = 0
  puts 'starting the second dfs'
  hash_SCC = {}
  nodes_sorted.each do |w|
    next unless w.unexplored?

    numSCC += 1
    hash_SCC[numSCC] = 0
    # assign scc-values (details below)
    dfs_scc(w, numSCC, hash_SCC)
    puts "group SCC #{numSCC} with size #{hash_SCC[numSCC]}"
  end

  hash_SCC
end

def dfs_scc(s, numSCC, hash_SCC)
  stack = [s]
  until stack.empty?
    v = stack.pop
    next unless v.unexplored?

    v.explored = true
    v.scc = numSCC
    hash_SCC[numSCC] = hash_SCC[numSCC] + 1
    v.neighbors.each do |n|
      stack.push(n) if n.unexplored?
    end
  end
end

def topoSort(graph)
  graph.unexploreAll
  sortedNodes = []
  stack = []
  graph.nodes.each do |v|
    dfs_topo(v, stack, sortedNodes) if v.unexplored? # in a prior DFS
  end
  sortedNodes
end

def dfs_topo(s, stack, sortedNodes)
  stack.push([false, s])
  until stack.empty?
    isParent, v = stack.pop
    if isParent
      sortedNodes.unshift(v)
      next
    end
    next unless v.unexplored?

    v.explored = true
    stack.push([true, v])
    v.neighbors.each do |n|
      stack.push([false, n]) if n.unexplored?
    end
  end
end

def scc_groups(graph)
  kosaraju(graph)
  max = graph.nodes.map(&:scc).max
  groups = []
  (1..max).each do |i|
    groups.push(graph.nodes.filter { |n| n.scc == i }.map(&:value))
  end
  groups
end

def scc_groups_size(graph)
  hash_SCC = kosaraju(graph)
  puts 'scc_groups_size'
  max = hash_SCC.keys.max
  puts "max scc value is #{max}"

  hash_SCC.values.sort.reverse
end

def get_biggest_5(graph)
  groups_sizes = scc_groups_size(graph)
  groups_sizes[0..4]
end

def get_graph_from_file
  puts 'getting graph from file'
  nodes = {}
  arr = File.open('big_graph_SCC.txt').each_line do |line|
    values = line.split(' ')
    node_1 = nodes[values[0]]
    node_2 = nodes[values[1]]

    if node_1.nil?
      node_1 = Node.new(values[0], [])
      nodes[values[0]] = node_1
    end

    if node_2.nil?
      node_2 = Node.new(values[1], [])
      nodes[values[1]] = node_2
    end
    node_1.neighbors.push(node_2)
  end
  Graph.new(nodes.values)
end

def getTestGraph
  a = Node.new('a', [])
  b = Node.new('b', [])
  c = Node.new('c', [])
  d = Node.new('d', [])

  a.neighbors = [c]
  b.neighbors = [a, d]
  c.neighbors = [b]

  Graph.new([a, b, c, d])
end

puts "size of 5 biggest SCCs of graph: #{get_biggest_5(get_graph_from_file)}"
