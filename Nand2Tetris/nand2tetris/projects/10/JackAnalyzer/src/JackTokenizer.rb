class JackTokenizer
  def initializer(inputFile)
  end

  def hasMoreTokens
  end

  def advance
  end

  def tokenType
  end

  def keyWord
    raise "keyWord method must only be called if tokenType is KEYWORD, and not #{self.tokenType}" unless self.tokenType == :KEYWORD
  end

  def symbol
    raise "symbol method must only be called if tokenType is SYMBOL, and not #{self.tokenType}" unless self.tokenType == :SYMBOL
  end

  def identifier
    raise "identifier method must only be called if tokenType is IDENTIFIER, and not #{self.tokenType}" unless self.tokenType == :IDENTIFIER
  end

  def intVal
    raise "intVal method must only be called if tokenType is INT_CONST, and not #{self.tokenType}" unless self.tokenType == :INT_CONST
  end

  def stringVal
    raise "stringVal method must only be called if tokenType is STRING_CONST, and not #{self.tokenType}" unless self.tokenType == :STRING_CONST
  end
end
