# the plan is to use SCIP and GLPK
# we create MPS files and call GLPK and SCIP
# than translate back the result

# Formulation from Problem 21.10
# G with vertex V = {1, 2, ..., n} and edge costs c

# Minimize sum from i=1 to n sum from j=1 to n, j != i c_ij*x_ij

# subject to 
#   for every vertex i \sum from j=1 to n, j != i x_ij = 1
#   for every vertex i \sum from j=1 to n, j != i x_ji = 1
#   for all j in V-{1} y_1j = (n-1)x_1j
#   for all j != i y_ij <= (n-1)x_ij
#   for all i in V-{1} sum j =! i y_ji - \sum j != i y_ij = 1
#   IMPROVEMENT for all i != j x_ij + x_ji <= 1

# Bounds
#    x_ij in {0, 1} -> 0 <= x_ij <=1
#    y_ij in {0, 1, ..., n-1} for all i != j -> 0 <= y_ij <= n-1

require_relative "./LPMaker"
require_relative "../TSP_test_files/TestSuit"

@testNumber = 0
def executeGLPK(graph, optimized=false)
    @testNumber += 1
    fileName = "test_#{@testNumber}"
    LPMaker.new(graph, fileName, optimized).createFile
    result = `glpsol --lp #{fileName}.lp`
    File.delete("#{fileName}.lp")
    resultValue = findValueGLPK(result)
    graph.type == :CARTESIAN ? Math.sqrt(resultValue) : resultValue
end

def findValueGLPK(result)
    regex = /mip = (.*) >=     tree is empty/
    value = regex.match(result)
    puts "result: #{value[1].to_f.to_i}"
    value[1].to_f.to_i
end


testSuit = TestSuit.new(Proc.new { |x| executeGLPK(x)})
testSuitOptimized = TestSuit.new(Proc.new { |x| executeGLPK(x, true)})


#testSuitOptimized.testToVerifyPerformance(22, :CARTESIAN)

testSuit.runTestFiles
testSuitOptimized.runTestFiles