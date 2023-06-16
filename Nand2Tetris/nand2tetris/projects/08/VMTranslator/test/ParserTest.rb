require_relative '../src/Parser'

def stackTestTest
    file = File.expand_path('../../../StackArithmetic/StackTest/StackTest.vm', __FILE__)
    parser = Parser.new(file)

    puts "hasMoreLines is true?: #{parser.hasMoreLines == true}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 17?: #{parser.arg2 == "17"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 17?: #{parser.arg2 == "17"}"

    parser.advance

    puts "commandType is C_ARITHMETIC?: #{parser.commandType == :C_ARITHMETIC}"
    puts "arg1 is eq?: #{parser.arg1 == "eq"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 17?: #{parser.arg2 == "17"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 16?: #{parser.arg2 == "16"}"

    parser.advance

    puts "commandType is C_ARITHMETIC?: #{parser.commandType == :C_ARITHMETIC}"
    puts "arg1 is eq?: #{parser.arg1 == "eq"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 16?: #{parser.arg2 == "16"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 17?: #{parser.arg2 == "17"}"

    parser.advance

    puts "commandType is C_ARITHMETIC?: #{parser.commandType == :C_ARITHMETIC}"
    puts "arg1 is eq?: #{parser.arg1 == "eq"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 892?: #{parser.arg2 == "892"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 891?: #{parser.arg2 == "891"}"

    parser.advance

    puts "commandType is C_ARITHMETIC?: #{parser.commandType == :C_ARITHMETIC}"
    puts "arg1 is lt?: #{parser.arg1 == "lt"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 891?: #{parser.arg2 == "891"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 892?: #{parser.arg2 == "892"}"

    parser.advance

    puts "commandType is C_ARITHMETIC?: #{parser.commandType == :C_ARITHMETIC}"
    puts "arg1 is lt?: #{parser.arg1 == "lt"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 891?: #{parser.arg2 == "891"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 891?: #{parser.arg2 == "891"}"

    parser.advance

    puts "commandType is C_ARITHMETIC?: #{parser.commandType == :C_ARITHMETIC}"
    puts "arg1 is lt?: #{parser.arg1 == "lt"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 32767?: #{parser.arg2 == "32767"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 32766?: #{parser.arg2 == "32766"}"

    parser.advance

    puts "commandType is C_ARITHMETIC?: #{parser.commandType == :C_ARITHMETIC}"
    puts "arg1 is gt?: #{parser.arg1 == "gt"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 32766?: #{parser.arg2 == "32766"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 32767?: #{parser.arg2 == "32767"}"

    parser.advance

    puts "commandType is C_ARITHMETIC?: #{parser.commandType == :C_ARITHMETIC}"
    puts "arg1 is gt?: #{parser.arg1 == "gt"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 32766?: #{parser.arg2 == "32766"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 32766?: #{parser.arg2 == "32766"}"

    parser.advance

    puts "commandType is C_ARITHMETIC?: #{parser.commandType == :C_ARITHMETIC}"
    puts "arg1 is gt?: #{parser.arg1 == "gt"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 57?: #{parser.arg2 == "57"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 31?: #{parser.arg2 == "31"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 53?: #{parser.arg2 == "53"}"

    parser.advance

    puts "commandType is C_ARITHMETIC?: #{parser.commandType == :C_ARITHMETIC}"
    puts "arg1 is add?: #{parser.arg1 == "add"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 112?: #{parser.arg2 == "112"}"

    parser.advance

    puts "commandType is C_ARITHMETIC?: #{parser.commandType == :C_ARITHMETIC}"
    puts "arg1 is sub?: #{parser.arg1 == "sub"}"    
    
    parser.advance

    puts "commandType is C_ARITHMETIC?: #{parser.commandType == :C_ARITHMETIC}"
    puts "arg1 is neg?: #{parser.arg1 == "neg"}"    
    
    parser.advance

    puts "commandType is C_ARITHMETIC?: #{parser.commandType == :C_ARITHMETIC}"
    puts "arg1 is and?: #{parser.arg1 == "and"}"

    parser.advance

    puts "commandType is C_PUSH?: #{parser.commandType == :C_PUSH}"
    puts "arg1 is constant?: #{parser.arg1 == "constant"}"
    puts "arg2 is 82?: #{parser.arg2 == "82"}"

    parser.advance

    puts "commandType is C_ARITHMETIC?: #{parser.commandType == :C_ARITHMETIC}"
    puts "arg1 is or?: #{parser.arg1 == "or"}"    
    
    parser.advance

    puts "commandType is C_ARITHMETIC?: #{parser.commandType == :C_ARITHMETIC}"
    puts "arg1 is not?: #{parser.arg1 == "not"}"  

    puts "hasMoreLines is false?: #{parser.hasMoreLines == false}"
end

stackTestTest