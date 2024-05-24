STDOUT.sync = true
require_relative "../Graphs/Graph"
require_relative "../Graphs/CartesianGraph"
require "benchmark"
require "test/unit"

class TestSuit
  extend Test::Unit::Assertions

  def initialize(tspInstanceFactory)
    @tspInstanceFactory = tspInstanceFactory
  end

  def self.getGraphFromFile(file, type)
    currentFolder = File.absolute_path(File.dirname(__FILE__))
    inputPath = currentFolder + "/#{file}.txt"

    return CartesianGraph.createGraphFromFile(inputPath) if type == :CARTESIAN

    Graph.createGraphFromFile(inputPath)
  end

  def self.generateGraphWithNVertices(n, type)
    return type == :CARTESIAN ? CartesianGraph.generateGraphWithNVertices(n) : Graph.generateGraphWithNVertices(n)
  end

  def testFile(file, expected, name, type)
    graph = TestSuit.getGraphFromFile(file, type)
    result = @tspInstanceFactory.call(graph)
    result = result.round(2) if type == :CARTESIAN
    puts "#{name} tour: #{result}"
    TestSuit.assert_equal(expected, result, name)

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
    graph = TestSuit.generateGraphWithNVertices(n, type)
    puts "running tsp"
    time = Benchmark.measure { @tspInstanceFactory.call(graph) }

    puts "for n: #{n} - time: #{time.real}"
  end
end
