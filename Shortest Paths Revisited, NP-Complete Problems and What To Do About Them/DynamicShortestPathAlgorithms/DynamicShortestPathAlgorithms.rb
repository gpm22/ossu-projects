require "date"
require_relative "./Heap"

class Graph
  attr_reader :nodes

  def initialize(nodes)
    @nodes = nodes
    @bellmanFordSubproblemsFirst = nil
    @bellmanFordSubproblemsSecond = nil
    @bellmanFordLastNode = nil
    @floydWarshallSubproblemsFirst = nil
    @floydWarshallSubproblemsSecond = nil
    @floydWarshallLastNode = nil
    self.createReceivingEdges
  end

  def bellmanFord(source)
    @bellmanFordSource = source
    # initialize subproblems
    @bellmanFordSubproblemsFirst = Array.new(@nodes.size) { Float::INFINITY }
    @bellmanFordSubproblemsSecond = Array.new(@nodes.size) { Float::INFINITY }
    #@bellmanFordLastNode = Array.new(@nodes.size)

    # base cases
    @bellmanFordSubproblemsFirst[source.value] = 0

    # systematically solve all subproblems

    (@nodes.size).times do
      stable = true
      @nodes.each do |n|
        case1 = @bellmanFordSubproblemsFirst[n.value]
        cases = @receivingEdges[n.value].map { |n| [@bellmanFordSubproblemsFirst[n[0].value] + n[1], n[0]] }.min { |v1, v2| v1[0] <=> v2[0] }
        case2 = if cases.nil?
            Float::INFINITY
          else
            cases[0]
          end
        @bellmanFordSubproblemsSecond[n.value] = [case1, case2].min

        if @bellmanFordSubproblemsSecond[n.value] != case1
          stable = false
          #@bellmanFordLastNode[n.value] = cases[1]
        end
      end
      return @bellmanFordSubproblemsFirst if stable
      @bellmanFordSubproblemsFirst = @bellmanFordSubproblemsSecond
      @bellmanFordSubproblemsSecond = Array.new(@nodes.size) { Float::INFINITY }
    end
    #@bellmanFordLastNode = nil
    :NEGATIVE_CYCLE
  end

  def reconstructLastBellmanFord
    raise "resconstructLastBellmanFord must be runned after non-negative cycle bellmanFord" if @bellmanFordLastNode.nil?

    paths = Array.new(@nodes.size) { [] }

    @nodes.each do |node|
      currentNode = node
      until currentNode == @bellmanFordSource
        currentNode = @bellmanFordLastNode[currentNode.value]
        paths[node.value].push(currentNode)
      end
    end
    paths
  end

  def floydWarshallOptimized
    puts "verifying if the graph has a negative cycle"
    return :NEGATIVE_CYCLE if self.graphHasNegativeCycle?
    puts "starting floyd-warshall"
    self.floydWarshallBase

    @floydWarshallSubproblemsFirst
  end

  def graphHasNegativeCycle?
    testGraph = self.getTestGraph
    testResult = testGraph.bellmanFord(testGraph.nodes[-1])

    testResult == :NEGATIVE_CYCLE
  end

  def floydWarshall
    self.floydWarshallBase
    puts "floyd-warshall - veryfing if it has a negative cycle"
    @nodes.each do |n|
      if @floydWarshallSubproblemsFirst[n.value][n.value] < 0
        #@floydWarshallLastNode = nil
        return :NEGATIVE_CYCLE
      end
    end

    @floydWarshallSubproblemsFirst
  end

  def resconstructFloydWarshall
    raise "resconstructFloydWarshall must be runned after non-negative cycle resconstructFloydWarshall" if @floydWarshallLastNode.nil?

    paths = Array.new(@nodes.size) { Array.new(@nodes.size) { [] } }
    @nodes.each do |node1|
      @nodes.each do |node|
        currentNode = node
        until currentNode == node1
          currentNode = @floydWarshallLastNode[node1.value][currentNode.value]
          paths[node1.value][node.value].push(currentNode)
        end
      end
    end
    paths
  end

  def allPairsWithBellmanFord
    puts "allPairsWithBellmanFord - initialize subproblems"
    allPairs = Array.new(@nodes.size)

    puts "allPairsWithBellmanFord - calling bellman-ford for each node"
    i = 1
    total = @nodes.size
    @nodes.each do |node|
      if i % 100 == 0
        currentDate = DateTime.now.strftime "%d/%m/%Y %H:%M:%S"
        puts "#{currentDate} -  Node #{i}/#{total}"
      end
      result = self.bellmanFord(node)
      return result if result == :NEGATIVE_CYCLE
      allPairs[node.value] = result
      i += 1
    end

    allPairs
  end

  def dijkstra(source)
    shortest_distance = Array.new(@nodes.size)
    shortest_distance[source.value] = 0

    vertices_to_visit = Heap.new
    vertices_to_visit.heapify(@nodes.map do |n|
      if n == source
        [0, n.value]
      else
        [Float::INFINITY, n.value]
      end
    end)

    visited_vertices = {}

    until vertices_to_visit.empty?
      new_vertice = vertices_to_visit.extractMin
      new_vertice_node = @nodes[new_vertice[1]]
      visited_vertices[new_vertice[1]] = new_vertice_node
      shortest_distance[new_vertice[1]] = new_vertice[0]

      new_vertice_node.neighbors.each do |neighbor|
        next unless vertices_to_visit.include?(neighbor[0].value)

        deleted = vertices_to_visit.delete(neighbor[0].value)
        new_key = [deleted[0], shortest_distance[new_vertice[1]] + neighbor[1]].min
        vertices_to_visit.insert([new_key, neighbor[0].value])
      end
    end

    shortest_distance
  end

  def johnson
    puts "Johson - creating the test graph"
    testGraph = self.getTestGraph

    puts "Johson - running Bellman-Ford on the test graph"
    testResult = testGraph.bellmanFord(testGraph.nodes[-1])

    return :NEGATIVE_CYCLE if testResult == :NEGATIVE_CYCLE

    puts "Johson - changing the edges using the test result"

    @nodes.each do |node|
      node.neighbors = node.neighbors.map { |n| [n[0], n[1] + testResult[node.value] - testResult[n[0].value]] }
    end

    puts "Johnson - initialize subproblems"
    allPairs = Array.new(@nodes.size)

    puts "Johnson - calling dijkstra for each node"
    i = 1
    total = @nodes.size
    @nodes.each do |node|
      if i % 10 == 0
        currentDate = DateTime.now.strftime "%d/%m/%Y %H:%M:%S"
        puts "#{currentDate} -  Node #{i}/#{total}"
      end
      result = self.dijkstra(node)
      allPairs[node.value] = result
      i += 1
    end

    puts "Johson - changing the edges to their original value"
    @nodes.each do |node|
      node.neighbors = node.neighbors.map { |n| [n[0], n[1] - testResult[node.value] + testResult[n[0].value]] }
    end

    allPairs.map.with_index do |n1, i|
      n1.map.with_index do |n2, j|
        n2 - testResult[i] + testResult[j]
      end
    end
  end

  def getShortestShortestPathValue
    puts "getShortestShortestPathValue - creating the test graph"
    testGraph = self.getTestGraph

    puts "getShortestShortestPathValue - running Bellman-Ford on the test graph"
    testResult = testGraph.bellmanFord(testGraph.nodes[-1])

    return :NEGATIVE_CYCLE if testResult == :NEGATIVE_CYCLE

    puts "getShortestShortestPathValue - changing the edges using the test result"

    @nodes.each do |node|
      node.neighbors = node.neighbors.map { |n| [n[0], n[1] + testResult[node.value] - testResult[n[0].value]] }
    end

    shortestShortestPath = Float::INFINITY
    puts "getShortestShortestPathValue - calling dijkstra for each node"
    i = 1
    total = @nodes.size
    @nodes.each do |node|
      if i % 100 == 0
        currentDate = DateTime.now.strftime "%d/%m/%Y %H:%M:%S"
        puts "#{currentDate} -  Node #{i}/#{total} - current result: #{shortestShortestPath}"
      end
      result = self.dijkstra(node).map.with_index { |v, j| v - testResult[node.value] + testResult[j] }.min
      shortestShortestPath = [shortestShortestPath, result].min
      i += 1
    end

    puts "getShortestShortestPathValue - changing the edges to their original value"
    @nodes.each do |node|
      node.neighbors = node.neighbors.map { |n| [n[0], n[1] - testResult[node.value] + testResult[n[0].value]] }
    end

    shortestShortestPath
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

  def getTestGraph
    sourceTestNode = Node.new(@nodes.size)
    testNeighbors = @nodes.map { |n| [n, 0] }
    sourceTestNode.neighbors = testNeighbors
    Graph.new(@nodes + [sourceTestNode])
  end

  def floydWarshallBase
    # initialize subproblems
    puts "floyd-warshall - initialize subproblems"
    @floydWarshallSubproblemsFirst = Array.new(@nodes.size) { Array.new(@nodes.size) { Float::INFINITY } }
    @floydWarshallSubproblemsSecond = Array.new(@nodes.size) { Array.new(@nodes.size) { Float::INFINITY } }
    #@floydWarshallLastNode = Array.new(@nodes.size) { Array.new(@nodes.size) }
    #base cases

    puts "floyd-warshall - base cases"
    @nodes.each do |n|
      @floydWarshallSubproblemsFirst[n.value][n.value] = 0

      n.neighbors.each do |neighbor|
        @floydWarshallSubproblemsFirst[n.value][neighbor[0].value] = neighbor[1]
        #@floydWarshallLastNode[n.value][neighbor[0].value] = n
      end
    end

    #systematically solve all subproblems
    final = @nodes.size - 1
    total = @nodes.size ** 3
    i = 1
    puts "floyd-warshall - solving subproblems"
    (0..final).each do |halfNode|
      (0..final).each do |n1|
        (0..final).each do |n2|
          if i % 500_000_000 == 0
            currentDate = DateTime.now.strftime "%d/%m/%Y %H:%M:%s"
            puts "#{currentDate} -  case #{i}/#{total} -- #{(i * 1.0) / total * 100}"
          end
          case1 = @floydWarshallSubproblemsFirst[n1][n2]
          case2 = @floydWarshallSubproblemsFirst[n1][halfNode] + @floydWarshallSubproblemsFirst[halfNode][n2]

          if case2 < case1
            #@floydWarshallLastNode[n1.value][n2.value] = halfNode
            @floydWarshallSubproblemsSecond[n1][n2] = case2
          else
            @floydWarshallSubproblemsSecond[n1][n2] = case1
          end

          i += 1
        end
      end
      @floydWarshallSubproblemsFirst = @floydWarshallSubproblemsSecond
      @floydWarshallSubproblemsSecond = Array.new(@nodes.size) { Array.new(@nodes.size) { Float::INFINITY } }
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
