class CommandsTable
  def initialize
    @i = 0
    @arithmeticLogicalBinaryCommandsNonComparison = { 'add' => 'D=M+D', 'sub' => 'D=M-D',
                                                      'and' => 'D=D&M', 'or' => 'D=D|M' }

    @arithmeticLogicalBinaryCommandsComparison = { 'eq' => 'JEQ', 'gt' => 'JLT', 'lt' => 'JGT' }

    @arithmeticLogicalUnaryCommands = { 'neg' => 'D=-M', 'not' => 'D=!M' }
  end

  def isArithmeticLogicalCommand?(command)
    self.isBinaryCommand?(command) || self.isUnaryCommand?(command)
  end

  def isBinaryCommand?(command)
    @arithmeticLogicalBinaryCommandsComparison.include?(command) || @arithmeticLogicalBinaryCommandsNonComparison.include?(command)
  end

  def isUnaryCommand?(command)
    @arithmeticLogicalUnaryCommands.include?(command)
  end

  def getSymbol(command, address)
    return getBinaryComparisonSymbol(command, address) if @arithmeticLogicalBinaryCommandsComparison.include?(command)
    return getBinaryNonComparisonSymbol(command, address) if @arithmeticLogicalBinaryCommandsNonComparison.include?(command)
    return getUnarySymbol(command, address) if @arithmeticLogicalUnaryCommands.include?(command)
    raise "there is no symbol for command: #{command}"
  end

  private

  def getBinaryNonComparisonSymbol(command, address)
    commandStr = @arithmeticLogicalBinaryCommandsNonComparison[command]
    "#{commandStr}\n#{address}\nM=D"
  end

  def getBinaryComparisonSymbol(command, address)
    @i += 1
    commandStr = @arithmeticLogicalBinaryCommandsComparison[command]
    "D=D-M\n@TRUE.#{@i}\nD;#{commandStr}\n#{address}\nM=0\n@AFTER.#{@i}\n0;JMP\n(TRUE.#{@i})\n#{address}\nM=-1\n(AFTER.#{@i})"
  end

  def getUnarySymbol(command, address)
    commandStr = @arithmeticLogicalUnaryCommands[command]
    "#{commandStr}\n#{address}\nM=D"
  end
end
