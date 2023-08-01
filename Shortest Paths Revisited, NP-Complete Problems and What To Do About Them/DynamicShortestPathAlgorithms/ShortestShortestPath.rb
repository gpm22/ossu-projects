STDOUT.sync = true

require_relative "./DynamicShortestPathAlgorithms"
require "benchmark"

def getGraphFromFile(filePath)
  puts "getting graph from file: #{filePath}"
  nodes = {}
  File.open(filePath).each_line do |line|
    values = line.split(" ").map(&:to_i)
    next if values.size < 3
    firstValue = values[0] - 1
    secondValue = values[1] - 1
    firstNode = nodes[firstValue]
    secondNode = nodes[secondValue]

    if firstNode.nil?
      firstNode = Node.new(firstValue)
      nodes[firstValue] = firstNode
    end

    if secondNode.nil?
      secondNode = Node.new(secondValue)
      nodes[secondValue] = secondNode
    end

    firstNode.addNeighbor([secondNode, values[2]])
  end
  Graph.new(nodes.values)
end

def getTheShortestShortestPath(graph)
  pathsFloydWarshall = nil
  pathsAllPairsBellmanFord = nil

  testAllPairsBellmanFord = Benchmark.measure {
    pathsAllPairsBellmanFord = graph.allPairsWithBellmanFord
  }

  testFloydWarshall = Benchmark.measure {
    pathsFloydWarshall = graph.floydWarshallOptimized
  }

  puts "time spent: floyd-warshall: #{testFloydWarshall.real} - bellman ford: #{testAllPairsBellmanFord.real}"
  resultFloydWarshall = if pathsFloydWarshall == :NEGATIVE_CYCLE
      pathsFloydWarshall
    else
      pathsFloydWarshall.flatten.min
    end

  resultAllPairsBellmanFord = if pathsAllPairsBellmanFord == :NEGATIVE_CYCLE
      pathsAllPairsBellmanFord
    else
      pathsAllPairsBellmanFord.flatten.min
    end

  raise "values are not the same!!!!!!!!!!!!!!!!!!\nFloyd-Warshall: #{resultFloydWarshall} -- Bellman-Ford #{resultAllPairsBellmanFord}" unless resultAllPairsBellmanFord == resultFloydWarshall

  resultFloydWarshall
end

def getTheShortestShortestPathFloydWarshall(graph)
  pathsFloydWarshall = nil

  testFloydWarshall = Benchmark.measure {
    pathsFloydWarshall = graph.floydWarshallOptimized
  }

  puts "time spent: floyd-warshall: #{testFloydWarshall.real}"
  if pathsFloydWarshall == :NEGATIVE_CYCLE
    pathsFloydWarshall
  else
    pathsFloydWarshall.flatten.min
  end
end

#puts getTheShortestShortestPath(getGraphFromFile("test1.txt"))
#puts getTheShortestShortestPath(getGraphFromFile("test2.txt"))
#puts getTheShortestShortestPath(getGraphFromFile("graph1.txt"))
#puts getTheShortestShortestPath(getGraphFromFile("graph2.txt"))
#puts getTheShortestShortestPath(getGraphFromFile("graph3.txt"))
puts getTheShortestShortestPathFloydWarshall(getGraphFromFile("graph4.txt"))
