class CommandsTable

        @@arithmeticLogicalBinaryCommands = {"add" => nil, "sub" => nil,
                                            "eq" => nil, "gt" => nil, "lt" => nil,
                                            "and" => nil, "or" => nil, }

        @@arithmeticLogicalUnaryCommands = {"neg" => nil, "not" => nil}

    def CommandsTable.isArithmeticLogicalCommand?(command)
        @@arithmeticLogicalUnaryCommands.include?(command) || @@arithmeticLogicalBinaryCommands.include?(command)
    end

    def CommandsTable.isBinaryCommand?(command)
        @@arithmeticLogicalBinaryCommands.include?(command)
    end

    def CommandsTable.isUnaryCommand?(command)
        @@arithmeticLogicalUnaryCommands.include?(command)
    end
end