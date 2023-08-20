require_relative './SymbolTable'

class CompilationEngine
  def initialize(tokenizer, writer)
    @writer = writer
    @tokenizer = tokenizer
    @classTable = SymbolTable.new
    @subroutineTable = SymbolTable.new
    @currentToken = @tokenizer.advance if @tokenizer.hasMoreTokens
    @statementKeyWords = { LET: -> { compileLet },
                           IF: -> { compileIf },
                           WHILE: -> { compileWhile },
                           DO: -> { compileDo },
                           RETURN: -> { compileReturn } }
    @operators = { '+' => nil, '-' => nil, '*' => nil,
                   '/' => nil, '&amp;' => nil, '|' => nil, '&lt;' => nil,
                   '&gt;' => nil, '=' => nil }
    @keywordConstants = { TRUE: 'true', FALSE: 'false', NULL: 'null', THIS: 'this' }
  end

  def compileClass
    process('class')
    process(@tokenizer.identifier) # className
    process('{')
    compileClassVarDecs
    compileSubroutines
    process('}')
  end

  def compileClassVarDec
    raise "class var modifier is not static or field, but #{classVarTypeSym}" unless @tokenizer.tokenType == :KEYWORD

    classVarTypeSym = @tokenizer.keyWord

    classVarType = if classVarTypeSym == :STATIC
                     'static'
                   elsif classVarTypeSym == :FIELD
                     'field'
                   end

    process(classVarType)
    compileVar(@classTable, classVarTypeSym)
  end

  def compileSubroutine
    @subroutineTable.reset
    tokenType = @tokenizer.tokenType

    raise "subroutine modifier must be keyword and not #{tokenType}" unless tokenType == :KEYWORD

    modifier = @tokenizer.keyWord
    raise "subroutine modifier must be constructor, function, or method and not #{modifier}" unless %i[CONSTRUCTOR
                                                                                                       FUNCTION METHOD].include?(modifier)

    process(modifier.to_s.downcase)
    process(getVarType(true))
    process(@tokenizer.identifier) # subroutineName
    process('(')
    compileParameterList
    process(')')
    compileSubroutineBody
  end

  def compileParameterList
    tokenType = @tokenizer.tokenType
    return if tokenType == :SYMBOL && @tokenizer.symbol == ')'

    currentVarType = getVarType
    process(varType)
    process(@tokenizer.identifier) # varName

    tokenType = @tokenizer.tokenType
    return unless tokenType == :SYMBOL and @tokenizer.symbol == ','

    tokenValue = ','
    until tokenValue == ')'
      process(tokenValue)
      tokenType = @tokenizer.tokenType
      tokenValue = if tokenType == :SYMBOL and @tokenizer.symbol == ',' || @tokenizer.symbol == ')'
                     @tokenizer.symbol
                   elsif tokenType == :IDENTIFIER
                     @subroutineTable.define(@tokenizer.identifier, currentVarType, :ARG)
                     @tokenizer.identifier
                   else
                     currentVarType = getVarType
                   end
    end
  end

  def compileSubroutineBody
    process('{')
    compileVarDecs
    compileStatements
    process('}')
  end

  def compileVarDec
    process('var')
    compileVar(@subroutineTable)
  end

  def compileStatements
    predicate = ->(currentToken) { @statementKeyWords.include? currentToken }
    compileVarDecsHelper(predicate) do |currentToken|
      unless @statementKeyWords.include? currentToken
        raise "Statement is #{@statementKeyWords.keys} and not #{currentToken}"
      end

      @statementKeyWords[currentToken].call
    end
  end

  def compileLet
    process('let')
    process(@tokenizer.identifier) # varName
    tokenType = @tokenizer.tokenType
    if tokenType == :SYMBOL and @tokenizer.symbol == '['
      process('[')
      compileExpression
      process(']')
    end
    process('=')
    compileExpression
    process(';')
  end

  def compileIf
    process('if')
    process('(')
    compileExpression
    process(')')
    process('{')
    compileStatements
    process('}')

    tokenType = @tokenizer.tokenType

    return unless tokenType == :KEYWORD && @tokenizer.keyWord == :ELSE

    process('else')
    process('{')
    compileStatements
    process('}')
  end

  def compileWhile
    process('while')
    process('(')
    compileExpression
    process(')')
    process('{')
    compileStatements
    process('}')
  end

  def compileDo
    process('do')
    compileSubroutineCall
    process(';')
  end

  def compileReturn
    process('return')
    compileExpression unless @tokenizer.tokenType == :SYMBOL && @tokenizer.symbol == ';'
    process(';')
  end

  def compileExpression
    compileTerm
    tokenType = @tokenizer.tokenType
    while tokenType == :SYMBOL && @operators.include?(@tokenizer.symbol)
      process(@tokenizer.symbol)
      compileTerm
      tokenType = @tokenizer.tokenType
    end
  end

  def compileTerm
    tokenType = @tokenizer.tokenType
    if tokenType == :INT_CONST
      process(@tokenizer.intVal)
    elsif tokenType == :STRING_CONST
      process(@tokenizer.stringVal)
    elsif tokenType == :KEYWORD && @keywordConstants.include?(@tokenizer.keyWord)
      process(@keywordConstants[@tokenizer.keyWord])
    elsif tokenType == :SYMBOL
      if @tokenizer.symbol == '('
        process('(')
        compileExpression
        process(')')
      elsif @tokenizer.symbol == '-' || @tokenizer.symbol == '~'
        process(@tokenizer.symbol)
        compileTerm
      else
        raise "in a term, the first symbol must be '(', '-', or '~', and not #{@tokenizer.symbol}"
      end
    else # tokenType is :IDENTIFIER
      process(@tokenizer.identifier)
      tokenType = @tokenizer.tokenType
      if tokenType == :SYMBOL
        if @tokenizer.symbol == '['
          process('[')
          compileExpression
          process(']')
        elsif @tokenizer.symbol == '('
          process('(')
          compileExpressionList
          process(')')
        elsif @tokenizer.symbol == '.'
          process('.')
          process(@tokenizer.identifier) # subroutine name
          process('(')
          compileExpressionList
          process(')')
        end
      end
    end
  end

  def compileExpressionList
    tokenType = @tokenizer.tokenType
    return unless isCurrentTokenATerm?(tokenType)

    compileExpression
    tokenType = @tokenizer.tokenType
    return unless tokenType == :SYMBOL

    currentToken = @tokenizer.symbol
    while currentToken == ','
      process(',')
      compileExpression
      break unless @tokenizer.tokenType == :SYMBOL

      currentToken = @tokenizer.symbol

    end
  end

  def close
    @outputFile.close
  end

  private

  def compileSubroutineCall
    process(@tokenizer.identifier)
    if @tokenizer.symbol == '('
      process('(')
      compileExpressionList
      process(')')
    elsif @tokenizer.symbol == '.'
      process('.')
      process(@tokenizer.identifier) # subroutine name
      process('(')
      compileExpressionList
      process(')')
    end
  end

  def compileVar(table, modifier = nil)
    kind =  modifier.nil? ? :VAR : modifier
    varType = getVarType
    process(varType)
    process(@tokenizer.identifier) # varName
    tokenType = @tokenizer.tokenType
    if tokenType == :SYMBOL && @tokenizer.symbol == ','
      currentToken = @tokenizer.symbol

      until currentToken == ';'
        tokenType = @tokenizer.tokenType

        if tokenType == :SYMBOL
          currentToken = @tokenizer.symbol
        elsif tokenType == :IDENTIFIER
          currentToken = @tokenizer.identifier

          table.define(currentToken, varType, kind)
        else
          raise "var names list must contain symbol or identifier and not #{tokenType}"
        end
        process(currentToken)
      end
    else
      process(';')
    end
  end

  def getVarType(void = false)
    tokenType = @tokenizer.tokenType
    if tokenType == :KEYWORD
      varTypeSym = @tokenizer.keyWord
      varType = if varTypeSym == :INT
                  'int'
                elsif varTypeSym == :BOOLEAN
                  'boolean'
                elsif varTypeSym == :CHAR
                  'char'
                elsif void && varTypeSym == :VOID
                  'void'
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
    predicate = ->(currentToken) { currentToken == :VAR }
    compileVarDecsHelper(predicate) { |_a| compileVarDec }
  end

  def compileClassVarDecs
    predicate = ->(currentToken) { %i[FIELD STATIC].include?(currentToken) }
    compileVarDecsHelper(predicate) { |_a| compileClassVarDec }
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
    return if @tokenizer.tokenType == :SYMBOL && @tokenizer.symbol == '}'

    compileSubroutine

    compileSubroutines
  end

  def process(str)
    unless @currentToken.to_s == str.to_s || @currentToken.to_s[1..-2] == str.to_s
      raise "syntax error: current token: #{@currentToken} different from str: #{str}"
    end

    @currentToken = @tokenizer.advance if @tokenizer.hasMoreTokens
  end

  def isCurrentTokenATerm?(tokenType)
    tokenType == :INT_CONST ||
      tokenType == :STRING_CONST ||
      tokenType == :IDENTIFIER ||
      (tokenType == :KEYWORD && @keywordConstants.include?(@tokenizer.keyWord)) ||
      (tokenType == :SYMBOL && (@tokenizer.symbol == '(' ||
                                @tokenizer.symbol == '-' ||
                                @tokenizer.symbol == '~'))
  end
end
