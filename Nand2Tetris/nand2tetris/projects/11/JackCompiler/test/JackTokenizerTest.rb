require_relative '../src/JackTokenizer'
require 'test/unit'
extend Test::Unit::Assertions

def test(filePath, expected, name)
  tokenizer = JackTokenizer.new(filePath)
  tokens = []

  while tokenizer.hasMoreTokens
    tokenizer.advance
    tokenType = tokenizer.tokenType

    if tokenType == :KEYWORD
      token = tokenizer.keyWord
    elsif tokenType == :SYMBOL
      token = tokenizer.symbol
    elsif tokenType == :IDENTIFIER
      token = tokenizer.identifier
    elsif tokenType == :INT_CONST
      token = tokenizer.intVal
    elsif tokenType == :STRING_CONST
      token = tokenizer.stringVal
    end
    tokens.push [token, tokenType]
  end

  assert_equal(expected.to_s, tokens.to_s, name)
end

def squareMainTest
  path = File.expand_path('../Square/Main.jack', File.dirname(__dir__))
  expected = [%i[CLASS KEYWORD], ['Main', :IDENTIFIER], ['{', :SYMBOL], %i[FUNCTION KEYWORD], %i[VOID KEYWORD],
              ['main', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], ['{', :SYMBOL], %i[VAR KEYWORD], ['SquareGame', :IDENTIFIER], ['game', :IDENTIFIER], [';', :SYMBOL], %i[LET KEYWORD], ['game', :IDENTIFIER], ['=', :SYMBOL], ['SquareGame', :IDENTIFIER], ['.', :SYMBOL], ['new', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], [';', :SYMBOL], %i[DO KEYWORD], ['game', :IDENTIFIER], ['.', :SYMBOL], ['run', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], [';', :SYMBOL], %i[DO KEYWORD], ['game', :IDENTIFIER], ['.', :SYMBOL], ['dispose', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], [';', :SYMBOL], %i[RETURN KEYWORD], [';', :SYMBOL], ['}', :SYMBOL], ['}', :SYMBOL]]
  test(path, expected, 'squareMainTest')
end

def squareGameTest
  path = File.expand_path('../Square/SquareGame.jack', File.dirname(__dir__))
  expected = [%i[CLASS KEYWORD], ['SquareGame', :IDENTIFIER], ['{', :SYMBOL], %i[FIELD KEYWORD], ['Square', :IDENTIFIER], ['square', :IDENTIFIER], [';', :SYMBOL], %i[FIELD KEYWORD], %i[INT KEYWORD],
              ['direction', :IDENTIFIER], [';', :SYMBOL], %i[CONSTRUCTOR KEYWORD], ['SquareGame', :IDENTIFIER], ['new', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], ['{', :SYMBOL], %i[LET KEYWORD],
              ['square', :IDENTIFIER], ['=', :SYMBOL], ['Square', :IDENTIFIER], ['.', :SYMBOL], ['new', :IDENTIFIER], ['(', :SYMBOL], [0, :INT_CONST], [',', :SYMBOL], [0, :INT_CONST], [',', :SYMBOL],
              [30, :INT_CONST], [')', :SYMBOL], [';', :SYMBOL], %i[LET KEYWORD], ['direction', :IDENTIFIER], ['=', :SYMBOL], [0, :INT_CONST], [';', :SYMBOL], %i[RETURN KEYWORD], %i[THIS KEYWORD],
              [';', :SYMBOL], ['}', :SYMBOL], %i[METHOD KEYWORD], %i[VOID KEYWORD], ['dispose', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], ['{', :SYMBOL], %i[DO KEYWORD], ['square', :IDENTIFIER],
              ['.', :SYMBOL], ['dispose', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], [';', :SYMBOL], %i[DO KEYWORD], ['Memory', :IDENTIFIER], ['.', :SYMBOL], ['deAlloc', :IDENTIFIER], ['(', :SYMBOL],
              %i[THIS KEYWORD], [')', :SYMBOL], [';', :SYMBOL], %i[RETURN KEYWORD], [';', :SYMBOL], ['}', :SYMBOL], %i[METHOD KEYWORD], %i[VOID KEYWORD], ['moveSquare', :IDENTIFIER], ['(', :SYMBOL],
              [')', :SYMBOL], ['{', :SYMBOL], %i[IF KEYWORD], ['(', :SYMBOL], ['direction', :IDENTIFIER], ['=', :SYMBOL], [1, :INT_CONST], [')', :SYMBOL], ['{', :SYMBOL], %i[DO KEYWORD], ['square', :IDENTIFIER],
              ['.', :SYMBOL], ['moveUp', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], [';', :SYMBOL], ['}', :SYMBOL], %i[IF KEYWORD], ['(', :SYMBOL], ['direction', :IDENTIFIER], ['=', :SYMBOL],
              [2, :INT_CONST], [')', :SYMBOL], ['{', :SYMBOL], %i[DO KEYWORD], ['square', :IDENTIFIER], ['.', :SYMBOL], ['moveDown', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], [';', :SYMBOL],
              ['}', :SYMBOL], %i[IF KEYWORD], ['(', :SYMBOL], ['direction', :IDENTIFIER], ['=', :SYMBOL], [3, :INT_CONST], [')', :SYMBOL], ['{', :SYMBOL], %i[DO KEYWORD], ['square', :IDENTIFIER],
              ['.', :SYMBOL], ['moveLeft', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], [';', :SYMBOL], ['}', :SYMBOL], %i[IF KEYWORD], ['(', :SYMBOL], ['direction', :IDENTIFIER], ['=', :SYMBOL],
              [4, :INT_CONST], [')', :SYMBOL], ['{', :SYMBOL], %i[DO KEYWORD], ['square', :IDENTIFIER], ['.', :SYMBOL], ['moveRight', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], [';', :SYMBOL],
              ['}', :SYMBOL], %i[DO KEYWORD], ['Sys', :IDENTIFIER], ['.', :SYMBOL], ['wait', :IDENTIFIER], ['(', :SYMBOL], [5, :INT_CONST], [')', :SYMBOL], [';', :SYMBOL], %i[RETURN KEYWORD],
              [';', :SYMBOL], ['}', :SYMBOL], %i[METHOD KEYWORD], %i[VOID KEYWORD], ['run', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], ['{', :SYMBOL], %i[VAR KEYWORD], %i[CHAR KEYWORD],
              ['key', :IDENTIFIER], [';', :SYMBOL], %i[VAR KEYWORD], %i[BOOLEAN KEYWORD], ['exit', :IDENTIFIER], [';', :SYMBOL], %i[LET KEYWORD], ['exit', :IDENTIFIER], ['=', :SYMBOL], %i[FALSE KEYWORD],
              [';', :SYMBOL], %i[WHILE KEYWORD], ['(', :SYMBOL], ['~', :SYMBOL], ['exit', :IDENTIFIER], [')', :SYMBOL], ['{', :SYMBOL], %i[WHILE KEYWORD], ['(', :SYMBOL], ['key', :IDENTIFIER],
              ['=', :SYMBOL], [0, :INT_CONST], [')', :SYMBOL], ['{', :SYMBOL], %i[LET KEYWORD], ['key', :IDENTIFIER], ['=', :SYMBOL], ['Keyboard', :IDENTIFIER], ['.', :SYMBOL], ['keyPressed', :IDENTIFIER],
              ['(', :SYMBOL], [')', :SYMBOL], [';', :SYMBOL], %i[DO KEYWORD], ['moveSquare', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], [';', :SYMBOL], ['}', :SYMBOL], %i[IF KEYWORD], ['(', :SYMBOL],
              ['key', :IDENTIFIER], ['=', :SYMBOL], [81, :INT_CONST], [')', :SYMBOL], ['{', :SYMBOL], %i[LET KEYWORD], ['exit', :IDENTIFIER], ['=', :SYMBOL], %i[TRUE KEYWORD], [';', :SYMBOL], ['}', :SYMBOL],
              %i[IF KEYWORD], ['(', :SYMBOL], ['key', :IDENTIFIER], ['=', :SYMBOL], [90, :INT_CONST], [')', :SYMBOL], ['{', :SYMBOL], %i[DO KEYWORD], ['square', :IDENTIFIER], ['.', :SYMBOL],
              ['decSize', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], [';', :SYMBOL], ['}', :SYMBOL], %i[IF KEYWORD], ['(', :SYMBOL], ['key', :IDENTIFIER], ['=', :SYMBOL], [88, :INT_CONST],
              [')', :SYMBOL], ['{', :SYMBOL], %i[DO KEYWORD], ['square', :IDENTIFIER], ['.', :SYMBOL], ['incSize', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], [';', :SYMBOL], ['}', :SYMBOL],
              %i[IF KEYWORD], ['(', :SYMBOL], ['key', :IDENTIFIER], ['=', :SYMBOL], [131, :INT_CONST], [')', :SYMBOL], ['{', :SYMBOL], %i[LET KEYWORD], ['direction', :IDENTIFIER], ['=', :SYMBOL],
              [1, :INT_CONST], [';', :SYMBOL], ['}', :SYMBOL], %i[IF KEYWORD], ['(', :SYMBOL], ['key', :IDENTIFIER], ['=', :SYMBOL], [133, :INT_CONST], [')', :SYMBOL], ['{', :SYMBOL], %i[LET KEYWORD],
              ['direction', :IDENTIFIER], ['=', :SYMBOL], [2, :INT_CONST], [';', :SYMBOL], ['}', :SYMBOL], %i[IF KEYWORD], ['(', :SYMBOL], ['key', :IDENTIFIER], ['=', :SYMBOL], [130, :INT_CONST],
              [')', :SYMBOL], ['{', :SYMBOL], %i[LET KEYWORD], ['direction', :IDENTIFIER], ['=', :SYMBOL], [3, :INT_CONST], [';', :SYMBOL], ['}', :SYMBOL], %i[IF KEYWORD], ['(', :SYMBOL],
              ['key', :IDENTIFIER], ['=', :SYMBOL], [132, :INT_CONST], [')', :SYMBOL], ['{', :SYMBOL], %i[LET KEYWORD], ['direction', :IDENTIFIER], ['=', :SYMBOL], [4, :INT_CONST], [';', :SYMBOL],
              ['}', :SYMBOL], %i[WHILE KEYWORD], ['(', :SYMBOL], ['~', :SYMBOL], ['(', :SYMBOL], ['key', :IDENTIFIER], ['=', :SYMBOL], [0, :INT_CONST], [')', :SYMBOL], [')', :SYMBOL], ['{', :SYMBOL],
              %i[LET KEYWORD], ['key', :IDENTIFIER], ['=', :SYMBOL], ['Keyboard', :IDENTIFIER], ['.', :SYMBOL], ['keyPressed', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], [';', :SYMBOL],
              %i[DO KEYWORD], ['moveSquare', :IDENTIFIER], ['(', :SYMBOL], [')', :SYMBOL], [';', :SYMBOL], ['}', :SYMBOL], ['}', :SYMBOL], %i[RETURN KEYWORD], [';', :SYMBOL], ['}', :SYMBOL],
              ['}', :SYMBOL], ['}', :SYMBOL]]
  test(path, expected, 'squareGameTest')
end

squareMainTest
squareGameTest
