STDOUT.sync = true
require_relative "./ExhaustiveSearchTSP"
require "benchmark"
require "test/unit"
extend Test::Unit::Assertions

def getGraphFromFile(file)
  currentFolder = File.absolute_path(File.dirname(__FILE__))
  inputPath = currentFolder + "/test_files/#{file}.txt"
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
  graph = generateGraphWithNVertices(n)
  time = Benchmark.measure { graph.tsp }
  puts "for n: #{n} time: #{time.real}"
end

testToVerifyPerformance(11)
testToVerifyPerformance(12)
testToVerifyPerformance(13)
