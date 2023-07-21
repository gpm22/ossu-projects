class CompilationEngine
  def initialize(tokenizer, outputFilePath)
    @outputFile = File.new(outputFilePath, "w")
    @outputFile.truncate(0)
    @tokenizer = tokenizer
  end

  def compileClass
  end

  def compileClassVarDec
  end

  def compileSubroutine
  end

  def compileParameterList
  end

  def compileSubroutineBody
  end

  def compileVarDec
  end

  def compileStatements
  end

  def compileLet
  end

  def compileIf
  end

  def compileWhile
  end

  def compileDo
  end

  def compileReturn
  end

  def compileExpression
  end

  def compileTerm
  end

  def compileExpressionList
  end
end
