require_relative "../src/JackTokenizer.rb"
require "test/unit"
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
  path = File.expand_path("../Square/Main.Jack", File.dirname(__dir__))
  expected = [[:CLASS, :KEYWORD], ["Main", :IDENTIFIER], ["{", :SYMBOL], [:STATIC, :KEYWORD], [:BOOLEAN, :KEYWORD], ["test", :IDENTIFIER], [";", :SYMBOL], [:FUNCTION, :KEYWORD], [:VOID, :KEYWORD], ["main", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], ["{", :SYMBOL], [:VAR, :KEYWORD], ["SquareGame", :IDENTIFIER], ["game", :IDENTIFIER], [";", :SYMBOL], [:LET, :KEYWORD], ["game", :IDENTIFIER], ["=", :SYMBOL], ["SquareGame", :IDENTIFIER], [".", :SYMBOL], ["new", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], [";", :SYMBOL], [:DO, :KEYWORD], ["game", :IDENTIFIER], [".", :SYMBOL], ["run", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], [";", :SYMBOL], [:DO, :KEYWORD], ["game", :IDENTIFIER], [".", :SYMBOL], ["dispose", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], [";", :SYMBOL], [:RETURN, :KEYWORD], [";", :SYMBOL], ["}", :SYMBOL], [:FUNCTION, :KEYWORD], [:VOID, :KEYWORD], ["more", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], ["{", :SYMBOL], [:VAR, :KEYWORD], [:INT, :KEYWORD], ["i", :IDENTIFIER], [",", :SYMBOL], ["j", :IDENTIFIER], [";", :SYMBOL], [:VAR, :KEYWORD], ["String", :IDENTIFIER], ["s", :IDENTIFIER], [";", :SYMBOL], [:VAR, :KEYWORD], ["Array", :IDENTIFIER], ["a", :IDENTIFIER], [";", :SYMBOL], [:IF, :KEYWORD], ["(", :SYMBOL], [:FALSE, :KEYWORD], [")", :SYMBOL], ["{", :SYMBOL], [:LET, :KEYWORD], ["s", :IDENTIFIER], ["=", :SYMBOL], ["string constant", :STRING_CONST], [";", :SYMBOL], [:LET, :KEYWORD], ["s", :IDENTIFIER], ["=", :SYMBOL], [:NULL, :KEYWORD], [";", :SYMBOL], [:LET, :KEYWORD], ["a", :IDENTIFIER], ["[", :SYMBOL], [1, :INT_CONST], ["]", :SYMBOL], ["=", :SYMBOL], ["a", :IDENTIFIER], ["[", :SYMBOL], [2, :INT_CONST], ["]", :SYMBOL], [";", :SYMBOL], ["}", :SYMBOL], [:ELSE, :KEYWORD], ["{", :SYMBOL], [:LET, :KEYWORD], ["i", :IDENTIFIER], ["=", :SYMBOL], ["i", :IDENTIFIER], ["*", :SYMBOL], ["(", :SYMBOL], ["-", :SYMBOL], ["j", :IDENTIFIER], [")", :SYMBOL], [";", :SYMBOL], [:LET, :KEYWORD], ["j", :IDENTIFIER], ["=", :SYMBOL], ["j", :IDENTIFIER], ["/", :SYMBOL], ["(", :SYMBOL], ["-", :SYMBOL], [2, :INT_CONST], [")", :SYMBOL], [";", :SYMBOL], [:LET, :KEYWORD], ["i", :IDENTIFIER], ["=", :SYMBOL], ["i", :IDENTIFIER], ["|", :SYMBOL], ["j", :IDENTIFIER], [";", :SYMBOL],
              ["}", :SYMBOL], [:RETURN, :KEYWORD], [";", :SYMBOL], ["}", :SYMBOL], ["}", :SYMBOL]]
  test(path, expected, "squareMainTest")
end

def squareGameTest
  path = File.expand_path("../Square/SquareGame.Jack", File.dirname(__dir__))
  expected = [[:CLASS, :KEYWORD], ["SquareGame", :IDENTIFIER], ["{", :SYMBOL], [:FIELD, :KEYWORD], ["Square", :IDENTIFIER], ["square", :IDENTIFIER], [";", :SYMBOL], [:FIELD, :KEYWORD], [:INT, :KEYWORD],
              ["direction", :IDENTIFIER], [";", :SYMBOL], [:CONSTRUCTOR, :KEYWORD], ["SquareGame", :IDENTIFIER], ["new", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], ["{", :SYMBOL], [:LET, :KEYWORD],
              ["square", :IDENTIFIER], ["=", :SYMBOL], ["Square", :IDENTIFIER], [".", :SYMBOL], ["new", :IDENTIFIER], ["(", :SYMBOL], [0, :INT_CONST], [",", :SYMBOL], [0, :INT_CONST], [",", :SYMBOL],
              [30, :INT_CONST], [")", :SYMBOL], [";", :SYMBOL], [:LET, :KEYWORD], ["direction", :IDENTIFIER], ["=", :SYMBOL], [0, :INT_CONST], [";", :SYMBOL], [:RETURN, :KEYWORD], [:THIS, :KEYWORD],
              [";", :SYMBOL], ["}", :SYMBOL], [:METHOD, :KEYWORD], [:VOID, :KEYWORD], ["dispose", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], ["{", :SYMBOL], [:DO, :KEYWORD], ["square", :IDENTIFIER],
              [".", :SYMBOL], ["dispose", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], [";", :SYMBOL], [:DO, :KEYWORD], ["Memory", :IDENTIFIER], [".", :SYMBOL], ["deAlloc", :IDENTIFIER], ["(", :SYMBOL],
              [:THIS, :KEYWORD], [")", :SYMBOL], [";", :SYMBOL], [:RETURN, :KEYWORD], [";", :SYMBOL], ["}", :SYMBOL], [:METHOD, :KEYWORD], [:VOID, :KEYWORD], ["moveSquare", :IDENTIFIER], ["(", :SYMBOL],
              [")", :SYMBOL], ["{", :SYMBOL], [:IF, :KEYWORD], ["(", :SYMBOL], ["direction", :IDENTIFIER], ["=", :SYMBOL], [1, :INT_CONST], [")", :SYMBOL], ["{", :SYMBOL], [:DO, :KEYWORD], ["square", :IDENTIFIER],
              [".", :SYMBOL], ["moveUp", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], [";", :SYMBOL], ["}", :SYMBOL], [:IF, :KEYWORD], ["(", :SYMBOL], ["direction", :IDENTIFIER], ["=", :SYMBOL],
              [2, :INT_CONST], [")", :SYMBOL], ["{", :SYMBOL], [:DO, :KEYWORD], ["square", :IDENTIFIER], [".", :SYMBOL], ["moveDown", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], [";", :SYMBOL],
              ["}", :SYMBOL], [:IF, :KEYWORD], ["(", :SYMBOL], ["direction", :IDENTIFIER], ["=", :SYMBOL], [3, :INT_CONST], [")", :SYMBOL], ["{", :SYMBOL], [:DO, :KEYWORD], ["square", :IDENTIFIER],
              [".", :SYMBOL], ["moveLeft", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], [";", :SYMBOL], ["}", :SYMBOL], [:IF, :KEYWORD], ["(", :SYMBOL], ["direction", :IDENTIFIER], ["=", :SYMBOL],
              [4, :INT_CONST], [")", :SYMBOL], ["{", :SYMBOL], [:DO, :KEYWORD], ["square", :IDENTIFIER], [".", :SYMBOL], ["moveRight", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], [";", :SYMBOL],
              ["}", :SYMBOL], [:DO, :KEYWORD], ["Sys", :IDENTIFIER], [".", :SYMBOL], ["wait", :IDENTIFIER], ["(", :SYMBOL], [5, :INT_CONST], [")", :SYMBOL], [";", :SYMBOL], [:RETURN, :KEYWORD],
              [";", :SYMBOL], ["}", :SYMBOL], [:METHOD, :KEYWORD], [:VOID, :KEYWORD], ["run", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], ["{", :SYMBOL], [:VAR, :KEYWORD], [:CHAR, :KEYWORD],
              ["key", :IDENTIFIER], [";", :SYMBOL], [:VAR, :KEYWORD], [:BOOLEAN, :KEYWORD], ["exit", :IDENTIFIER], [";", :SYMBOL], [:LET, :KEYWORD], ["exit", :IDENTIFIER], ["=", :SYMBOL], [:FALSE, :KEYWORD],
              [";", :SYMBOL], [:WHILE, :KEYWORD], ["(", :SYMBOL], ["~", :SYMBOL], ["exit", :IDENTIFIER], [")", :SYMBOL], ["{", :SYMBOL], [:WHILE, :KEYWORD], ["(", :SYMBOL], ["key", :IDENTIFIER],
              ["=", :SYMBOL], [0, :INT_CONST], [")", :SYMBOL], ["{", :SYMBOL], [:LET, :KEYWORD], ["key", :IDENTIFIER], ["=", :SYMBOL], ["Keyboard", :IDENTIFIER], [".", :SYMBOL], ["keyPressed", :IDENTIFIER],
              ["(", :SYMBOL], [")", :SYMBOL], [";", :SYMBOL], [:DO, :KEYWORD], ["moveSquare", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], [";", :SYMBOL], ["}", :SYMBOL], [:IF, :KEYWORD], ["(", :SYMBOL],
              ["key", :IDENTIFIER], ["=", :SYMBOL], [81, :INT_CONST], [")", :SYMBOL], ["{", :SYMBOL], [:LET, :KEYWORD], ["exit", :IDENTIFIER], ["=", :SYMBOL], [:TRUE, :KEYWORD], [";", :SYMBOL], ["}", :SYMBOL],
              [:IF, :KEYWORD], ["(", :SYMBOL], ["key", :IDENTIFIER], ["=", :SYMBOL], [90, :INT_CONST], [")", :SYMBOL], ["{", :SYMBOL], [:DO, :KEYWORD], ["square", :IDENTIFIER], [".", :SYMBOL],
              ["decSize", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], [";", :SYMBOL], ["}", :SYMBOL], [:IF, :KEYWORD], ["(", :SYMBOL], ["key", :IDENTIFIER], ["=", :SYMBOL], [88, :INT_CONST],
              [")", :SYMBOL], ["{", :SYMBOL], [:DO, :KEYWORD], ["square", :IDENTIFIER], [".", :SYMBOL], ["incSize", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], [";", :SYMBOL], ["}", :SYMBOL],
              [:IF, :KEYWORD], ["(", :SYMBOL], ["key", :IDENTIFIER], ["=", :SYMBOL], [131, :INT_CONST], [")", :SYMBOL], ["{", :SYMBOL], [:LET, :KEYWORD], ["direction", :IDENTIFIER], ["=", :SYMBOL],
              [1, :INT_CONST], [";", :SYMBOL], ["}", :SYMBOL], [:IF, :KEYWORD], ["(", :SYMBOL], ["key", :IDENTIFIER], ["=", :SYMBOL], [133, :INT_CONST], [")", :SYMBOL], ["{", :SYMBOL], [:LET, :KEYWORD],
              ["direction", :IDENTIFIER], ["=", :SYMBOL], [2, :INT_CONST], [";", :SYMBOL], ["}", :SYMBOL], [:IF, :KEYWORD], ["(", :SYMBOL], ["key", :IDENTIFIER], ["=", :SYMBOL], [130, :INT_CONST],
              [")", :SYMBOL], ["{", :SYMBOL], [:LET, :KEYWORD], ["direction", :IDENTIFIER], ["=", :SYMBOL], [3, :INT_CONST], [";", :SYMBOL], ["}", :SYMBOL], [:IF, :KEYWORD], ["(", :SYMBOL],
              ["key", :IDENTIFIER], ["=", :SYMBOL], [132, :INT_CONST], [")", :SYMBOL], ["{", :SYMBOL], [:LET, :KEYWORD], ["direction", :IDENTIFIER], ["=", :SYMBOL], [4, :INT_CONST], [";", :SYMBOL],
              ["}", :SYMBOL], [:WHILE, :KEYWORD], ["(", :SYMBOL], ["~", :SYMBOL], ["(", :SYMBOL], ["key", :IDENTIFIER], ["=", :SYMBOL], [0, :INT_CONST], [")", :SYMBOL], [")", :SYMBOL], ["{", :SYMBOL],
              [:LET, :KEYWORD], ["key", :IDENTIFIER], ["=", :SYMBOL], ["Keyboard", :IDENTIFIER], [".", :SYMBOL], ["keyPressed", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], [";", :SYMBOL],
              [:DO, :KEYWORD], ["moveSquare", :IDENTIFIER], ["(", :SYMBOL], [")", :SYMBOL], [";", :SYMBOL], ["}", :SYMBOL], ["}", :SYMBOL], [:RETURN, :KEYWORD], [";", :SYMBOL], ["}", :SYMBOL],
              ["}", :SYMBOL], ["}", :SYMBOL]]
  test(path, expected, "squareGameTest")
end

squareMainTest
squareGameTest
