class JackTokenizer
  def initialize(inputFile)
    @file = File.open(inputFile)
    @fileEnum = @file.each_line
    @currentTokens = nil
    @currentLineNumber = 1
    @symbolTable = { '{' => nil, '}' => nil, '(' => nil, ')' => nil,
                     '[' => nil, ']' => nil, '.' => nil, ',' => nil,
                     ';' => nil, '+' => nil, '-' => nil, '*' => nil,
                     '/' => nil, '&' => nil, '|' => nil, '<' => nil,
                     '>' => nil, '=' => nil, '~' => nil }

    @keywordTable = { 'class' => :CLASS, 'constructor' => :CONSTRUCTOR, 'function' => :FUNCTION,
                      'while' => :WHILE, 'field' => :FIELD, 'static' => :STATIC,
                      'var' => :VAR, 'int' => :INT, 'char' => :CHAR, 'void' => :VOID,
                      'true' => :TRUE, 'false' => :FALSE, 'null' => :NULL, 'this' => :THIS,
                      'let' => :LET, 'do' => :DO, 'if' => :IF, 'else' => :ELSE, 'return' => :RETURN,
                      'method' => :METHOD, 'boolean' => :BOOLEAN }
  end

  def hasMoreTokens
    return false if @currentTokens.nil? && !self.tokenizeCurrentLine

    begin
      @currentTokens.peek
      true
    rescue StopIteration
      @currentTokens = nil
      hasMoreTokens
    end
  end

  def advance
    @currentToken = @currentTokens.next
  end

  def tokenType
    return :KEYWORD if isKeyWord
    return :SYMBOL if isSymbol
    return :IDENTIFIER if isIdentifier
    return :INT_CONST if isInteger
    return :STRING_CONST if isString

    raiseException("tokenType not identified for #{@currentToken}")
  end

  def keyWord
    unless tokenType == :KEYWORD
      raiseException("keyWord method must only be called if tokenType is KEYWORD, and not #{tokenType}")
    end
    @keywordTable[@currentToken]
  end

  def symbol
    unless tokenType == :SYMBOL
      raiseException("symbol method must only be called if tokenType is SYMBOL, and not #{tokenType}")
    end
    @currentToken
  end

  def identifier
    unless tokenType == :IDENTIFIER
      raiseException("identifier method must only be called if tokenType is IDENTIFIER, and not #{tokenType}")
    end
    @currentToken
  end

  def intVal
    unless tokenType == :INT_CONST
      raiseException("intVal method must only be called if tokenType is INT_CONST, and not #{tokenType}")
    end
    @currentToken.to_i
  end

  def stringVal
    unless tokenType == :STRING_CONST
      raiseException("stringVal method must only be called if tokenType is STRING_CONST, and not #{tokenType}")
    end
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

  def tokenizeCurrentLine
    return false unless hasMoreLines

    advanceLine
    @currentTokens = @currentLine.split(/([[[:alnum:]]_]+|"[^"]*")*/).reject { |a| a.gsub(/\s+/, '') == '' }.to_enum
    true
  end

  def hasMoreLines
    @fileEnum.peek
    true
  rescue StopIteration
    false
  end

  def advanceLine
    raiseException('no more lines to read') unless hasMoreLines

    while true
      begin
        nextLine = @fileEnum.next
      rescue StopIteration
        return
      end

      @currentLineNumber += 1
      nextLineWithoutSpaces = nextLine.gsub(/\s+/, '')
      if nextLineWithoutSpaces == '' || (nextLineWithoutSpaces[0] == '/' && nextLineWithoutSpaces[1] == '/') || (nextLineWithoutSpaces[0] == '/' && nextLineWithoutSpaces[1] == '*' && nextLineWithoutSpaces[-2] == '*' && nextLineWithoutSpaces[-1] == '/')
        next
      end

      if nextLineWithoutSpaces[0] == '/' && nextLineWithoutSpaces[1] == '*' && nextLineWithoutSpaces[-1] != '/'
        until nextLineWithoutSpaces[-2] == '*' && nextLineWithoutSpaces[-1] == '/'
          @currentLineNumber += 1
          nextLineWithoutSpaces = @fileEnum.next.gsub(/\s+/, '')
        end

        next
      end

      @currentLine = nextLine.split(%r{^*//}, 2).first.strip
      return
    end
  end
end
