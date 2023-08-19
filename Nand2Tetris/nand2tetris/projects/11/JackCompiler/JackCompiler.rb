require_relative "./src/CompilationEngine"
require_relative "./src/JackTokenizer"

class JackAnalyzer
  def initialize(path)
    @isFile = !File.directory?(path)
    if @isFile
      self.setFilesInfo(path)
    else
      self.setFoldersInfo(path)
    end
  end

  def execute
    if @isFile
      self.executeFile(@file)
    else
      self.executeFolder
    end
  end

  private

  def createEngine(tokenizer, path)
    CompilationEngine.new(tokenizer, @folder + "/" + path + ".xml")
  end

  def executeFolder
    @files.each do |file|
      executeFile(@folder + "/" + file)
    end
  end

  def executeFile(fileName)
    tokenizer = JackTokenizer.new(fileName)
    engine = createEngine(tokenizer, File.basename(fileName, ".jack"))
    engine.compileClass
    tokenizer.close
    engine.close
  end

  def setFoldersInfo(folder)
    @folder = self.getInfoFromPath(folder)
    @files = Dir.entries(@folder).select { |f| File.extname(f) == ".jack" }
    raise "folder #{@folder} does not contain any jack file" if @files.size == 0
  end

  def setFilesInfo(file)
    raise "File extension must be jack and not #{File.extname(file)}" unless File.extname(file) == ".jack"
    raise "First file name letter must be uppercase" unless File.basename(file)[0] == File.basename(file)[0].upcase

    @file = self.getInfoFromPath(file)
  end

  def getInfoFromPath(path)
    if path.include?('\\') || path.include?("/")
      path = path.gsub('\\', "/") if path.include?('\\')
      newPath = path
    else
      parentFolder = Dir.pwd
      newPath = parentFolder.to_s + "/" + path.to_s
    end
    newPath
  end
end

for arg in ARGV
  JackAnalyzer.new(arg).execute
end
