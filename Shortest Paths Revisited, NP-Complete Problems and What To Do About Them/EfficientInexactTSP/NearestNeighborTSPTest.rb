require_relative "../TSP_test_files/TestSuit"
require_relative "./NearestNeighborTSP"

@testSuit = TestSuit.new(Proc.new { |x| NearestNeighborTSP.new(x).nearestNeighborTSP[1] })
@testSuitFirst = TestSuit.new(Proc.new { |x| NearestNeighborTSP.new(x).nearestNeighborTSPFirst[1] })

def runTestFilesFirst
  @testSuitFirst.testFile("tsptest1", 13, "quiz 19.2", nil)
  @testSuitFirst.testFile("tsptest2", 29, "quiz 20.7", nil)
  @testSuitFirst.testFile("tsptest3", 13.30, "", :CARTESIAN)
end

def runTestFilesRandom
  @testSuit.testFile("tsptest1", 13, "quiz 19.2", nil)
  @testSuit.testFile("tsptest2", 24, "quiz 20.7", nil)
  @testSuit.testFile("tsptest3", 13.30, "", :CARTESIAN)
end

runTestFilesFirst
runTestFilesRandom
