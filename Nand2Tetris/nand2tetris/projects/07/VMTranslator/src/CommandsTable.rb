class CommandsTable

        @@arithmeticLogicalBinaryCommands = {"add" => "D=D+M", "sub" => "D=D-M",
                                            "eq" => nil, "gt" => nil, "lt" => nil,
                                            "and" => "D=D&M", "or" => "D=D|M", }

        @@arithmeticLogicalUnaryCommands = {"neg" => "D=-M", "not" => "D=!M"}

    def CommandsTable.isArithmeticLogicalCommand?(command)
        @@arithmeticLogicalUnaryCommands.include?(command) || @@arithmeticLogicalBinaryCommands.include?(command)
    end

    def CommandsTable.isBinaryCommand?(command)
        @@arithmeticLogicalBinaryCommands.include?(command)
    end

    def CommandsTable.isUnaryCommand?(command)
        @@arithmeticLogicalUnaryCommands.include?(command)
    end

    def CommandsTable.getSymbol(command)
        return @@arithmeticLogicalBinaryCommands[command] if @@arithmeticLogicalBinaryCommands.include?(command)
        return @@arithmeticLogicalUnaryCommands[command] if @@arithmeticLogicalUnaryCommands.include?(command)
        raise "there is no symbol for command: #{command}"
    end
end