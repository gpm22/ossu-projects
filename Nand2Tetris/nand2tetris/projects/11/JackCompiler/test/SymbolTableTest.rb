require_relative '../src/SymbolTable'
require 'test/unit'
extend Test::Unit::Assertions

def mainTest
    @table = SymbolTable.new
    @table.define("a", "a", :STATIC)
    @table.define("b", "b", :FIELD)
    @table.define("c", "c", :ARG)
    @table.define("d", "d", :VAR)

    assert_equal(@table.varCount(:STATIC), 1, "count of :STATIC")
    assert_equal(@table.varCount(:FIELD), 1, "count of :FIELD")
    assert_equal(@table.varCount(:ARG), 1, "count of :ARG")
    assert_equal(@table.varCount(:VAR), 1, "count of :VAR")

    assert_equal(@table.kindOf("a"), :STATIC, 'kind of "a"')
    assert_equal(@table.kindOf("b"), :FIELD, 'kind of "b"')
    assert_equal(@table.kindOf("c"), :ARG, 'kind of "c"')
    assert_equal(@table.kindOf("d"), :VAR, 'kind of "d"')
    assert_equal(@table.kindOf("e"), :NONE, 'kind of non-existent')

    assert_equal(@table.typeOf("a"), "a", 'type of "a"')
    assert_equal(@table.typeOf("b"), "b", 'type of "b"')
    assert_equal(@table.typeOf("c"), "c", 'type of "c"')
    assert_equal(@table.typeOf("d"), "d", 'type of "d"')    

    assert_equal(@table.indexOf("a"), 0, 'index of "a"')
    assert_equal(@table.indexOf("b"), 0, 'index of "b"')
    assert_equal(@table.indexOf("c"), 0, 'index of "c"')
    assert_equal(@table.indexOf("d"), 0, 'index of "d"')


    @table.define("e", "e", :VAR)

    assert_equal(@table.indexOf("e"), 1, 'index of "e"')
end

mainTest