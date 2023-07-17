def calculateMinimumWeightedSearchTime(arr)
    subproblems = Array.new(arr.size+1) {Array.new(arr.size+1)}

    #base cases
    (0..(arr.size)).each {|i| subproblems[i][i] = 0}

    #systematically solve all subproblems (i <= j)
    (0..arr.size-1).each do |s|
        (0..(arr.size-s-1)).each do |i|
            sumOfFrequencies = arr[i..(i+s)].sum

            cases = []
            (i..(i+s)).each{ |r| cases.push(subproblems[i][r] + subproblems[r+1][i+s+1])} if i != (i+s)
            minCases = cases.size > 0 ? cases.min : 0
            subproblems[i][i+s+1] = sumOfFrequencies + minCases
        end
    end

    subproblems[0][arr.size]
end

def test(arr, expected, testName=nil)
    testName = "arr:#{arr.to_s}\nexpected:#{expected}" if testName.nil?
    result = calculateMinimumWeightedSearchTime(arr)

    raise "test failed!: #{testName}\nactual result: #{result} different from the expected one: #{expected}" unless result == expected
    puts "test passed!: #{testName}"
end

def tests
    test([20, 5, 17, 10, 20, 3, 25], 223, "test book")
    test([2,8,2,5,5,2,8,3,6,1,1,6,3,2,6,7,4,63,2,9,10,1,60,5,2,7,34,11,31,76,21,6,8,1,81,37,15,6,8,24,12,18,42,8,51,21,8,6,5,7], 2780, "web site problem")
end

tests