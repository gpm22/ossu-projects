require_relative "../TSP_test_files/TestSuit"
require_relative "./BellmanHeldKarp"

testSuit = TestSuit.new(Proc.new { |x| BellmanHeldKarp.new(x).BellmanHeldKarp })
testSuitOptimized = TestSuit.new(Proc.new { |x| BellmanHeldKarp.new(x).BellmanHeldKarpOptimized })

testSuit.runTestFiles
testSuitOptimized.runTestFiles
