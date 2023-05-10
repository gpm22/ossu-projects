class SymbolTable

    def initialize 
        @table = getPredefinedTable()
    end

    def addEntry (symbol, address)
        @table[symbol]=address
    end

    def contains(symbol)
        @table.include?(symbol)
    end

    def getAddress(symbol)
        @table[symbol]
    end

    def size
        @table.size
    end

    private

    def getPredefinedTable
        getRSymbols().merge(getWordsSymbols)
    end

    def getRSymbols
        table = {}
        (0..15).each {|n| table["R#{n}"] = n}
        table
    end

    def getWordsSymbols
        {"SP" => 0, "LCL" => 1, "ARG" => 2, "THIS" => 3, 
        "THAT" => 4, "SCREEN" => 16384, "KBD" => 24576}
    end

end