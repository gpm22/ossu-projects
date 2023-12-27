STDOUT.sync = true
require_relative "./Graph"
require_relative "./CartesianGraph"
require "benchmark"
require "test/unit"
extend Test::Unit::Assertions

def getGraphFromFile(file, type)
  currentFolder = File.absolute_path(File.dirname(__FILE__))
  inputPath = currentFolder + "/test_files/#{file}.txt"

  return CartesianGraph.createGraphFromFile(inputPath) if type == :CARTESIAN

  Graph.createGraphFromFile(inputPath)
end

def testFirst(file, expected, name, type)
  result = getGraphFromFile(file, type).nearestNeighborTSPFirst
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
  result = getGraphFromFile(file, type).nearestNeighborTSP
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
  puts "running tsp -  #{Time.now.strftime("%d/%m/%Y %H:%M")}"
  time = Benchmark.measure { graph.nearestNeighborTSPFirst }

  puts "for n: #{n} - time: #{time.real}"
end

testToVerifyPerformance(117_000, :CARTESIAN)
