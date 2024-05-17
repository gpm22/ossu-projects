STDOUT.sync = true
require_relative "./ExhaustiveSearchTSP"
require "benchmark"
require "test/unit"
extend Test::Unit::Assertions

def getGraphFromFile(file)
  parentFolder = File.expand_path("../.")
  inputPath = parentFolder + "/TSP_test_files/#{file}.txt"
  graph = Graph.new
  File.open(inputPath).each_line do |line|
    values = line.split(" ").map(&:to_i)
    next if values.size < 3
    graph.addEdge(values[0], values[1], values[2].to_i)
  end
  graph
end

def test(file, expected, name)
  result = getGraphFromFile(file).tsp
  puts "#{name} tour: #{result}"
  assert_equal(expected, result[2], name)

  puts "Test passed! #{name}"
end

def runTestFiles
  test("tsptest1", 13, "quiz 19.2")
  test("tsptest2", 23, "quiz 20.7")
end

def generateGraphWithNVertices(n)
  graph = Graph.new
  (1..n).each do |i|
    (1..n).each do |j|
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
  #timeNaive = Benchmark.measure { graph.tspNaive }
  puts "running tsp"
  timeOptimized = Benchmark.measure { graph.tsp }

  #puts "for n: #{n} - time naive: #{timeNaive.real} - time optimized: #{timeOptimized.real}"
  puts "for n: #{n} - time optimized: #{timeOptimized.real}"
end

#5.times { testToVerifyPerformance(17) }
runTestFiles
