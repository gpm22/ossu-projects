STDOUT.sync = true

require_relative "./DynamicShortestPathAlgorithms"
require "benchmark"

def getGraphFromFileDijkstra(filePath)
  nodes = {}
  File.open(filePath).each_line do |line|
    values = line.split(" ")
    firstValue = values[0].to_i - 1
    firstNode = nodes[firstValue]
    if firstNode.nil?
      firstNode = Node.new(firstValue)
      nodes[firstValue] = firstNode
    end
    values[1..-1].each do |pair|
      pairValues = pair.split(",").map(&:to_i)
      secondValue = pairValues[0] - 1
      secondNode = nodes[secondValue]

      if secondNode.nil?
        secondNode = Node.new(secondValue)
        nodes[secondValue] = secondNode
      end

      firstNode.addNeighbor([secondNode, pairValues[1]])
    end
  end
  Graph.new(nodes.values.sort { |a, b| a.value <=> b.value })
end

def getGraphFromFile(filePath)
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

    firstNode.addNeighbor([secondNode, values[2].abs])
  end
  Graph.new(nodes.values)
end

def runAllTestFileDijsktra
  currentFolder = File.absolute_path(File.dirname(__FILE__))
  inputPath = currentFolder + "/test_files/dijkstra/input/"
  outputPath = currentFolder + "/test_files/dijkstra/output/"
  files = Dir.entries(inputPath).select { |f| f != "." && f != ".." }

  files.each do |file|
    graph = getGraphFromFileDijkstra(inputPath + file)
    resultDijkstra = graph.dijkstra(graph.nodes[0])
    resultBellmanFord = graph.bellmanFord(graph.nodes[0])
    result = [resultDijkstra[6], resultDijkstra[36], resultDijkstra[58], resultDijkstra[81], resultDijkstra[98], resultDijkstra[114], resultDijkstra[132], resultDijkstra[164], resultDijkstra[187], resultDijkstra[196]]
    result2 = [resultBellmanFord[6], resultBellmanFord[36], resultBellmanFord[58], resultBellmanFord[81], resultBellmanFord[98], resultBellmanFord[114], resultBellmanFord[132], resultBellmanFord[164], resultBellmanFord[187], resultBellmanFord[196]]
    expectedResult = File.read(outputPath + file).gsub(/\s+/, "").split(",").map(&:to_i)
    unless result == expectedResult
      puts "#{file} failed!\nCurrent result:\n#{result.to_s}\nexpected one:\n#{expectedResult.to_s}\nbellman-ford:\n#{result2.to_s}"
      puts "dijkstra == belmanford? #{resultDijkstra == resultBellmanFord}"
    else
      puts "#{file} passed!"
    end
  end
end

def runAllTestFile
  currentFolder = File.absolute_path(File.dirname(__FILE__))
  inputPath = currentFolder + "/test_files/input/"
  files = Dir.entries(inputPath).select { |f| f != "." && f != ".." }

  files.each do |file|
    graph = getGraphFromFile(inputPath + file)
    result = graph.dijkstra(graph.nodes[0])
    expectedResult = graph.bellmanFord(graph.nodes[0])
    unless result == expectedResult
      puts "#{file} failed!\n" # Current result:" #{result.to_s} different from the expected one: #{expectedResult.to_s}"
    else
      puts "#{file} passed!"
    end
  end
end

def testFile(file)
  currentFolder = File.absolute_path(File.dirname(__FILE__))
  inputPath = currentFolder + "/test_files/input/#{file}.txt"
  graph = getGraphFromFile(inputPath)
  result = graph.dijkstra(graph.nodes[0])
  expectedResult = graph.bellmanFord(graph.nodes[0])
  unless result == expectedResult
    puts "#{file} failed!\n Current result: #{result.to_s} different from the expected one: #{expectedResult.to_s}"
  else
    puts "#{file} passed!"
  end
end

def testFileDijkstra(file)
  currentFolder = File.absolute_path(File.dirname(__FILE__))
  inputPath = currentFolder + "/test_files/dijkstra/input/#{file}.txt"
  graph = getGraphFromFileDijkstra(inputPath)
  result = graph.dijkstra(graph.nodes[0])
  expectedResult = graph.bellmanFord(graph.nodes[0])
  unless result == expectedResult
    puts "#{file} failed!\n Current result: #{result.to_s} different from the expected one: #{expectedResult.to_s}"
  else
    puts "#{file} passed!"
  end
end

#testFileDijkstra("random_8_16")
runAllTestFileDijsktra
