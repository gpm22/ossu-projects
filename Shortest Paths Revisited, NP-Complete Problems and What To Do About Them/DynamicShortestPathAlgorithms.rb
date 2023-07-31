class Graph
  attr_reader :nodes

  def initialize(nodes)
    @nodes = nodes
    @bellmanFordSubproblems = nil
    @floydWarshallSubproblems = nil
    self.createReceivingEdges
  end

  def bellmanFord(source)
    # initialize subproblems
    @bellmanFordSubproblems = Array.new(2) { Array.new(@nodes.size) { Float::INFINITY } }

    # base cases
    @bellmanFordSubproblems[0][source.value] = 0

    # systematically solve all subproblems

    (@nodes.size).times do
      stable = true
      @nodes.each do |n|
        case1 = @bellmanFordSubproblems[0][n.value]
        case2 = @receivingEdges[n.value].map { |n| @bellmanFordSubproblems[0][n[0].value] + n[1] }.min
        case2 = Float::INFINITY if case2.nil?
        @bellmanFordSubproblems[1][n.value] = [case1, case2].min

        if @bellmanFordSubproblems[1][n.value] != case1
          stable = false
        end
      end
      return @bellmanFordSubproblems[0] if stable
      @bellmanFordSubproblems[0] = @bellmanFordSubproblems[1]
      @bellmanFordSubproblems[1] = Array.new(@nodes.size) { Float::INFINITY }
    end

    return "negative cycle"
  end

  def floydWarshall
  end

  def allPairsWithBellmanFord
  end

  private

  def createReceivingEdges
    @receivingEdges = Hash[@nodes.collect { |n| [n.value, []] }]

    @nodes.each do |n|
      n.neighbors.each do |neighbor|
        @receivingEdges[neighbor[0].value].push([n, neighbor[1]])
      end
    end
  end
end

class Node
  attr_reader :value
  attr_accessor :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
  end

  def ==(other)
    return false unless other.is_a? Node

    @value == other.value
  end

  def to_s
    "node[value: #{@value}, neighbors: #{neighbors.map { |n| "#{n[0].value.to_s} -- #{n[1]}" }}]"
  end

  def addNeighbor(neighbor)
    self.validateNeighbor(neighbor)
    @neighbors.push(neighbor)
  end

  def addNeighbors(neighbors)
    neighbors.each { |n| self.validateNeighbor(n) }
    @neighbors.concat(neighbors)
  end

  private

  def validateNeighbor(neighbor)
    raise "neighbor must be an array and not #{neighbor.class.name}" unless neighbor.is_a? Array
    raise "neighbor first element must be a Node! But it is #{neighbor[0].class.name}" unless neighbor[0].is_a? Node
    raise "neighbor second element must be a Integer and not #{neighbor[1].class.name}" unless neighbor[1].is_a? Integer
  end
end
