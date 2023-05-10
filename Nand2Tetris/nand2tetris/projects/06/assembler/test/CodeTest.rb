require_relative  "../src/Code"

def testCode
    test("A", "", "", "0110000000000")
    test("D|M", "ADM", "JNE", "1010101111101")
    test("-A", "M", "JEQ", "0110011001010")
end

def test(comp, dest, jump, expected)
    actual = Code.comp(comp) + Code.dest(dest) + Code.jump(jump)
    puts "comp: #{comp} - dest:#{dest} - jump: #{jump}\nexpected: #{expected} - actual: #{actual} - correct? #{expected==actual} }"
end

testCode