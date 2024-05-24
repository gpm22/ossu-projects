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
require "benchmark"

@testNumber = 0

def findValueGLPK(result)
    regex = /mip = (.*) >=     tree is empty/
    value = regex.match(result)
    puts "result GLPK: #{value[1].to_f.to_i}"
    value[1].to_f.to_i
end

def findValueSCIP(result)
    regex = /objective value: (.*)/
    value = regex.match(result)
    puts "result SCIP: #{value[1].to_f.to_i}"
    value[1].to_f.to_i
end

def executeSolver(graph, optimized=false, solver, findValue)
    @testNumber += 1
    fileName = "test_#{@testNumber}"
    LPMaker.new(graph, fileName, optimized).createFile
    result = solver.call(fileName)
    File.delete("#{fileName}.lp")
    resultValue = findValue.call(result)
    graph.type == :CARTESIAN ? Math.sqrt(resultValue) : resultValue
end

def executeSCIP(graph, optimized=false)
    solver = Proc.new {|fileName| `scip -f #{fileName}.lp`}
    findValue = Proc.new {|result| findValueSCIP(result)}
    executeSolver(graph, optimized, solver, findValue)
end

def executeGLPK(graph, optimized=false)
    solver = Proc.new {|fileName| `glpsol --lp #{fileName}.lp`}
    findValue = Proc.new {|result| findValueGLPK(result)}
    executeSolver(graph, optimized, solver, findValue)
end

def findPerformance(n, type, optimized=false)
    puts "find performance for #{n} vertices"
    graph = TestSuit.generateGraphWithNVertices(n, type)
    resultGLPK = 1
    resultSCIP = 2
    
    puts "running GLPK"
    timeGLPK = Benchmark.measure { resultGLPK = executeGLPK(graph, optimized)}
    puts "GLPK: #{resultGLPK} - time: #{timeGLPK.real}"
    
    puts "running SCIP"
    timeSCIP = Benchmark.measure { resultSCIP = executeSCIP(graph, optimized) }
    puts "SCIP: #{resultSCIP} - time: #{timeSCIP.real}"
    
    puts "results are the same? #{resultGLPK == resultSCIP}"
    [timeGLPK.real, timeSCIP.real]
end

def findPerformanceSCIPOnly(n, type, option=:BOTH)
    puts "find performance for #{n} vertices"
    graph = TestSuit.generateGraphWithNVertices(n, type)
    resultSCIP = 1
    resultSCIPOpt = 2
    
    if(option == :BOTH or option == :DEFAULT)
        puts "running SCIP"
        timeSCIP = Benchmark.measure { resultSCIP = executeSCIP(graph)}
        puts "SCIP: #{resultSCIP} - time: #{timeSCIP.real}"
    end
    
    if(option == :BOTH or option == :OPTIMIZED)
        puts "running SCIP Optimized"
        timeSCIPOpt = Benchmark.measure { resultSCIPOpt = executeSCIP(graph, true) }
        puts "SCIP Optimized: #{resultSCIPOpt} - time: #{timeSCIPOpt.real}"
    end
    
    puts "results are the same? #{resultSCIPOpt == resultSCIP}" if option == :BOTH
    
    
    if option == :BOTH
        [timeSCIP.real, timeSCIPOpt.real] 
    elsif option == :OPTIMIZED
        [0, timeSCIPOpt.real]
    else
        [timeSCIP.real, 0]
    end
end

def runPerformanceNTimes(n, runNumber)
    times = []
    runNumber.times do
        time = findPerformance(n, nil, true)
        times.push(time)
        break if time[0].real > 60 or time[1].real > 60
    end
    puts "results for #{n} vertices:"
    times.each_with_index do |time, index|
        puts "run number #{index} - GLPK: #{time[0]} - SCIP: #{time[1]}"
    end
    
    avgGLPK = (times.reduce(0) { |sum, time| sum + time[0]})/times.size
    avgSCIP = (times.reduce(0) { |sum, time| sum + time[1]})/times.size
    
    puts "average times - GLPK: #{avgGLPK} - SCIP: #{avgSCIP}"
    
    
end

def runPerformanceSCIPOnlyNTimes(n, runNumber, option=:BOTH)
    times = []
    runNumber.times do
        time = findPerformanceSCIPOnly(n, nil, option)
        times.push(time)
        break if time[0].real > 60 or time[1].real > 60
    end
    puts "results for #{n} vertices:"
    times.each_with_index do |time, index|
        puts "run number #{index} - SCIP: #{time[0]} - SCIP Opt: #{time[1]}"
    end
    
    avgSCIP = (times.reduce(0) { |sum, time| sum + time[0]})/times.size
    avgSCIPOpt = (times.reduce(0) { |sum, time| sum + time[1]})/times.size
    
    puts "average times - SCIP: #{avgSCIP} - SCIP Optimized: #{avgSCIPOpt}"
    
    
end

def runTestFiles
    testSuitGLPK = TestSuit.new(Proc.new { |x| executeGLPK(x)})
    testSuitOptimizedGLPK = TestSuit.new(Proc.new { |x| executeGLPK(x, true)})

    testSuitSCIP = TestSuit.new(Proc.new { |x| executeSCIP(x)})
    testSuitOptimizedSCIP = TestSuit.new(Proc.new { |x| executeSCIP(x, true)})

    testSuitGLPK.runTestFiles
    testSuitOptimizedGLPK.runTestFiles

    testSuitSCIP.runTestFiles
    testSuitOptimizedSCIP.runTestFiles
end

runPerformanceSCIPOnlyNTimes(58, 20, :OPTIMIZED)
