require_relative './CommandsTable'
require_relative './AddressesTable'

class CodeWriter
  def initialize(outputFile)
    @file = File.new(outputFile, 'w')
    @file.truncate(0)
    @addresses = AddressesTable.new(File.basename(outputFile, '.vm'))
    @commands = CommandsTable.new
    #bootstrap
  end

  def setFileName(fileName)
    @fileName = fileName
  end

  def writeArithmetic(command)
    if @commands.isBinaryCommand? command
      pop('translator', 0)
      pop('translator', 1)
      addComment(command)
      applyBinaryCommand(command)
      push('translator', 2)
    elsif @commands.isUnaryCommand? command
      pop('translator', 0)
      addComment(command)
      applyUnaryCommand(command)
      push('translator', 1)
    else
      File.delete(@file)
      raise "Command #{command} is invalid"
    end
  end

  def writePushPop(command, segment, index)
    if command == :C_PUSH
      push(segment, index)
    elsif command == :C_POP
      pop(segment, index)
    else
      File.delete(@file)
      raise "Command #{command} is not pop or push"
    end
  end

  def writeLabel(label)
    addComment("label #{label}")
    str = "(#{label})"
    @file.puts(str)
  end

  def writeGoto(label)
    addComment("goto #{label}")
    str="@#{label}\n0;JMP"
    @file.puts(str)
  end

  def writeIf(label)
    addComment("if-goto #{label}")
    pop('translator', 0)
    address = @addresses.getAddress('translator', 0)
    str="#{address}\nD=M\n@#{label}\nD;JNE"
    @file.puts(str)
  end

  def writeFunction(functionName, nVars)
  end

  def writeCall(functionName, nArgs)
  end

  def writeReturn
  end

  def close
    putFinalInfinityLoop
    @file.close
    @file = nil
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
    addComment("pop #{segment} #{index}")
    address = @addresses.getAddress(segment, index.to_i)
    getSpLocaltion = "@SP\nM=M-1\n@SP\nA=M\nD=M\n"
    str = if AddressesTable.isABaseAddress?(segment)
            "#{address}\nD=D+A\n@R13\nM=D\n#{getSpLocaltion}@R13\nA=M" #the address needs to be put in the arbitrary temporary register R13
          else
            "#{getSpLocaltion}#{address}"
          end
    str += "\nM=D\n@SP\nA=M\nM=0" # updating the register at address and cleaning the register at SP position
    @file.puts(str)
  end

  def push(segment, index)
    addComment("push #{segment} #{index}")
    address = @addresses.getAddress(segment, index.to_i)
    str = if AddressesTable.isABaseAddress?(segment) # getting the value from the register located in the given address
            "#{address}\nA=D+A\nD=M"
          else
            "#{address}\nD=#{segment == 'constant' ? 'A' : 'M'}" # constant values are the values of the register location
          end

    str += "\n@SP\nA=M\nM=D\n@SP\nM=M+1" # pushing the value to the stack and incrementing SP
    @file.puts(str)
  end

  def bootstrap
    addComment('Starting stack')
    setSPInitialPosition = "@256\nD=A\n@SP\nM=D"
    @file.puts(setSPInitialPosition)
    # TODO sys.init stuff
  end

  def putFinalInfinityLoop
    addComment('Infinity loop')
    infinityLoop = "(END)\n@END\n0;JMP"
    @file.puts(infinityLoop)
  end
end
