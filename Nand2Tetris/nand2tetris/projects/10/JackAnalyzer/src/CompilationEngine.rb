class CompilationEngine
  def initialize(tokenizer, outputFilePath)
    @outputFile = File.new(outputFilePath, "w")
    @outputFile.truncate(0)
    @tokenizer = tokenizer
    @currentToken = tokenizer.advance
    @statementKeyWords = { :LET => -> { self.compileLet },
                          :IF => -> { self.compileIf },
                          :WHILE => -> { self.compileWhile },
                          :DO => -> { self.compileDo },
                          :RETURN => -> { self.compileReturn } }
  end

  def compileClass
    name = "class"
    putsTagStart(name)
    process("class")
    process(@tokenizer.identifier) #className
    process("{")
    self.compileClassVarDecs
    self.compileSubroutines
    process("}")
    putsTagEnd(name)
  end

  def compileClassVarDec
    name = "classVarDec"
    putsTagStart(name)
    if @tokenizer.tokenType == :KEYWORD
      classVarTypeSym = @tokenizer.keyWord

      classVarType = if classVarTypeSym == :STATIC
          "static"
        elsif classVarTypeSym == :FIELD
          "field"
        end
    else
      raise "class var modifier is not static or field, but #{classVarTypeSym.to_s}"
    end
    process(classVarType)
    self.compileVar
    putsTagEnd(name)
  end

  def compileSubroutine
    name = "subroutineDec"
    putsTagStart(name)

    tokenType = @tokenizer.tokenType

    raise "subroutine modifier must be keyword and not #{tokenType}" unless tokenType == :KEYWORD

    modifier = @tokenizer.keyWord
    raise "subroutine modifier must be constructor, function, or method and not #{modifier}" unless [:CONSTRUCTOR, :FUNCTION, :METHOD].contain?(modifier)

    process(modifier)
    process(getVarType(true))
    process(@tokenizer.identifier) #subroutineName
    process("(")
    self.compileParameterList
    process(")")
    self.compileSubroutineBody
    putsTagEnd(name)
  end

  def compileParameterList
    name = "parameterList"
    tokenType = @tokenizer.tokenType
    return if tokenType == :SYMBOL && @tokenizer.symbol == ")"
    putsTagStart(name)
    process(getVarType)
    process(@tokenizer.identifier) #varName

    tokenType = @tokenizer.tokenType
    if tokenType == :SYMBOL and @tokenizer.symbol = ","
      tokenValue = ","
      until tokenValue == ")"
        process(tokenValue)
        tokenType = @tokenizer.tokenType
        if tokenType == :SYMBOL and @tokenizer.symbol = ","
          tokenValue = ","
        elsif tokenType == :IDENTIFIER
          tokenValue = @tokenizer.identifier
        else
          tokenValue = getVarType
        end
      end
    end
    putsTagEnd(name)
  end

  def compileSubroutineBody
    name = "subroutineBody"
    putsTagStart(name)
    process("{")
    self.compileVarDecs
    self.compileStatements
    process("}")
    putsTagEnd(name)
  end

  def compileVarDec
    name = "varDec"
    putsTagStart(name)
    process("var")
    self.compileVar
    putsTagEnd(name)
  end

  def compileStatements
    name = "statements"
    putsTagStart(name)

    predicate = lambda { |currentToken| @statementKeyWords.include? currentToken }
    self.compileVarDecsHelper(predicate) do |currentToken|
      if @statementKeyWords.include? currentToken
        @statementKeyWords[currentToken].call
      else
        raise "Statement is #{@statementKeyWords.keys.to_s} and not #{currentToken}"
      end
    end
    putsTagEnd(name)
  end

  def compileLet
    name = "letStatement"
    putsTagStart(name)
    process("let")
    process(@tokenizer.indentifier) #varName
    tokenType = @tokenizer.tokenType
    if tokenType == :SYMBOL and @tokenizer.symbol == "["
      process("[")
      self.compileExpression
      process("]")
    end
    process("=")
    self.compileExpression
    process(";")
    putsTagEnd(name)
  end

  def compileIf
    name = "ifStatement"
    putsTagStart(name)
    process("if")
    process("(")
    self.compileExpression
    process(")")
    process("{")
    self.compileStatements
    process("}")

    tokenType = @tokenizer.tokenType

    if tokenType == :KEYWORD && @tokenizer.keyWord == :ELSE
      process("else")
      process("{")
      self.compileStatements
      process("}")
    end

    putsTagEnd(name)
  end

  def compileWhile
    name = "whileStatement"
    putsTagStart(name)
    process("while")
    process("(")
    self.compileExpression
    process(")")
    process("{")
    self.compileStatements
    process("}")
    putsTagEnd(name)
  end

  def compileDo
    name = "doStatement"
    putsTagStart(name)
    process("do")
    self.compileTerm
    process(";")
    putsTagEnd(name)
  end

  def compileReturn
    name = "returnStatement"
    putsTagStart(name)
    process("return")
    self.compileExpression unless @tokenizer.tokenType == :SYMBOL && @tokenizer.symbol == ";"
    process(";")
    putsTagEnd(name)
  end

  def compileExpression
    name = "expression"
    putsTagStart(name)
    self.compileTerm
    if 
    putsTagEnd(name)
  end

  def compileTerm
    name = "term"
    putsTagStart(name)

    putsTagEnd(name)
  end

  def compileExpressionList
    name = "expressionList"
    putsTagStart(name)

    putsTagEnd(name)
  end

  private

  def compileVar
    process(getVarType)
    process(@tokenizer.identifier) #varName
    tokenType = @tokenizer.tokenType
    if tokenType == :SYMBOL && @tokenizer.symbol == ","
      currentToken = @tokenizer.symbol

      until currentToken == ";"
        tokenType = @tokenizer.tokenType

        if tokenType == :SYMBOL
          currentToken = @tokenizer.symbol
        elsif tokenType == :IDENTIFIER
          currentToken = @tokenizer.identifier
        else
          raise "var names list must contain symbol or identifier and not #{tokenType}"
        end
        process(currentToken)
      end
    end
    process(";")
  end

  def getVarType(void = false)
    tokenType = @tokenizer.tokenType
    if tokenType == :KEYWORD
      varTypeSym = @tokenizer.keyWord
      varType = if varTypeSym == :INT
          "int"
        elsif varTypeSym == :BOOLEAN
          "boolean"
        elsif varTypeSym == :CHAR
          "char"
        elsif void && varTypeSym == :VOID
          "void"
        else
          raise "ilegal class var type: #{varTypeSym}"
        end
    elsif tokenType == :IDENTIFIER
      varType = @tokenizer.identifier
    else
      raise "var type is not keyword or identifier, but #{tokenType}"
    end
    varType
  end

  def compileVarDecs
    predicate = lambda { |currentToken| currentToken == :VAR }
    self.compileVarDecsHelper(predicate) { |a| self.compileVarDec }
  end

  def compileClassVarDecs
    predicate = lambda { |currentToken| currentToken == :FIELD || currentToken == :STATIC }
    self.compileVarDecsHelper(predicate) { |a| self.compileClassVarDec }
  end

  def compileVarDecsHelper(predicate)
    return if @tokenizer.tokenType != :KEYWORD
    currentToken = @tokenizer.keyWord

    while predicate.call(currentToken)
      yield(currentToken)
      return if @tokenizer.tokenType != :KEYWORD
      currentToken = @tokenizer.keyWord
    end
  end

  def compileSubroutines
    return if @tokenizer.tokenType == :SYMBOL && @tokenizer.symbol == "}"

    self.compileSubroutine

    self.compileSubroutines
  end

  def putsTagStart(tag)
    @outputFile.puts("<#{tag}>")
  end

  def putsTagEnd(tag)
    @outputFile.puts("</#{tag}>")
  end

  def process(str)
    if @currentToken == str
      type = tokenizer.tokenType
      @outputFile.puts("<#{type}> #{str} </#{type}>")
    else
      raise "syntax error"
    end

    @currentToken = tokenizer.advance
  end
end
