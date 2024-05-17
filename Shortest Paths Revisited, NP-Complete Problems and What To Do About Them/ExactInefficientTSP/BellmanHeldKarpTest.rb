STDOUT.sync = true
require_relative "./Graph"
require_relative "./CartesianGraph"
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
  result = getGraphFromFile(file, type).BellmanHeldKarp
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

def testToVerifyPerformance(n, type)
  puts "starting test with #{n} vertices - #{Time.now.strftime("%d/%m/%Y %H:%M")}"
  puts "creating graph with #{n} vertices"
  graph = type == :CARTESIAN ? CartesianGraph.generateGraphWithNVertices(n) : Graph.generateGraphWithNVertices(n)
  puts "running tsp -  #{Time.now.strftime("%d/%m/%Y %H:%M")}"
  time = Benchmark.measure { graph.BellmanHeldKarp }

  puts "for n: #{n} - time: #{time.real}"
end

#testToVerifyPerformance(117_000, :CARTESIAN)
runTestFiles
