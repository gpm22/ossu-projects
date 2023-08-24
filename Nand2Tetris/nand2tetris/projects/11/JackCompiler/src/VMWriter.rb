class VMWriter
  def initialize(outputFilePath)
    @outputFile = File.new(outputFilePath, 'w')
    @outputFile.truncate(0)
    @segments = { CONSTANT: 'constant', ARGUMENT: 'argument',
                  LOCAL: 'local', STATIC: 'static',
                  THIS: 'this', THAT: 'that',
                  POINTER: 'pointer', TEMP: 'temp' }
    @arithmeticCommands = { ADD: 'add', SUB: 'sub', NEG: 'neg',
                            EQ: 'eq', GT: 'gt', LT: 'lt',
                            AND: 'and', OR: 'or', NOT: 'not',
                            MULT: 'call Math.multiply 2',
                            DIV: 'call Math.divide 2' }
  end

  def writePush(segment, index)
    raise "segment #{segment} does not exist" unless @segments.include? segment

    @outputFile.puts("push #{@segments[segment]} #{index}")
  end

  def writePop(segment, index)
    raise "segment #{segment} does not exist" unless @segments.include? segment
    raise 'segment cannot be constant' if segment == :CONSTANT

    @outputFile.puts("pop #{@segments[segment]} #{index}")
  end

  def writeArithmetic(command)
    raise "arithmetic command #{command} does not exist" unless @arithmeticCommands.include? command

    @outputFile.puts(@arithmeticCommands[command])
  end

  def writeLabel(label)
    @outputFile.puts("label #{label}")
  end

  def writeGoto(label)
    @outputFile.puts("goto #{label}")
  end

  def writeIf(label)
    @outputFile.puts("if-goto #{label}")
  end

  def writeCall(name, nVars)
    @outputFile.puts("call #{name} #{nVars}")
  end

  def writeFunction(name, nVars)
    @outputFile.puts("function #{name} #{nVars}")
  end

  def writeReturn
    @outputFile.puts('return')
  end

  def close
    @outputFile.close
  end
end
