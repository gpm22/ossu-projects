class JackTokenizer
  def initialize(inputFile)
    @file = File.open(inputFile)
    @fileEnum = @file.each_line
    @currentTokens = nil
    @currentLineNumber = 1
    @symbolTable = { "{" => "{", "}" => "}", "(" => "(", ")" => ")",
                     "[" => "[", "]" => "]", "." => ".", "," => ",",
                     ";" => ";", "+" => "+", "-" => "-", "*" => "*",
                     "/" => "/", "&" => "&amp;", "|" => "|", "<" => "&lt;",
                     ">" => "&gt;", "=" => "=", "~" => "~" }

    @keywordTable = { "class" => :CLASS, "constructor" => :CONSTRUCTOR, "function" => :FUNCTION,
                      "while" => :WHILE, "field" => :FIELD, "static" => :STATIC,
                      "var" => :VAR, "int" => :INT, "char" => :CHAR, "void" => :VOID,
                      "true" => :TRUE, "false" => :FALSE, "null" => :NULL, "this" => :THIS,
                      "let" => :LET, "do" => :DO, "if" => :IF, "else" => :ELSE, "return" => :RETURN,
                      "method" => :METHOD, "boolean" => :BOOLEAN }
  end

  def hasMoreTokens
    if @currentTokens.nil?
      return false unless self.TokenizeCurrentLike
    end

    begin
      @currentTokens.peek
      true
    rescue StopIteration
      @currentTokens = nil
      self.hasMoreTokens
    end
  end

  def advance
    @currentToken = @currentTokens.next
    @symbolTable.include?(@currentToken) ? @symbolTable[@currentToken] : @currentToken
  end

  def tokenType
    return :KEYWORD if self.isKeyWord
    return :SYMBOL if self.isSymbol
    return :IDENTIFIER if self.isIdentifier
    return :INT_CONST if self.isInteger
    return :STRING_CONST if self.isString
    raiseException("tokenType not identified for #{@currentToken}")
  end

  def keyWord
    raiseException("keyWord method must only be called if tokenType is KEYWORD, and not #{self.tokenType}") unless self.tokenType == :KEYWORD
    @keywordTable[@currentToken]
  end

  def symbol
    raiseException("symbol method must only be called if tokenType is SYMBOL, and not #{self.tokenType}") unless self.tokenType == :SYMBOL
    @symbolTable[@currentToken]
  end

  def identifier
    raiseException("identifier method must only be called if tokenType is IDENTIFIER, and not #{self.tokenType}") unless self.tokenType == :IDENTIFIER
    @currentToken
  end

  def intVal
    raiseException("intVal method must only be called if tokenType is INT_CONST, and not #{self.tokenType}") unless self.tokenType == :INT_CONST
    @currentToken.to_i
  end

  def stringVal
    raiseException("stringVal method must only be called if tokenType is STRING_CONST, and not #{self.tokenType}") unless self.tokenType == :STRING_CONST
    @currentToken[1..-2]
  end

  def close
    @file.close
  end

  private

  def raiseException(message)
    raise "problem at line #{@currentLineNumber}:\n\t" + message
  end

  def isKeyWord
    @keywordTable.include?(@currentToken)
  end

  def isSymbol
    @symbolTable.include?(@currentToken)
  end

  def isIdentifier
    /^[[:alpha:]_]+[[[:alnum:]]_]*/.match @currentToken
  end

  def isInteger
    /^\d+$/.match @currentToken
  end

  def isString
    @currentToken[0] == '"' && @currentToken[-1] = '"'
  end

  def TokenizeCurrentLike
    return false unless self.hasMoreLines

    self.advanceLine
    @currentTokens = @currentLine.split(/([[[:alnum:]]_]+|"[^"]*")*/).reject { |a| a.gsub(/\s+/, "") == "" }.to_enum
    true
  end

  def hasMoreLines
    @fileEnum.peek
    true
  rescue StopIteration
    false
  end

  def advanceLine
    raiseException("no more lines to read") unless hasMoreLines

    while true
      begin
        nextLine = @fileEnum.next
      rescue StopIteration
        return
      end

      @currentLineNumber += 1
      nextLineWithoutSpaces = nextLine.gsub(/\s+/, "")
      next if nextLineWithoutSpaces == "" || (nextLineWithoutSpaces[0] == "/" && nextLineWithoutSpaces[1] == "/") || (nextLineWithoutSpaces[0] == "/" && nextLineWithoutSpaces[1] == "*" && nextLineWithoutSpaces[-2] == "*" && nextLineWithoutSpaces[-1] == "/")

      if nextLineWithoutSpaces[0] == "/" && nextLineWithoutSpaces[1] == "*" && nextLineWithoutSpaces[-1] != "/"
        until nextLineWithoutSpaces[-2] == "*" && nextLineWithoutSpaces[-1] == "/"
          @currentLineNumber += 1
          nextLineWithoutSpaces = @fileEnum.next.gsub(/\s+/, "")
        end

        next
      end

      @currentLine = nextLine.split(%r{^*//}, 2).first.strip
      return
    end
  end
end
