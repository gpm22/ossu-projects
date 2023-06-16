require_relative './src/Parser'
require_relative './src/CodeWriter'

class VMTranslator
  def initialize(path)
    @isFile = !File.directory?(path)
    if @isFile
      self.setFilesInfo(path)
      self.initWriter(@file)
    else
      self.setFoldersInfo(path)
      self.initWriter(@folder)
    end
  end

  def execute
    if @isFile
      self.executeFile(@file)
    else
      self.executeFolder
    end
    @writer.close
  end

  private

  def initWriter(path)
      @writer = CodeWriter.new(@parentFolder + '/' + File.basename(path, '.vm') + '.asm')
  end

  def executeFolder
    raise "folders support are not implement yet"
  end

  def executeFile(fileName)
    parser = Parser.new(fileName)
    @writer.setFileName(File.basename(fileName, '.vm'))
    while parser.hasMoreLines
        parser.advance
        commandType =  parser.commandType
        if commandType == :C_ARITHMETIC 
            @writer.writeArithmetic(parser.arg1)
        elsif commandType == :C_POP || commandType == :C_PUSH
            @writer.writePushPop(commandType, parser.arg1, parser.arg2)
        elsif commandType == :C_LABEL
            @writer.writeLabel(parser.arg1)
        elsif commandType == :C_GOTO
            @writer.writeGoto(parser.arg1)
        elsif commandType == :C_IF
            @writer.writeIf(parser.arg1)
        elsif commandType == :C_FUNCTION
            @writer.writeFunction(parser.arg1, parser.arg2)
        elsif commandType == :C_CALL
            @writer.writeCall(parser.arg1, parser.arg2)
        elsif commandType == :C_RETURN
            @writer.writeReturn
        else
          raise "command type #{commandType} not supported"
        end
    end
  end

  def setFoldersInfo(folder)
    raise "folders support are not implement yet"

    @folder, @parentFolder = self.getInfoFromPath(file)
  end

  def setFilesInfo(file)

    raise "File extension must be vm and not #{File.extname(file)}" unless File.extname(file) == '.vm'
    raise 'First file name letter must be uppercase' unless File.basename(file)[0] == File.basename(file)[0].upcase

    @file, @parentFolder = self.getInfoFromPath(file)
  end

  def getInfoFromPath(path)
    if path.include?('\\') || path.include?('/')
      path = path.gsub('\\', '/') if path.include?('\\')
      newPath = path
      parentFolder = File.dirname(newPath)
    else
      parentFolder = Dir.pwd
      newPath = @parentFolder.to_s + '/' + path.to_s
    end
    [newPath, parentFolder]
  end
end

for arg in ARGV
  VMTranslator.new(arg).execute
end