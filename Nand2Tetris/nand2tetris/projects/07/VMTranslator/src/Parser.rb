require_relative './CommandsTable'

class Parser
  def initialize(inputFile)
    @file = File.open(inputFile).each_line
    @currentCommand = ''
    @currentLine = 0
    @popRegex = /^pop (\w+) (\d+)$/
    @pushRegex = /^push (\w+) (\d+)$/
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

    raise 'arg1 has nothing to return'
  end

  def arg2
    unless canCallArg2?
      raise 'arg2 only can be called if the current command is of types C_PUSH, C_POP, C_FUNCTION, OR C_CALL'
    end

    return @popRegex.match(@currentCommand)[2] if isCommandPop?

    return @pushRegex.match(@currentCommand)[2] if isCommandPush?

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
    false
  end

  def isCommandGoto?
    false
  end

  def isCommandIf?
    false
  end

  def isCommandFunction?
    false
  end

  def isCommandReturn?
    false
  end

  def isCommandCall?
    false
  end
end
