require_relative "../TSP_test_files/TestSuit"
require_relative "./BellmanHeldKarp"

testSuit = TestSuit.new(Proc.new { |x| BellmanHeldKarp.new(x).BellmanHeldKarp })
testSuitOptimized = TestSuit.new(Proc.new { |x| BellmanHeldKarp.new(x).BellmanHeldKarpOptimized })

# 18 under a minute
# 23 under an hour
#testSuit.testToVerifyPerformance(23, :CARTESIAN)
#testSuitOptimized.testToVerifyPerformance(23, :CARTESIAN)

testSuit.runTestFiles
testSuitOptimized.runTestFiles
