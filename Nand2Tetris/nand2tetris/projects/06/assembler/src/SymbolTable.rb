class SymbolTable
  def initialize
    @table = getPredefinedTable
  end

  def addEntry(symbol, address)
    @table[symbol] = address
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
    getRSymbols.merge(getWordsSymbols)
  end

  def getRSymbols
    table = {}
    16.times { |n| table["R#{n}"] = n }
    table
  end

  def getWordsSymbols
    { 'SP' => 0, 'LCL' => 1, 'ARG' => 2, 'THIS' => 3,
      'THAT' => 4, 'SCREEN' => 16_384, 'KBD' => 24_576 }
  end
end
