STDOUT.sync = true
require_relative "./Graph"
require "benchmark"
require "test/unit"
extend Test::Unit::Assertions

def getGraphFromFile(file)
  currentFolder = File.absolute_path(File.dirname(__FILE__))
  inputPath = currentFolder + "/test_files/#{file}.txt"
  Graph.createGraphFromFile(inputPath)
end

def testFirst(file, expected, name)
  result = getGraphFromFile(file).nearestNeighborTSPFirst
  puts "#{name} tour: #{result}"
  assert_equal(expected, result[1], name)

  puts "Test passed! #{name}"
end

def runTestFilesFirst
  testFirst("tsptest1", 13, "quiz 19.2")
  testFirst("tsptest2", 29, "quiz 20.7")
end

def testRandom(file, expected, name)
  result = getGraphFromFile(file).nearestNeighborTSP
  puts "#{name} tour - best: #{expected} - current: #{result}"

  puts "Test passed! #{name}"
end

def runTestFilesRandom
  testRandom("tsptest1", 13, "quiz 19.2")
  testRandom("tsptest2", 23, "quiz 20.7")
end

def generateGraphWithNVertices(n)
  total = n * n
  per1 = total / 100
  current = 1
  graph = Graph.new
  (1..n).each do |i|
    (1..n).each do |j|
      puts " #{Time.now.strftime("%d/%m/%Y %H:%M:%S")} - #{current}/#{total} = #{current / per1} %" if (current % per1) == 0
      current += 1
      next if i == j
      graph.addEdge(i, j, rand(0..100))
    end
  end
  graph
end

def testToVerifyPerformance(n)
  puts "starting test with #{n} vertices - #{Time.now.strftime("%d/%m/%Y %H:%M")}"
  puts "creating graph with #{n} vertices"
  graph = generateGraphWithNVertices(n)
  puts "running tsp -  #{Time.now.strftime("%d/%m/%Y %H:%M")}"
  time = Benchmark.measure { graph.nearestNeighborTSPFirst }

  puts "for n: #{n} - time keys: #{time.real}"
end


runTestFilesRandom