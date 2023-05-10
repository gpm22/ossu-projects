require 'pathname'
require_relative "../src/Parser"

def parserTest
    testAdd
    testMaxL
    testMax
end

def  testAdd
    puts "\ntest parsing the aAdd.asm"
    parser = Parser.new(Pathname.new(File.dirname(__FILE__)).parent().parent().to_s + "/add/Add.asm")

    parser.advance
    puts "is a A-Instruction? #{parser.instructionType == :A_INSTRUCTION}"
    puts "is not a C-Instruction? #{parser.instructionType != :C_INSTRUCTION}"
    puts "line equals to @2? #{parser.symbol.to_i == 2}"
    parser.advance
    puts "is a C-Instruction? #{parser.instructionType == :C_INSTRUCTION}"
    puts "is not a A-Instruction? #{parser.instructionType != :A_INSTRUCTION}"
    puts "line equals to D=A? #{parser.dest == "D" && parser.comp == "A" && parser.jump == ""}"
    parser.advance
    puts "line equals to @3? #{parser.symbol.to_i == 3}"
    parser.advance
    puts "line equals to D=D+A? #{parser.dest == "D" && parser.comp == "D+A" && parser.jump == ""}"
    parser.advance
    puts "line equals to @0? #{parser.symbol.to_i == 0}"
    parser.advance
    puts "line equals to M=D? #{parser.dest == "M" && parser.comp == "D" && parser.jump == ""}"
end

def testMaxL

    puts "\ntesting parsing the MaxL.asm file"
    parser = Parser.new(Pathname.new(File.dirname(__FILE__)).parent().parent().to_s + "/max/MaxL.asm")

    parser.advance
    puts "is a A-Instruction? #{parser.instructionType == :A_INSTRUCTION}"
    puts "is not a C-Instruction? #{parser.instructionType != :C_INSTRUCTION}"
    puts "line equals to @0? #{parser.symbol.to_i == 0}"

    parser.advance
    puts "is a C-Instruction? #{parser.instructionType == :C_INSTRUCTION}"
    puts "is not a A-Instruction? #{parser.instructionType != :A_INSTRUCTION}"
    puts "line equals to D=M? #{parser.dest == "D" && parser.comp == "M" && parser.jump == ""}"

    parser.advance
    puts "is a A-Instruction? #{parser.instructionType == :A_INSTRUCTION}"
    puts "is not a C-Instruction? #{parser.instructionType != :C_INSTRUCTION}"
    puts "line equals to @1? #{parser.symbol.to_i == 1}"

    parser.advance
    puts "is a C-Instruction? #{parser.instructionType == :C_INSTRUCTION}"
    puts "is not a A-Instruction? #{parser.instructionType != :A_INSTRUCTION}"
    puts "line equals to D=M-M? #{parser.dest == "D" && parser.comp == "D-M" && parser.jump == ""}"

    parser.advance
    puts "is a A-Instruction? #{parser.instructionType == :A_INSTRUCTION}"
    puts "is not a C-Instruction? #{parser.instructionType != :C_INSTRUCTION}"
    puts "line equals to @10? #{parser.symbol.to_i == 10}"

    parser.advance
    puts "is a C-Instruction? #{parser.instructionType == :C_INSTRUCTION}"
    puts "is not a A-Instruction? #{parser.instructionType != :A_INSTRUCTION}"
    puts "line equals to D;JGT? #{parser.dest == "" && parser.comp == "D" && parser.jump == "JGT"}"

    parser.advance
    puts "is a A-Instruction? #{parser.instructionType == :A_INSTRUCTION}"
    puts "is not a C-Instruction? #{parser.instructionType != :C_INSTRUCTION}"
    puts "line equals to @1? #{parser.symbol.to_i == 1}"

    parser.advance
    puts "is a C-Instruction? #{parser.instructionType == :C_INSTRUCTION}"
    puts "is not a A-Instruction? #{parser.instructionType != :A_INSTRUCTION}"
    puts "line equals to D=M? #{parser.dest == "D" && parser.comp == "M" && parser.jump == ""}"

    parser.advance
    puts "is a A-Instruction? #{parser.instructionType == :A_INSTRUCTION}"
    puts "is not a C-Instruction? #{parser.instructionType != :C_INSTRUCTION}"
    puts "line equals to @12? #{parser.symbol.to_i == 12}"

    parser.advance
    puts "is a C-Instruction? #{parser.instructionType == :C_INSTRUCTION}"
    puts "is not a A-Instruction? #{parser.instructionType != :A_INSTRUCTION}"
    puts "line equals to 0;JMP? #{parser.dest == "" && parser.comp == "0" && parser.jump == "JMP"}"
end

def testMax
    puts "\ntesting parsing the Max.asm file"
    parser = Parser.new(Pathname.new(File.dirname(__FILE__)).parent().parent().to_s + "/max/Max.asm")

    parser.advance
    puts "is a A-Instruction? #{parser.instructionType == :A_INSTRUCTION}"
    puts "is not a C-Instruction? #{parser.instructionType != :C_INSTRUCTION}"
    puts "line equals to @R0? #{parser.symbol == "R0"}"

    parser.advance
    puts "is a C-Instruction? #{parser.instructionType == :C_INSTRUCTION}"
    puts "is not a A-Instruction? #{parser.instructionType != :A_INSTRUCTION}"
    puts "line equals to D=M? #{parser.dest == "D" && parser.comp == "M" && parser.jump == ""}"

    parser.advance
    puts "is a A-Instruction? #{parser.instructionType == :A_INSTRUCTION}"
    puts "is not a C-Instruction? #{parser.instructionType != :C_INSTRUCTION}"
    puts "line equals to @R1? #{parser.symbol == "R1"}"

    parser.advance
    puts "is a C-Instruction? #{parser.instructionType == :C_INSTRUCTION}"
    puts "is not a A-Instruction? #{parser.instructionType != :A_INSTRUCTION}"
    puts "line equals to D=M-M? #{parser.dest == "D" && parser.comp == "D-M" && parser.jump == ""}"

    parser.advance
    puts "is a A-Instruction? #{parser.instructionType == :A_INSTRUCTION}"
    puts "is not a C-Instruction? #{parser.instructionType != :C_INSTRUCTION}"
    puts "line equals to @OUTPUT_FIRST? #{parser.symbol == "OUTPUT_FIRST"}"

    parser.advance
    puts "is a C-Instruction? #{parser.instructionType == :C_INSTRUCTION}"
    puts "is not a A-Instruction? #{parser.instructionType != :A_INSTRUCTION}"
    puts "line equals to D;JGT? #{parser.dest == "" && parser.comp == "D" && parser.jump == "JGT"}"

    parser.advance
    puts "is a A-Instruction? #{parser.instructionType == :A_INSTRUCTION}"
    puts "is not a C-Instruction? #{parser.instructionType != :C_INSTRUCTION}"
    puts "line equals to @R1? #{parser.symbol == "R1"}"

    parser.advance
    puts "is a C-Instruction? #{parser.instructionType == :C_INSTRUCTION}"
    puts "is not a A-Instruction? #{parser.instructionType != :A_INSTRUCTION}"
    puts "line equals to D=M? #{parser.dest == "D" && parser.comp == "M" && parser.jump == ""}"

    parser.advance
    puts "is a A-Instruction? #{parser.instructionType == :A_INSTRUCTION}"
    puts "is not a C-Instruction? #{parser.instructionType != :C_INSTRUCTION}"
    puts "line equals to @OUTPUT_D? #{parser.symbol == "OUTPUT_D"}"

    parser.advance
    puts "is a C-Instruction? #{parser.instructionType == :C_INSTRUCTION}"
    puts "is not a A-Instruction? #{parser.instructionType != :A_INSTRUCTION}"
    puts "line equals to 0;JMP? #{parser.dest == "" && parser.comp == "0" && parser.jump == "JMP"}"

    parser.advance
    puts "is a L-Instruction? #{parser.instructionType == :L_INSTRUCTION}"
    puts "is not a C-Instruction? #{parser.instructionType != :C_INSTRUCTION}"
    puts "is not a A-Instruction? #{parser.instructionType != :A_INSTRUCTION}"
    puts "line equals to (OUTPUT_FIRST)? #{parser.symbol == "OUTPUT_FIRST"}"



end

parserTest