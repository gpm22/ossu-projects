require_relative '../src/SymbolTable'

def testSymbolTable
  testPredefinedTable
  testAddingSymbols
end

def testPredefinedTable
  table = SymbolTable.new

  puts "the predefined table has the righ size? #{table.size == 23}"

  symbols = %w[SP LCL ARG THIS THAT SCREEN KBD]
  tableContainsAllSymbols = true
  symbols.each { |symbol| tableContainsAllSymbols = false unless table.contains(symbol) }
  puts "table contains all symbols? #{tableContainsAllSymbols}"

  puts "R0 is 0? #{table.getAddress('R0') == 0}"
  puts "R15 is 15? #{table.getAddress('R15') == 15}"
end

def testAddingSymbols
  table = SymbolTable.new

  table.addEntry('LOOP', 16)
  puts "table contains LOOP? #{table.contains('LOOP')}"
end

testSymbolTable
