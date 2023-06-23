require_relative './CommandsTable'
require_relative './AddressesTable'

class CodeWriter
  def initialize(outputFile)
    @file = File.new(outputFile, 'w')
    @file.truncate(0)
    @addresses = AddressesTable.new(@fileName)
    @commands = CommandsTable.new
    @insideFunction = false
    @functionName = ''
    @functionsIndexes = {} 
    bootstrap
  end

  def setFileName(fileName)
    @fileName = fileName
    @addresses = AddressesTable.new(@fileName)
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
    @file.puts("(#{getRealLabel(label)})")
  end

  def writeGoto(label)
    addComment("goto #{label}")
    str="@#{getRealLabel(label)}\n0;JMP"
    @file.puts(str)
  end

  def writeIf(label)
    addComment("if-goto #{label}")
    pop('translator', 0)
    address = @addresses.getAddress('translator', 0)
    str="#{address}\nD=M\n@#{getRealLabel(label)}\nD;JNE"
    @file.puts(str)
  end

  def writeFunction(functionName, nVars)
    addComment("function #{functionName} #{nVars}")
    @insideFunction = true
    @functionName = functionName
    @file.puts("(#{@functionName})")
    (nVars.to_i).times {self.push("constant", 0)}
  end


  def writeCall(functionName, nArgs)
    addComment("call #{functionName} #{nArgs}")
    index = self.getFunctionIndex
    returnAddress="#{@functionName}$ret.#{index}"
    self.updateFunctionIndex
    push("constant", returnAddress) # pushes the return label to the stack
    addComment("push current LCL to stack") 
    @file.puts("@LCL\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1")
    addComment("push current ARG to stack") 
    @file.puts("@ARG\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1")
    addComment("push current THIS to stack") 
    @file.puts("@THIS\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1")
    addComment("push current THAT to stack") 
    @file.puts("@THAT\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1")
    @file.puts("@SP\nD=M\n@5\nD=D-A\n@#{nArgs}\nD=D-A\n@ARG\nM=D") #repositions ARG
    @file.puts("@SP\nD=M\n@LCL\nM=D") #repositions LCL
    @file.puts("@#{functionName}\n0;JMP") #transfer control to the callee
    @file.puts("(#{returnAddress})") #injects the return address label into the code
  end

  def writeReturn
    addComment('return')
    #@insideFunction = false
    #@functionName = ''
    @file.puts("@LCL\nD=M\n@R15\nM=D")
    @file.puts("\n@R15\nD=M\n@5\nA=D-A\nD=M\n@R14\nM=D") # puts the return address in a temporary variable
    self.pop("argument", 0) # repositions the return value for the caller
    @file.puts("\n@ARG\nD=M+1\n@SP\nM=D") # repositions SP for the caller
    @file.puts("\n@R15\nD=M\n@1\nA=D-A\nD=M\n@THAT\nM=D") # restores THAT for the caller
    @file.puts("\n@R15\nD=M\n@2\nA=D-A\nD=M\n@THIS\nM=D") # restores THIS for the caller
    @file.puts("\n@R15\nD=M\n@3\nA=D-A\nD=M\n@ARG\nM=D") # restores ARG for the caller
    @file.puts("\n@R15\nD=M\n@4\nA=D-A\nD=M\n@LCL\nM=D") # restores LCL for the caller

    @file.puts("\n@R14\nD=M\nA=D\n0;JMP") # go to the return address
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
    address = @addresses.getAddress(segment, index)
    str = if AddressesTable.isABaseAddress?(segment) # getting the value from the register located in the given address
            "#{address}\nA=D+A\nD=M"
          else
            "#{address}\nD=#{segment == 'constant' ? 'A' : 'M'}" # constant values are the values of the register location
          end

    str += "\n@SP\nA=M\nM=D\n@SP\nM=M+1" # pushing the value to the stack and incrementing SP
    @file.puts(str)
  end


  def getRealLabel(label)
    if @insideFunction
      "#{@fileName}.#{@functionName}$#{label}"
    else
      label
    end
  end

  def getFunctionIndex
    return @functionsIndexes[@functionName] if @functionsIndexes.include?(@functionName)
    @functionsIndexes[@functionName] = 0 
  end

  def updateFunctionIndex
    @functionsIndexes[@functionName] = @functionsIndexes[@functionName] + 1
  end

  def bootstrap
    addComment("bootstrapping")
    addComment('Starting stack')
    @file.puts("@256\nD=A\n@SP\nM=D")
    self.writeCall("Sys.init", 0)
  end

  def putFinalInfinityLoop
    addComment('Infinity loop')
    infinityLoop = "(END)\n@END\n0;JMP"
    @file.puts(infinityLoop)
  end
end
