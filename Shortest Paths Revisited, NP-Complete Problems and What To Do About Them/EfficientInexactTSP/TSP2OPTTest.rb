require_relative "../TSP_test_files/TestSuit"
require_relative "./NearestNeighborTSP"
require_relative "./TSP2OPT"

@testSuit = TestSuit.new(Proc.new { |x| TSP2OPT.new(x).TSP2OPT[1] })

def runTestFilesRandom
  @testSuit.testFile("tsptest1", 13, "quiz 19.2", nil)
  @testSuit.testFile("tsptest2", 23, "quiz 20.7", nil)
  @testSuit.testFile("tsptest3", 13.30, "", :CARTESIAN)
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

runTestFilesRandom
10.times { comparing2OPTWithNearestNeighbor(500, :CARTESIAN) }
