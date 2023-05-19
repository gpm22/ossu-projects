require 'benchmark'
require_relative './heap'

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
      puts "Filling node with neighbors #{i}/#{nodes.size}"
      neighbors = nodes.map { |n| [n, rand(0..100_000)] }
      neighbors.delete_at(i)
      nodes[i].neighbors = neighbors
    end
    Graph.new(nodes)
  end

  def getMST_Prim
    # Initialization
    firstNode = @nodes[0]
    visited = {firstNode.value.to_s => firstNode}
    mst = []
    heap = Heap.new

    firstNode.neighbors.each do |neighbor|
        neighbor[0].key = neighbor[1]
        neighbor[0].winner = [firstNode, neighbor[0]]
        heap.insert([neighbor[0].key, neighbor[0]])
    end
    # Main loop
    until heap.empty?
        nextNode = heap.extractMin[1]
        visited[nextNode.value.to_s] = nextNode
        mst.push(nextNode.winner)
        # Update keys to maintain invariant
        nextNode.neighbors.filter{ |pair| !visited.include?(pair[0].value.to_s)}.each do |pair|
            if pair[0].key.nil?
                pair[0].key = pair[1]
                pair[0].winner = [nextNode, pair[0]]
                heap.insert([pair[0].key, pair[0]])
            elsif pair[1] < pair[0].key
                heap.delete(pair[0])
                pair[0].key = pair[1]
                pair[0].winner = [nextNode, pair[0]]
                heap.insert([pair[0].key, pair[0]])
            end
        end
    end

    mst 
  end

  def getMST_Kruskal
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

puts "testing prim's algorithm"
g = getTestGraph

puts "graph: #{g.to_s}"

mst = g.getMST_Prim

puts "result: #{mst.map{|pair| "[#{pair[0].value.to_s}, #{pair[1].value.to_s}]"}.to_s}"