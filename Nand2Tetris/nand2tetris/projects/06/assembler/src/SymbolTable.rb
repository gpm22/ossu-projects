class SymbolTable

    def initilize 
        @table = {}
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
end