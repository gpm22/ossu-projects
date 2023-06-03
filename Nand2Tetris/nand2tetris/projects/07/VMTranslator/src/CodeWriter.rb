require_relative './CommandsTable'
require_relative './AddressesTable'

class CodeWriter
  def initialize(outputFile)
    @file = File.new(outputFile, 'w')
    @file.truncate(0)
    @addresses = AddressesTable.new(File.basename(outputFile, '.vm'))
    @commands = CommandsTable.new
    self.initStack
  end

  def writeArithmetic(command)
    if @commands.isBinaryCommand? command
      self.addComment(command)
      self.pop('translator', 0)
      self.pop('translator', 1)
      self.applyBinaryCommand(command)
      self.push('translator', 2)

    elsif @commands.isUnaryCommand? command
      self.addComment(command)
      self.pop('translator', 0)
      self.applyUnaryCommand(command)
      self.push('translator', 1)
    end
    File.delete(@file)
    raise "Command #{command} is invalid"
  end

  def writePushPop(command, segment, index)
    if command == :C_PUSH
      self.addComment("push #{segment} #{index}")
      self.push(segment, index)
    elsif command == :C_POP
      self.addComment("pop #{segment} #{index}")
      self.pop(segment, index)
    else
      File.delete(@file)
      raise "Command #{command} is not pop or push"
    end
  end

  def close
    self.putFinalInfinityLoop
    @file.close
  end

  private

  def addComment(command)
    str = "\n//#{command}\n"
    @file.puts(str)
  end

  def applyBinaryCommand(command)
    firstAddress = @addresses.getAddress('translator', 0)
    secondAddress = @addresses.getAddress('translator', 1)
    thirdAddress = @addresses.getAddress('translator', 2)
    commandSymbol = @commands.getSymbol(command, thirdAddress)
    str = "#{firstAddress}\nD=M\n#{secondAddress}\n#{commandSymbol}"
    @file.puts(str)
  end

  def applyUnaryCommand(command)
    firstAddress = @addresses.getAddress('translator', 0)
    secondAddress = @addresses.getAddress('translator', 1)
    commandSymbol = @commands.getSymbol(command, secondAddress)
    str = "#{firstAddress}\n#{commandSymbol}"
    @file.puts(str)
  end

  def pop(segment, index)
    address = @addresses.getAddress(segment, index)
    str = "@SP\nM=M-1\n@SP\nA=M\nD=M\n#{address}\nM=D"
    @file.puts(str)
  end

  def push(segment, index)
    address = @addresses.getAddress(segment, index)
    str = "#{address}\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1"
    @file.puts(str)
  end

  def initStack
    self.addComment('Starting stack')
    str = "@256\nD=A\n@SP\nM=D"
    @file.puts(str)
  end

  def putFinalInfinityLoop
    self.addComment('Infinity loop')
    str = "(END)\n@END\n0;JMP"
    @file.puts(str)
  end
end
