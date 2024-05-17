STDOUT.sync = true
require_relative "../Graphs/Graph"
require_relative "../Graphs/CartesianGraph"
require_relative "./TSP2OPT"
require_relative "./NearestNeighborTSP"
require "benchmark"
require "test/unit"
extend Test::Unit::Assertions

def getGraphFromFile(file, type)
  parentFolder = File.expand_path("../.")
  inputPath = parentFolder + "/TSP_test_files/#{file}.txt"

  return CartesianGraph.createGraphFromFile(inputPath) if type == :CARTESIAN

  Graph.createGraphFromFile(inputPath)
end

def testRandom(file, expected, name, type)
  graph = getGraphFromFile(file, type)
  optInstance = TSP2OPT.new(graph)
  result = optInstance.TSP2OPT
  puts "#{name} tour - best: #{expected} - current: #{result}"

  assert_equal(expected, result[1].round(2), name)
  puts "Test passed! #{name}"
end

def runTestFilesRandom
  testRandom("tsptest1", 13, "quiz 19.2", nil)
  testRandom("tsptest2", 23, "quiz 20.7", nil)
  testRandom("tsptest3", 13.30, "", :CARTESIAN)
end

def testToVerifyPerformance(n, type)
  puts "starting test with #{n} vertices - #{Time.now.strftime("%d/%m/%Y %H:%M")}"
  puts "creating graph with #{n} vertices"
  graph = type == :CARTESIAN ? CartesianGraph.generateGraphWithNVertices(n) : Graph.generateGraphWithNVertices(n)
  optInstance = TSP2OPT.new(graph)
  puts "running tsp -  #{Time.now.strftime("%d/%m/%Y %H:%M")}"
  time = Benchmark.measure { optInstance.TSP2OPT }

  puts "for n: #{n} - time: #{time.real}"
end

def comparing2OPTWithNearestNeighbor(n, type)
  puts "starting test with #{n} vertices - #{Time.now.strftime("%d/%m/%Y %H:%M")}"
  puts "creating graph with #{n} vertices"
  graph = type == :CARTESIAN ? CartesianGraph.generateGraphWithNVertices(n) : Graph.generateGraphWithNVertices(n)

  optInstance = TSP2OPT.new(graph)
  nhtInstance = NearestNeighborTSP.new(graph)
  result2OPT = 0
  resultNearest = 0
  puts "running tsp nearest neighbor-  #{Time.now.strftime("%d/%m/%Y %H:%M")}"
  timeNearest = Benchmark.measure { resultNearest = nhtInstance.nearestNeighborTSP }
  puts "running tsp 2opt -  #{Time.now.strftime("%d/%m/%Y %H:%M")}"
  time2OPT = Benchmark.measure { result2OPT = optInstance.TSP2OPT }

  puts "for n: #{n}"
  puts "Nearest - result: #{resultNearest[1]} -  time: #{timeNearest.real}"
  puts "2OPT    - result: #{result2OPT[1]} -  time: #{time2OPT.real}"
end

10.times { comparing2OPTWithNearestNeighbor(500, :CARTESIAN) }
