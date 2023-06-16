require_relative './src/Parser'
require_relative './src/CodeWriter'

class VMTranslator
  def initialize(path)
    @isFile? = !File.directory?(path)
    if @isFile?
      self.setFilesInfo(path)
    else
      self.setFoldersInfo(path)
    end
  end

  def execute
    if @isFile?
      @writer = CodeWriter.new(@parentFolder + '/' + File.basename(@file, '.vm') + '.asm')
      self.executeFile(@file)
    else
      self.executeFolder
    end
  end

  private

  def executeFolder
    raise "folders support are not implement yet"
  end

  def executeFile(fileName)
    parser = Parser.new(fileName)
    while parser.hasMoreLines
        parser.advance
        commandType =  parser.commandType
        if commandType == :C_ARITHMETIC 
            @writer.writeArithmetic(parser.arg1)
        elsif commandType == :C_POP || commandType == :C_PUSH
            @writer.writePushPop(commandType, parser.arg1, parser.arg2)
        else
            next
        end
    end
    @writer.close
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
      parentFolder = path.dirname(newPath)
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