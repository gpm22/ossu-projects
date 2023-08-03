STDOUT.sync = true

require_relative "./DynamicShortestPathAlgorithms"
require "benchmark"

def getGraphFromFile(filePath)
  puts "getting graph from file: #{filePath}"
  nodes = nil
  File.open(filePath).each_line do |line|
    values = line.split(" ").map(&:to_i)
    if values.size < 3
      nodes = Hash[(values[0]).times.map { |n| [n, Node.new(n)] }]
      next
    end
    firstValue = values[0] - 1
    secondValue = values[1] - 1
    firstNode = nodes[firstValue]
    secondNode = nodes[secondValue]

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

def runAllTestFilesForPathMethod
  currentFolder = File.absolute_path(File.dirname(__FILE__))
  inputPath = currentFolder + "/test_files/input/"
  outputPath = currentFolder + "/test_files/output/"
  files = Dir.entries(inputPath).select { |f| f != "." && f != ".." }

  files.each do |file|
    graph = getGraphFromFile(inputPath + file)
    result = getTheShortestShortestPathMethod(graph)
    expectedResult = File.read(outputPath + file).gsub(/\s+/, "")
    expectedResult = expectedResult == "NULL" ? :NEGATIVE_CYCLE : expectedResult.to_i

    raise "#{file} failed!\n Current result: #{result} different from the expected one: #{expectedResult}" unless result == expectedResult
    puts "\n\n\t#{file} passed!"
  end
end

puts getTheShortestShortestPathMethod(getGraphFromFile("graph1.txt")) #result: NEGATIVE CYCLE, time spent: 8s
puts getTheShortestShortestPathMethod(getGraphFromFile("graph2.txt")) #result: NEGATIVE CYCLE, time spent: 9s
puts getTheShortestShortestPathMethod(getGraphFromFile("graph3.txt")) #result: -19, time spent: 20s
puts getTheShortestShortestPathMethod(getGraphFromFile("graph4.txt")) #result: -6, time spent: 10788s ~3h
