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
    @operators = { '+' => :ADD, '-' => :SUB, '*' => :MULT,
                   '/' => :DIV, '&' => :AND, '|' => :OR, '<' => :LT,
                   '>' => :GT, '=' => :EQ }
    @keywordConstants = { TRUE: 'true', FALSE: 'false', NULL: 'null', THIS: 'this' }
    @mapSymbolWriter = { STATIC: :STATIC, FIELD: :THIS, VAR: :LOCAL, ARG: :ARGUMENT }
  end

  def compileClass
    process('class')
    @className = @tokenizer.identifier
    process(@className)
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
    @subroutineName = nil
    @subroutineModifier = nil
    @subroutineType = nil
    tokenType = @tokenizer.tokenType

    raise "subroutine modifier must be keyword and not #{tokenType}" unless tokenType == :KEYWORD

    @subroutineModifier = @tokenizer.keyWord
    raise "subroutine modifier must be constructor, function, or method and not #{@subroutineModifier}" unless %i[CONSTRUCTOR
                                                                                                                  FUNCTION METHOD].include?(modifier)

    @subroutineTable.define('this', @className, :ARG) if @subroutineModifier == :METHOD
    process(@subroutineModifier.to_s.downcase)
    @subroutineType = getVarType(true)
    process(@subroutineType)
    @subroutineName = @tokenizer.identifier
    process(@subroutineName)
    process('(')
    compileParameterList
    process(')')
    compileSubroutineBody
  end

  def compileParameterList
    tokenType = @tokenizer.tokenType
    return if tokenType == :SYMBOL && @tokenizer.symbol == ')'

    currentVarType = getVarType
    process(currentVarType)
    varName = @tokenizer.identifier
    process(varName)
    @subroutineTable.define(varName, currentVarType, :ARG)
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
    @writer.writeFunction(@className + '.' + @subroutineName, @subroutineTable.varCount(:VAR))
    if @subroutineModifier == :METHOD
      @writer.writePush(:ARGUMENT, 0)
      @writer.writePop(:POINTER, 0)
    elsif @subroutineModifier == :CONSTRUCTOR
      @writer.writePush(:CONSTANT, @classTable.varCount(:FIELD))
      @writer.writeCall('Memory.alloc', 1)
      @writer.writePop(:POINTER, 0)
    end
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
    varName = @tokenizer.identifier
    process(varName)
    varKind, table = getIndentifierKindAndUsedTable(varName)
    raise "variable #{varName} is not defined!" if varKind == :NONE

    tokenType = @tokenizer.tokenType
    if tokenType == :SYMBOL and @tokenizer.symbol == '['
      process('[')
      compileExpression
      process(']')
    end
    process('=')
    compileExpression
    @writer.writePop(@mapSymbolWriter(varKind), table.indexOf(varName))
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
    @writer.writePush(:POINTER, 0) if @subroutineModifier == :CONSTRUCTOR
    @writer.writerPus(:CONSTANT, 0) if @subroutineType == 'void'
    @writer.writeReturn
    process(';')
  end

  def compileExpression
    compileTerm
    tokenType = @tokenizer.tokenType
    while tokenType == :SYMBOL && @operators.include?(@tokenizer.symbol)
      symbol = @tokenizer.symbol
      process(symbol)
      compileTerm
      @writer.writeArithmetic(@operators[symbol])
      tokenType = @tokenizer.tokenType
    end
  end

  def compileTerm
    tokenType = @tokenizer.tokenType
    if tokenType == :INT_CONST
      compileInteger
    elsif tokenType == :STRING_CONST
      compileString
    elsif tokenType == :KEYWORD && @keywordConstants.include?(@tokenizer.keyWord)
      compileKeyword
    elsif tokenType == :SYMBOL
      compileSymbol
    else
      compileIdentifier
    end
  end

  def compileExpressionList
    tokenType = @tokenizer.tokenType
    return 0 unless isCurrentTokenATerm?(tokenType)

    compileExpression
    tokenType = @tokenizer.tokenType
    return 1 unless tokenType == :SYMBOL

    numberOfExpressions = 1
    currentToken = @tokenizer.symbol
    while currentToken == ','
      process(',')
      compileExpression
      numberOfExpressions += 1
      break unless @tokenizer.tokenType == :SYMBOL

      currentToken = @tokenizer.symbol

    end
    numberOfExpressions
  end

  def close
    @outputFile.close
  end

  private

  def compileInteger
    intValue = @tokenizer.intVal
    process(intValue)
    @writer.writePush(:CONSTANT, intValue)
  end

  def compileString
    stringValue = @tokenizer.stringVal
    process(stringValue)
    @writer.writePush(:CONSTANT, stringValue.size)
    @writer.writeCall('String.new', 1)
    stringValue.chars.each do |c|
      @writer.writePush(:CONSTANT, c.ord)
      @writer.writeCall('String.appendChar', 2)
    end
  end

  def compileKeyword
    keyword = @tokenizer.keyWord
    process(@keywordConstants[keyword])
    case keyword
    when :NULL, :FALSE
      @writer.writePush(:CONSTANT, 0)
    when :TRUE
      @writer.writePush(:CONSTANT, 1)
      @writer.writeArithmetic(:NEG)
    when :THIS
      @writer.writePush(:POINTER, 0)
    else
      raise "keyword #{keyword} does not exist"
    end
  end

  def compileSymbol
    symbol = @tokenizer.symbol
    if symbol == '('
      process('(')
      compileExpression
      process(')')
    elsif ['-', '~'].include?(symbol)
      process(symbol)
      compileTerm
      @writer.writeArithmetic(symbol == '-' ? :NEG : :NOT)
    else
      raise "in a term, the first symbol must be '(', '-', or '~', and not #{symbol}"
    end
  end

  def compileIdentifier
    identifier = @tokenizer.identifier
    process(identifier)
    tokenType = @tokenizer.tokenType
    if tokenType == :SYMBOL
      symbol = @tokenizer.symbol
      if symbol == '['
        compileArrayIdentifier(identifier)
      elsif symbol == '('
        compileFunctionIdentifier(identifier)
      elsif symbol == '.'
        compileMethodIdentifier(identifier)
      end
    else
      compileVariableIdentifier(identifier)
    end
  end

  def compileArrayIdentifier(_identifier)
    process('[')
    compileExpression
    process(']')
  end

  def compileFunctionIdentifier(identifier)
    process('(')
    nVar = compileExpressionList
    process(')')
    @writer.writeCall(@className + '.' + identifier, nVar)
  end

  def compileMethodIdentifier(identifier)
    # TODO: verify constructor case

    identifierKind, table = getIndentifierKindAndUsedTable(identifier)

    if identifierKind == :NONE
      nVar = 0
      type = identifier
    else
      @writer.writePush(@mapSymbolWriter[identifierKind], table.indexOf(identifier))
      type = table.typeOf(identifier)
      nVar = 1
    end

    process('.')
    subroutineName = @tokenizer.identifier
    process(subroutineName)
    process('(')
    nVar += compileExpressionList
    process(')')
    @writer.writeCall(type + '.' + subroutineName, nVar)
  end

  def compileVariableIdentifier(identifier)
    identifierKind, table = getIndentifierKindAndUsedTable(identifier)
    raise "variable #{identifier} is not defined!" if identifierKind == :NONE

    @writer.writePush(@mapSymbolWriter[identifierKind], table.indexOf(identifier))
  end

  def getIndentifierKindAndUsedTable(identifier)
    identifierKindSubroutine = @subroutineTable.kindOf(identifier)
    table = nil
    if identifierKindSubroutine != :NONE
      identifierKind = identifierKindSubroutine
      table = @subroutineTable
    else
      identifierKind = @classTable.kindOf(identifier)
      table = @classTable if identifierKind != :NONE
    end
    [identifierKind, table]
  end

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
    varName = @tokenizer.identifier
    process(varName)
    table.define(varName, varType, kind)
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
    unless @currentToken.to_s == str.to_s
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
