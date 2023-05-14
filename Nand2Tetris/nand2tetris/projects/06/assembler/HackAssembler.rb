require_relative './src/Parser'
require_relative './src/Code'
require_relative './src/SymbolTable'

class HackAssembler
  def initialize(file)
    setFilesInfo(file)
    @table = SymbolTable.new
  end

  def execute
    firstPass
    secondPass
  end

  private

  def firstPass
    parser = Parser.new(@file)
    lineNumber = 0
    while parser.hasMoreLines
      parser.advance

      if parser.instructionType == :A_INSTRUCTION
        lineNumber += 1
      elsif parser.instructionType == :C_INSTRUCTION
        lineNumber += 1
      elsif parser.instructionType == :L_INSTRUCTION
        @table.addEntry(parser.symbol, lineNumber)
      end
    end
  end

  def secondPass
    parser = Parser.new(@file)
    @variableAddress = 16
    begin
      setOutput
      while parser.hasMoreLines
        parser.advance

        if parser.instructionType == :A_INSTRUCTION
          line = translateAInstruction(parser.symbol)
        elsif parser.instructionType == :C_INSTRUCTION
          line = translateCInstruction(parser)
        elsif parser.instructionType == :L_INSTRUCTION
          next
        end

        @output.puts(line)
      end
    rescue Exception => e
      deleteOutputFile unless @output.nil?
      raise e
    end
    closeOutputFile
  end

  def translateAInstruction(symbol)
    positiveIntegerRegex = /\A\d+\z/
    if positiveIntegerRegex.match(symbol)
      address = symbol
    elsif @table.contains(symbol)
      address = @table.getAddress(symbol).to_s
    else
      @table.addEntry(symbol, @variableAddress)
      address = @variableAddress.to_s
      @variableAddress += 1
    end

    ('%016b' % address)
  end

  def translateCInstruction(parser)
    '111' + Code.comp(parser.comp) + Code.dest(parser.dest) + Code.jump(parser.jump)
  end

  def setFilesInfo(file)
    raise "File extension must be asm and not #{File.extname(file)}" unless File.extname(file) == '.asm'

    if file.include?('\\') || file.include?('/')
      file = file.gsub('\\', '/') if file.include?('\\')
      @file = file
      @folder = File.dirname(@file)
    else
      @folder = Dir.pwd
      @file = @folder.to_s + '/' + file.to_s
    end
  end

  def setOutput
    @output = File.new(@folder + '/' + File.basename(@file, '.asm') + '.hack', 'w')
    @output.truncate(0)
  end

  def closeOutputFile
    @output.close
  end

  def deleteOutputFile
    File.delete(@output)
  end
end

for arg in ARGV
  HackAssembler.new(arg).execute
end
