# create problem instance for test above an hour
require_relative "./LPMaker"
require_relative "../TSP_test_files/TestSuit"

fileName = ARGV[0]
numberOfVertices = Integer(ARGV[1])
type = ARGV[2] == "cartesian" ? :CARTESIAN : nil
optimized = ARGV[3] == "optimized"

graph = TestSuit.generateGraphWithNVertices(numberOfVertices, type)

LPMaker.new(graph, fileName, optimized).createFile

