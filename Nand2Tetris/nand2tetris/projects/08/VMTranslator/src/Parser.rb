require_relative './CommandsTable'

class Parser
  def initialize(inputFile)
    @file = File.open(inputFile).each_line
    @currentCommand = ''
    @currentLine = 0
    labelRegex = '([a-zA-Z\_\.\:]+[\w\_\.\:]*)'
    numberRegex = '(\d+)'
    @popRegex = Regexp.new("^pop #{labelRegex} #{numberRegex}$")
    @pushRegex = Regexp.new("^push #{labelRegex} #{numberRegex}$")
    @labelRegex = Regexp.new("^label #{labelRegex}$")
    @gotoRegex = Regexp.new("^goto #{labelRegex}$")
    @ifRegex = Regexp.new("^if\-goto #{labelRegex}$")
    @functionRegex = Regexp.new("^function #{labelRegex} #{numberRegex}$")
    @callRegex = Regexp.new("^call #{labelRegex} #{numberRegex}$")
    @commands = CommandsTable.new
  end

  def hasMoreLines
    @file.peek
    true
  rescue StopIteration
    false
  end

  def advance
    raise 'no more lines to read' unless hasMoreLines

    while true
      begin
        nextLine = @file.next
      rescue StopIteration
        return
      end

      @currentLine += 1
      next if nextLine.gsub(/\s+/, '') == '' || (nextLine[0] == '/' && nextLine[1] == '/')

      @currentCommand = nextLine.split(%r{^*//}, 2).first.strip
      return
    end
  end

  def commandType
    return :C_ARITHMETIC if isCommandArithmeticLogical?
    return :C_PUSH if isCommandPush?
    return :C_POP if isCommandPop?
    return :C_LABEL if isCommandLabel?
    return :C_GOTO if isCommandGoto?
    return :C_IF if isCommandIf?
    return :C_FUNCTION if isCommandFunction?
    return :C_RETURN if isCommandReturn?
    return :C_CALL if isCommandCall?

    raise "wrong command at line #{@currentLine}: #{@currentCommand}"
  end

  def arg1
    raise 'arg1 cannot be called if the current command is C_RETURN type' if isCommandReturn?

    return @currentCommand if isCommandArithmeticLogical?

    return @popRegex.match(@currentCommand)[1] if isCommandPop?

    return @pushRegex.match(@currentCommand)[1] if isCommandPush?

    return @labelRegex.match(@currentCommand)[1] if isCommandLabel?

    return @gotoRegex.match(@currentCommand)[1] if isCommandGoto?

    return @ifRegex.match(@currentCommand)[1] if isCommandIf?

    return @functionRegex.match(@currentCommand)[1] if isCommandFunction?

    return @callRegex.match(@currentCommand)[1] if isCommandCall?

    raise 'arg1 has nothing to return'
  end

  def arg2
    unless canCallArg2?
      raise 'arg2 only can be called if the current command is of types C_PUSH, C_POP, C_FUNCTION, OR C_CALL'
    end

    return @popRegex.match(@currentCommand)[2] if isCommandPop?

    return @pushRegex.match(@currentCommand)[2] if isCommandPush?

    return @functionRegex.match(@currentCommand)[2] if isCommandFunction?

    return @callRegex.match(@currentCommand)[2] if isCommandCall?

    raise 'arg2 has nothing to return'
  end

  private

  def canCallArg2?
    commandType = self.commandType
    %i[C_PUSH C_POP C_FUNCTION C_CALL].include?(commandType)
  end

  def isCommandArithmeticLogical?
    @commands.isArithmeticLogicalCommand?(@currentCommand)
  end

  def isCommandPush?
    @pushRegex.match? @currentCommand
  end

  def isCommandPop?
    @popRegex.match? @currentCommand
  end

  def isCommandLabel?
    @labelRegex.match? @currentCommand
  end

  def isCommandGoto?
    @gotoRegex.match? @currentCommand
  end

  def isCommandIf?
    @ifRegex.match? @currentCommand
  end

  def isCommandFunction?
    @functionRegex.match? @currentCommand
  end

  def isCommandReturn?
    @currentCommand == 'return'
  end

  def isCommandCall?
    @callRegex.match? @currentCommand
  end
end
