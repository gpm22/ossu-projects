require 'benchmark'
require_relative './heap'
require_relative './unionFind'

class Graph
  attr_accessor :nodes

  def initialize(nodes)
    @nodes = nodes
  end

  def to_s
    @nodes.map { |n| n.to_s.gsub! '"', '' }.to_s
  end

  def self.newCompleteGraphWithRandomLenghts(number_of_vertices)
    nodes = (0..number_of_vertices).map { |i| Node.new(i.to_s, []) }
    nodes.each_index do |i|
      ((i+1)..(nodes.size-1)).each do |j|
        weight = rand(0..100_000) 
        nodes[i].neighbors.push([nodes[j], weight])
        nodes[j].neighbors.push([nodes[i], weight])
      end
    end
    Graph.new(nodes)
  end

  def getMST_Prim
    # Initialization
    firstNode = @nodes[0]
    visited = {firstNode.value.to_s => firstNode}
    nodesHash = Hash[@nodes.collect { |n| [n.value.to_s, n] }]
    mst = []
    heap = Heap.new

    firstNode.neighbors.each do |neighbor|
        neighbor[0].key = neighbor[1]
        neighbor[0].winner = [firstNode, neighbor[0], neighbor[1]]
        heap.insert([neighbor[1], neighbor[0].value.to_s])
    end
    # Main loop
      until heap.empty? || mst.size == (@nodes.size - 1)
        nextNode = nodesHash[heap.extractMin[1]]
        visited[nextNode.value.to_s] = nextNode
        mst.push(nextNode.winner)
        # Update keys to maintain invariant
        nextNode.neighbors.filter{ |pair| !visited.include?(pair[0].value.to_s)}.each do |pair|
            if pair[0].key.nil?
                pair[0].key = pair[1]
                pair[0].winner = [nextNode, pair[0], pair[1]]
                heap.insert([pair[0].key, pair[0].value.to_s])
            elsif pair[1] < pair[0].key
                heap.delete(pair[0].value.to_s)
                pair[0].key = pair[1]
                pair[0].winner = [nextNode, pair[0], pair[1]]
                heap.insert([pair[0].key, pair[0].value.to_s])
            end
        end
    end

    mst 
  end

  def getMST_Kruskal
    self.generateWeightedEdges

    # Initialization
    mst = []
    unionFind = UnionFind.new(@nodes.map{|node| node.value.to_s})
    @edges.sort! {|a, b| a[2] <=> b[2]}

    # Main loop

    @edges.each do |edge|
      return mst if mst.size == (@nodes.size - 1)
      if unionFind.find(edge[0].value.to_s) != unionFind.find(edge[1].value.to_s)
        mst.push edge
        unionFind.union(edge[0].value.to_s, edge[1].value.to_s)
      end
    end
    mst
  end

  private

  def generateWeightedEdges
    return unless @edges.nil?
    @edges = []
    edgesAdded = {}

    @nodes.each do |node|
      node.neighbors.each do |neighbor|
        unless edgesAdded.include?("#{node.value.to_s}--#{neighbor[0].value.to_s}--#{neighbor[1].to_s}") || edgesAdded.include?("#{neighbor[0].value.to_s}--#{node.value.to_s}--#{neighbor[1].to_s}")

          @edges.push([node, neighbor[0], neighbor[1]])
          edgesAdded["#{neighbor[0].value.to_s}--#{node.value.to_s}--#{neighbor[1].to_s}"] = nil
        end
      end
    end
  end
end

class Node
  attr_accessor :neighbors, :value, :key, :winner

  def initialize(value, neighbors)
    @value = value
    @neighbors = neighbors
  end

  def to_s
    "value: #{@value} - key: #{@key} - neighbors: #{@neighbors.map { |pair| [pair[0].value.to_s, pair[1].to_s] }.to_s}"
  end

  def ==(other)
    false unless other.instance_of? Node
    value == other.value
  end

  def hash
    value.hash
  end
end

def getTestGraph
  a = Node.new('a', [])
  b = Node.new('b', [])
  c = Node.new('c', [])
  d = Node.new('d', [])

  a.neighbors = [[d, 10], [c, 19]]
  b.neighbors = [[d, 3], [c, 4]]
  c.neighbors = [[b, 4], [a, 19]]
  d.neighbors = [[a, 10], [b, 3]]

  Graph.new([a, b, c, d])
end

def test(g)

  #puts "graph: #{g.to_s}"
  puts "testing prim's algorithm"
  mst = g.getMST_Prim.sort {|a, b| a[2] <=> b[2]}
  puts "result: #{mst.map{|triple| "[#{triple[0].value.to_s}, #{triple[1].value.to_s}] - weight: #{triple[2]}"}.to_s}"

  puts "testing kruskal's algorithm"
  mst = g.getMST_Kruskal
  puts "result: #{mst.map{|triple| "[#{triple[0].value.to_s}, #{triple[1].value.to_s}] - weight: #{triple[2]}"}.to_s}"
end

def firstTest
  puts "first test"
  g = getTestGraph
  puts "graph: #{g.to_s}"
  test(g)
end

def secondTest
  puts "second test"
  node = (0..5).map { |i| Node.new(i.to_s, []) }

  node[0].neighbors = [[node[1], 40386], [node[2], 67309], [node[3], 83320], [node[4], 64367], [node[5], 61777]]
  node[1].neighbors = [[node[0], 40386], [node[2], 37447], [node[3], 51865], [node[4], 80042], [node[5], 88270]]
  node[2].neighbors = [[node[0], 67309], [node[1], 37447], [node[3], 53140], [node[4], 29778], [node[5], 78552]]
  node[3].neighbors = [[node[0], 83320], [node[1], 51865], [node[2], 53140], [node[4], 22868], [node[5], 19412]]
  node[4].neighbors = [[node[0], 64367], [node[1], 80042], [node[2], 29778], [node[3], 22868], [node[5], 19748]]
  node[5].neighbors = [[node[0], 61777], [node[1], 88270], [node[2], 78552], [node[3], 19412], [node[4], 19748]]
  g = Graph.new(node)
  puts "graph: #{g.to_s}"
  test(g)
end

def thirdTest
  puts "third test"
  nodes = (0..10).map { |i| Node.new(i.to_s, []) }
  g = Graph.new(nodes)

  nodes[0].neighbors = [[nodes[1], 24099], [nodes[2], 54263], [nodes[3], 49667], [nodes[4], 85216], [nodes[5], 32174], [nodes[6], 57615], [nodes[7], 60695], [nodes[8], 43643], [nodes[9], 31589], [nodes[10], 93973]]
  nodes[1].neighbors = [[nodes[0], 24099], [nodes[2], 55461], [nodes[3], 82855], [nodes[4], 42534], [nodes[5], 58945], [nodes[6], 24432], [nodes[7], 52125], [nodes[8], 44760], [nodes[9], 16054], [nodes[10], 70244]]
  nodes[2].neighbors = [[nodes[0], 54263], [nodes[1], 55461], [nodes[3], 19617], [nodes[4], 98338], [nodes[5], 5515], [nodes[6], 54577], [nodes[7], 53654], [nodes[8], 14809], [nodes[9], 25204], [nodes[10], 88668]]
  nodes[3].neighbors = [[nodes[0], 49667], [nodes[1], 82855], [nodes[2], 19617], [nodes[4], 9833], [nodes[5], 72460], [nodes[6], 43420], [nodes[7], 99825], [nodes[8], 13908], [nodes[9], 82754], [nodes[10], 96891]] 
  nodes[4].neighbors = [[nodes[0], 85216], [nodes[1], 42534], [nodes[2], 98338], [nodes[3], 9833], [nodes[5], 75875], [nodes[6], 40931], [nodes[7], 78157], [nodes[8], 49145], [nodes[9], 86939], [nodes[10], 46301]]
  nodes[5].neighbors = [[nodes[0], 32174], [nodes[1], 58945], [nodes[2], 5515], [nodes[3], 72460], [nodes[4], 75875], [nodes[6], 11408], [nodes[7], 42879], [nodes[8], 56996], [nodes[9], 28658], [nodes[10], 14338]]
  nodes[6].neighbors = [[nodes[0], 57615], [nodes[1], 24432], [nodes[2], 54577], [nodes[3], 43420], [nodes[4], 40931], [nodes[5], 11408], [nodes[7], 85973], [nodes[8], 18979], [nodes[9], 18117], [nodes[10], 45064]]
  nodes[7].neighbors = [[nodes[0], 60695], [nodes[1], 52125], [nodes[2], 53654], [nodes[3], 99825], [nodes[4], 78157], [nodes[5], 42879], [nodes[6], 85973], [nodes[8], 2274], [nodes[9], 62211], [nodes[10], 55519]]
  nodes[8].neighbors = [[nodes[0], 43643], [nodes[1], 44760], [nodes[2], 14809], [nodes[3], 13908], [nodes[4], 49145], [nodes[5], 56996], [nodes[6], 18979], [nodes[7], 2274], [nodes[9], 41399], [nodes[10], 41591]]
  nodes[9].neighbors = [[nodes[0], 31589], [nodes[1], 16054], [nodes[2], 25204], [nodes[3], 82754], [nodes[4], 86939], [nodes[5], 28658], [nodes[6], 18117], [nodes[7], 62211], [nodes[8], 41399], [nodes[10], 71941]]
  nodes[10].neighbors = [[nodes[0], 93973], [nodes[1], 70244], [nodes[2], 88668], [nodes[3], 96891], [nodes[4], 46301], [nodes[5], 14338], [nodes[6], 45064], [nodes[7], 55519], [nodes[8], 41591], [nodes[9], 71941]]
  puts "graph: #{g.to_s}"
  test(g)
end

def randomTest
  puts "random test"
  test(Graph.newCompleteGraphWithRandomLenghts(50))
end

randomTest