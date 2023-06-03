require_relative './src/Parser'
require_relative './src/CodeWriter'

class VMTranslator
  def initialize(file)
    self.setFilesInfo(file)
    @parser = Parser.new(@file)
    @writer = CodeWriter.new(@folder + '/' + File.basename(@file, '.vm') + '.asm')
  end

  def execute
    while @parser.hasMoreLines
        @parser.advance
        commandType =  @parser.commandType
        if commandType == :C_ARITHMETIC 
            @writer.writeArithmetic(@parser.arg1)
        elsif commandType == :C_POP || commandType == :C_PUSH
            @writer.writePushPop(commandType, @parser.arg1, @parser.arg2)
        else
            next
        end
    end
    @writer.close
  end

  private

  def setFilesInfo(file)
    raise "File extension must be vm and not #{File.extname(file)}" unless File.extname(file) == '.vm'
    raise 'First file name letter must be uppercase' unless File.basename(file)[0] == File.basename(file)[0].upcase

    if file.include?('\\') || file.include?('/')
      file = file.gsub('\\', '/') if file.include?('\\')
      @file = file
      @folder = File.dirname(@file)
    else
      @folder = Dir.pwd
      @file = @folder.to_s + '/' + file.to_s
    end
  end
end

for arg in ARGV
  VMTranslator.new(arg).execute
end