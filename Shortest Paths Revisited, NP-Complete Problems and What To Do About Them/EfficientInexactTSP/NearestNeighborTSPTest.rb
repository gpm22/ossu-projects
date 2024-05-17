STDOUT.sync = true
require_relative "../Graphs/Graph"
require_relative "../Graphs/CartesianGraph"
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

def testFirst(file, expected, name, type)
  graph = getGraphFromFile(file, type)
  nhtInstance = NearestNeighborTSP.new(graph)
  result = nhtInstance.nearestNeighborTSPFirst
  puts "#{name} tour: #{result}"
  assert_equal(expected, result[1].round(2), name)

  puts "Test passed! #{name}"
end

def runTestFilesFirst
  testFirst("tsptest1", 13, "quiz 19.2", nil)
  testFirst("tsptest2", 29, "quiz 20.7", nil)
  testFirst("tsptest3", 13.30, "", :CARTESIAN)
end

def testRandom(file, expected, name, type)
  graph = getGraphFromFile(file, type)
  nhtInstance = NearestNeighborTSP.new(graph)
  result = nhtInstance.nearestNeighborTSP
  puts "#{name} tour - best: #{expected} - current: #{result}"

  assert_equal(expected, result[1].round(2), name)
  puts "Test passed! #{name}"
end

def runTestFilesRandom
  testRandom("tsptest1", 13, "quiz 19.2", nil)
  testRandom("tsptest2", 24, "quiz 20.7", nil)
  testRandom("tsptest3", 13.30, "", :CARTESIAN)
end

def testToVerifyPerformance(n, type)
  puts "starting test with #{n} vertices - #{Time.now.strftime("%d/%m/%Y %H:%M")}"
  puts "creating graph with #{n} vertices"
  graph = type == :CARTESIAN ? CartesianGraph.generateGraphWithNVertices(n) : Graph.generateGraphWithNVertices(n)
  nhtInstance = NearestNeighborTSP.new(graph)

  puts "running tsp -  #{Time.now.strftime("%d/%m/%Y %H:%M")}"
  time = Benchmark.measure { nhtInstance.nearestNeighborTSPFirst }

  puts "for n: #{n} - time: #{time.real}"
end

#testToVerifyPerformance(117_000, :CARTESIAN)
runTestFilesFirst
runTestFilesRandom
