class SequenceAlignment
  attr_reader :string1, :string2, :gapPenalty, :matchPenalties

  def initialize(string1, string2, gapPenalty, matchPenalties)
    @string1 = string1
    @string2 = string2
    @gapPenalty = gapPenalty
    @matchPenalties = matchPenalties
  end

  def needlemanWunschScore
    #match penalties are received as a block
    stringSize1 = @string1.length
    stringSize2 = @string2.length
    @subproblems = Array.new(stringSize1 + 1) { Array.new(stringSize2 + 1) }
    #base cases
    (0..stringSize1).each { |i| @subproblems[i][0] = i * @gapPenalty }
    (0..stringSize2).each { |i| @subproblems[0][i] = i * @gapPenalty }

    # systematically solve all subproblems

    (1..stringSize1).each do |i|
      (1..stringSize2).each do |j|
        case1 = @subproblems[i - 1][j - 1] + matchPenalties.call(@string1[i - 1], @string2[j - 1])
        case2 = @subproblems[i - 1][j] + @gapPenalty
        case3 = @subproblems[i][j - 1] + @gapPenalty
        @subproblems[i][j] = [case1, case2, case3].min
      end
    end
    @subproblems[stringSize1][stringSize2]
  end

  def getSequenceAlignment
    self.needlemanWunschScore if @subproblems.nil?
    @string1Aligned = ""
    @string2Aligned = ""
    getSequenceAlignmentHelper(@string1.length, @string2.length)
  end

  private

  def getSequenceAlignmentHelper(i, j)
    return [@string1Aligned, (("-" * j) + @string2Aligned)] if i == 0
    return ["-" * i + @string1Aligned, @string2Aligned] if j == 0
    case1 = @subproblems[i - 1][j - 1] + matchPenalties.call(@string1[i - 1], @string2[j - 1])
    case2 = @subproblems[i - 1][j] + @gapPenalty
    case3 = @subproblems[i][j - 1] + @gapPenalty

    if case1 < case2 && case1 < case3
      @string1Aligned = @string1[i - 1] + @string1Aligned
      @string2Aligned = @string2[j - 1] + @string2Aligned
      getSequenceAlignmentHelper(i - 1, j - 1)
    elsif case2 < case3
      @string1Aligned = @string1[i - 1] + @string1Aligned
      @string2Aligned = "-" + @string2Aligned
      getSequenceAlignmentHelper(i - 1, j)
    else
      @string2Aligned = @string2[j - 1] + @string2Aligned
      @string1Aligned = "-" + @string1Aligned
      getSequenceAlignmentHelper(i, j - 1)
    end
  end
end

def test(string1, string2, gapPenalty, expectedNW, expectedArr, testName = nil)
  testName = "#{string1} - #{string2} - #{gapPenalty} - #{expected}" if testName.nil?
  classNW = SequenceAlignment.new(string1, string2, gapPenalty, ->(a, b) { yield(a, b) })
  resultNW = classNW.needlemanWunschScore

  resultArr = classNW.getSequenceAlignment.to_s
  raise "test failed!: #{testName}\nactual result: #{resultNW} different from the expected one: #{expectedNW}" unless resultNW == expectedNW

  raise "test failed!: #{testName}\nactual result: #{resultArr} different from the expected one: #{expectedArr}" unless resultArr.to_s == expectedArr.to_s
  puts "test passed!: #{testName}"
end

def tests()
  test("AGTACG", "ACATAG", 1, 4, ["AG--TACG", "A-CATA-G"], "book test") { |a, b| (a == b) ? 0 : 2 }
  test("ACTAGC", "ACATAG", 1, 2, ["AC-TAGC", "ACATAG-"], "book test 2") { |a, b| (a == b) ? 0 : 2 }
  test("ACACATGCATCATGACTATGCATGCATGACTGACTGCATGCATGCATCCATCATGCATGCATCGATGCATGCATGACCACCTGTGTGACACATGCATGCGTGTGACATGCGAGACTCACTAGCGATGCATGCATGCATGCATGCATGC",
       "ATGATCATGCATGCATGCATCACACTGTGCATCAGAGAGAGCTCTCAGCAGACCACACACACGTGTGCAGAGAGCATGCATGCATGCATGCATGCATGGTAGCTGCATGCTATGAGCATGCAG",
       4, 224,
       ["ACACATGCATCATGACTATGCATGCATGACTGACTGCATGCATGCATCCATCATGCATGCATCGATGCATGCATGAC-CAC-C-TGTGT-GACA-CATGCATGCGTGTGACATGCGA-GAC-TCACTAGCGATGCATGC-ATGCATGCATGCATGC", "A----TG-ATCATG-C-ATGCATGCATCAC--ACTG--TGCAT-CAGAGAG-A-GC-T-C-TC-A-GCA-G-ACCACACACACGTGTGCAGAGAGCATGCATGCATG---CATGC-ATG-CATGG-TAGC--TGCATGCTATG-A-GCATGCA-G-"],
       "website test") { |a, b| (a == b) ? 0 : 5 }
end

tests
