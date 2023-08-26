require_relative './src/CompilationEngine'
require_relative './src/JackTokenizer'
require_relative './src/VMWriter'

class JackCompiler
  def initialize(path)
    @isFile = !File.directory?(path)
    if @isFile
      setFilesInfo(path)
    else
      setFoldersInfo(path)
    end
  end

  def execute
    if @isFile
      executeFile(@file)
    else
      executeFolder
    end
  end

  private

  def createEngine(tokenizer, writer)
    CompilationEngine.new(tokenizer, writer)
  end

  def executeFolder
    @files.each do |file|
      executeFile(@folder + '/' + file)
    end
  end

  def executeFile(fileName)
    tokenizer = JackTokenizer.new(fileName)
    outputPath = @folder + '/' + File.basename(fileName, '.jack') + '.vm'
    writer = VMWriter.new(outputPath)
    engine = createEngine(tokenizer, writer)
    engine.compileClass
    tokenizer.close
    writer.close
  end

  def setFoldersInfo(folder)
    @folder = getInfoFromPath(folder)
    @files = Dir.entries(@folder).select { |f| File.extname(f) == '.jack' }
    raise "folder #{@folder} does not contain any jack file" if @files.size == 0
  end

  def setFilesInfo(file)
    raise "File extension must be jack and not #{File.extname(file)}" unless File.extname(file) == '.jack'
    raise 'First file name letter must be uppercase' unless File.basename(file)[0] == File.basename(file)[0].upcase

    @file = getInfoFromPath(file)
  end

  def getInfoFromPath(path)
    if path.include?('\\') || path.include?('/')
      path = path.gsub('\\', '/') if path.include?('\\')
      newPath = path
    else
      parentFolder = Dir.pwd
      newPath = parentFolder.to_s + '/' + path.to_s
    end
    newPath
  end
end

for arg in ARGV
  JackCompiler.new(arg).execute
end
