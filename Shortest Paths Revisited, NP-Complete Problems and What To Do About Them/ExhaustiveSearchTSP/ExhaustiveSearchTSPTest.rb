require_relative "../TSP_test_files/TestSuit"
require_relative "./ExhaustiveSearchTSP"

testSuit = TestSuit.new(Proc.new { |x| ExhaustiveSearchTSP.new(x) })
testSuit.runTestFiles
