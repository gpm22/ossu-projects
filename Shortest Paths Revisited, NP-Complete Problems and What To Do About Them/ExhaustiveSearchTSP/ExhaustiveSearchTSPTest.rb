STDOUT.sync = true
require_relative "../Graphs/Graph"
require_relative "../Graphs/CartesianGraph"
require_relative "./ExhaustiveSearchTSP"
require "benchmark"
require "test/unit"
extend Test::Unit::Assertions

def getGraphFromFile(file, type)
  parentFolder = File.expand_path("../.")
  inputPath = parentFolder + "/TSP_test_files/#{file}.txt"

  return CartesianGraph.createGraphFromFile(inputPath) if type == :CARTESIAN

  Graph.createGraphFromFile(inputPath)
end

def testFile(file, expected, name, type)
  graph = getGraphFromFile(file, type)
  tspInstance = ExhaustiveSearchTSP.new(graph)
  result = tspInstance.tsp[2]
  result = result.round(2) if type == :CARTESIAN
  puts "#{name} tour: #{result}"
  assert_equal(expected, result, name)

  puts "Test passed! #{name}"
end

def runTestFiles
  testFile("tsptest1", 13, "quiz 19.2", nil)
  testFile("tsptest2", 23, "quiz 20.7", nil)
  testFile("tsptest3", 4.90, "", :CARTESIAN)
end

def testToVerifyPerformance(n)
  puts "starting test with #{n} vertices - #{Time.now.strftime("%d/%m/%Y %H:%M")}"
  puts "creating graph with #{n} vertices"
  graph = type == :CARTESIAN ? CartesianGraph.generateGraphWithNVertices(n) : Graph.generateGraphWithNVertices(n)
  tspInstance = ExhaustiveSearchTSP.new(graph)
  #timeNaive = Benchmark.measure { graph.tspNaive }
  puts "running tsp"
  timeOptimized = Benchmark.measure { tspInstance.tsp }

  #puts "for n: #{n} - time naive: #{timeNaive.real} - time optimized: #{timeOptimized.real}"
  puts "for n: #{n} - time optimized: #{timeOptimized.real}"
end

#5.times { testToVerifyPerformance(17) }
runTestFiles
