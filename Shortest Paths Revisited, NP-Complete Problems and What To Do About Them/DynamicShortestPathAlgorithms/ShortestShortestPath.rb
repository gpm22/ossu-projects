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
  pathsJohnson = nil

  testAllPairsBellmanFord = Benchmark.measure {
    pathsAllPairsBellmanFord = graph.allPairsWithBellmanFord
  }

  testFloydWarshall = Benchmark.measure {
    pathsFloydWarshall = graph.floydWarshallOptimized
  }

  testJohnson = Benchmark.measure {
    pathsJohnson = graph.johnson
  }

  puts "time spent: floyd-warshall: #{testFloydWarshall.real} - bellman ford: #{testAllPairsBellmanFord.real} - johson: #{testJohnson.real}"
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

  resultJohnson = if pathsJohnson == :NEGATIVE_CYCLE
      pathsJohnson
    else
      pathsJohnson.flatten.min
    end

  raise "values are not the same!!!!!!!!!!!!!!!!!!\nFloyd-Warshall: #{resultFloydWarshall} -- Bellman-Ford #{resultAllPairsBellmanFord} -- Johnson #{resultJohnson}" unless resultAllPairsBellmanFord == resultFloydWarshall && resultFloydWarshall == resultJohnson

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

def getTheShortestShortestPathFloydWarshallAndJohson(graph)
  pathsFloydWarshall = nil
  pathsJohnson = nil

  testFloydWarshall = Benchmark.measure {
    pathsFloydWarshall = graph.floydWarshallOptimized
  }

  testJohnson = Benchmark.measure {
    pathsJohnson = graph.johnson
  }

  puts "time spent: floyd-warshall: #{testFloydWarshall.real}  - johson: #{testJohnson.real}"
  resultFloydWarshall = if pathsFloydWarshall == :NEGATIVE_CYCLE
      pathsFloydWarshall
    else
      pathsFloydWarshall.flatten.min
    end

  resultJohnson = if pathsJohnson == :NEGATIVE_CYCLE
      pathsJohnson
    else
      pathsJohnson.flatten.min
    end

  raise "values are not the same!!!!!!!!!!!!!!!!!!\nFloyd-Warshall: #{resultFloydWarshall} -- Johnson #{resultJohnson}" unless resultFloydWarshall == resultJohnson

  resultFloydWarshall
end

def getTheShortestShortestPathJohson(graph)
  pathsJohnson = nil

  testJohnson = Benchmark.measure {
    pathsJohnson = graph.johnson
  }

  puts "time spent: johson: #{testJohnson.real}"
  if pathsJohnson == :NEGATIVE_CYCLE
    pathsJohnson
  else
    pathsJohnson.flatten.min
  end
end

def getTheShortestShortestPathMethod(graph)
  paths = nil

  test = Benchmark.measure {
    paths = graph.getShortestShortestPathValue
  }

  puts "time spent: #{test.real}"

  paths
end

#puts getTheShortestShortestPath(getGraphFromFile("test1.txt"))
#puts getTheShortestShortestPath(getGraphFromFile("test2.txt"))
#puts getTheShortestShortestPath(getGraphFromFile("graph1.txt"))
#puts getTheShortestShortestPath(getGraphFromFile("graph2.txt"))
#puts getTheShortestShortestPath(getGraphFromFile("graph3.txt"))
#puts getTheShortestShortestPathFloydWarshallAndJohson(getGraphFromFile("graph3.txt"))
#puts getTheShortestShortestPathJohson(getGraphFromFile("graph4.txt"))
#puts getTheShortestShortestPathMethod(getGraphFromFile("test1.txt"))
#puts getTheShortestShortestPathMethod(getGraphFromFile("test2.txt"))
#puts getTheShortestShortestPathMethod(getGraphFromFile("graph1.txt"))
#puts getTheShortestShortestPathMethod(getGraphFromFile("graph2.txt"))
#puts getTheShortestShortestPathMethod(getGraphFromFile("graph3.txt"))
puts getTheShortestShortestPathMethod(getGraphFromFile("graph4.txt"))
