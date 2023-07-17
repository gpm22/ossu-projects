def needlemanWunschScore(string1, string2, gapPenalty)
    #match penalties are received as a block
    stringSize1 = string1.length
    stringSize2 = string2.length
    subproblems = Array.new(stringSize1 + 1) {Array.new(stringSize2 + 1)}
    #base cases
    (0..stringSize1).each {|i| subproblems[i][0] = i * gapPenalty}
    (0..stringSize2).each {|i| subproblems[0][i] = i * gapPenalty}

    # systematically solve all subproblems

    (1..stringSize1).each do |i|
        (1..stringSize2).each do |j|

            case1 = subproblems[i-1][j-1] + yield(string1[i-1], string2[j-1])
            case2 = subproblems[i-1][j] + gapPenalty
            case3 = subproblems[i][j-1] + gapPenalty
            subproblems[i][j] = [case1, case2, case3].min
        end
    end
    subproblems[stringSize1][stringSize2]
end

def test(string1, string2, gapPenalty, expected, testName = nil)
    testName = "#{string1} - #{string2} - #{gapPenalty} - #{expected}" if testName.nil?

    result = needlemanWunschScore(string1, string2, gapPenalty) {|a, b| yield(a, b)}

    raise "test failed!: #{testName}\nactual result: #{result} different from the expected one: #{expected}" unless result == expected

    puts "test passed!: #{testName}"
end

def tests()
    test('AGTACG','ACATAG', 1, 4, "book test") {|a, b| (a==b)? 0: 2}
    test('ACTAGC','ACATAG', 1, 2, "book test 2") {|a, b| (a==b)? 0: 2}
    test('ACACATGCATCATGACTATGCATGCATGACTGACTGCATGCATGCATCCATCATGCATGCATCGATGCATGCATGACCACCTGTGTGACACATGCATGCGTGTGACATGCGAGACTCACTAGCGATGCATGCATGCATGCATGCATGC',
         'ATGATCATGCATGCATGCATCACACTGTGCATCAGAGAGAGCTCTCAGCAGACCACACACACGTGTGCAGAGAGCATGCATGCATGCATGCATGCATGGTAGCTGCATGCTATGAGCATGCAG',
        4, 224, "website test") {|a, b| (a==b)? 0 : 5}
end

tests