require_relative './CommandsTable'
require_relative './AddressesTable'

class CodeWriter
    def initialize(outputFile)
        @file = File.new(outputFile)
        @file.truncate(0)
        @addresses = AddressesTable.new(File.basename(outputFile, ".vm"))
    end

    def writeArithmetic(command)

        if CommandsTable.isBinaryCommand? command
            this.addComment(command)
            this.pop("translator", 0)
            this.pop("translator", 1)
        # computes the stated function on them and put on translator 2
            this.push("translator", 2)

        elsif CommandsTable.isUnaryCommand? command
            this.addComment(command)
            this.pop("translator", 0)
        # computes the stated function on it and put on translator 1
            this.push("translator", 1)
        end

        raise "Command #{command} is invalid"
    end

    def writePushPop(command, segment, index)
        if command == :C_PUSH
            this.addComment( "push #{segment} #{index}" )
            this.push(segment, index)
        elsif command == :C_POP
            this.addComment( "pop #{segment} #{index}" )
            this.pop(segment, index)
        else
            raise "Command #{command} is not pop or push"
        end
    end

    def close
        @file.close
    end

    private

    def addComment(command)
    end

    def applyBinaryCommand(command)
        firstAddress = addresses.getAddress("translator", 0)
        secondAddress = addresses.getAddress("translator", 1)
        thirdAddress = addresses.getAddress("translator", 2)
        commandSymbol = CommandsTable.getSymbol(command)
        str = "#{firstAddress}\nD=M\n#{secondAddress}\n#{commandSymbol}\nM=D"
    end

    def pop(segment, index)
        address = addresses.getAddress(segment, index)
        str = "@SP\nM=M-1\n@SP\nA=M\nD=M\n#{address}\nM=D"
    end

    def push(segment, index)
        address = addresses.getAddress(segment, index)
        str = "#{address}\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1"
    end

    def initStack
        str = "@256\nD=A\n@SP\nM=D"
    end

end