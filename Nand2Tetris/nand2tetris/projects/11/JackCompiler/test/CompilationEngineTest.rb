require_relative "../src/JackTokenizer"
require_relative "../src/CompilationEngine"
require_relative "../src/VMWriter"

def test(file)
  path = File.expand_path("../Square/#{file}.jack", File.dirname(__dir__))
  tokenizer = JackTokenizer.new(path)
  writer = VMWriter.new(File.dirname(__dir__) + "test#{file}.vm")
  engine = CompilationEngine.new(tokenizer, writer)
  engine.compileClass
  tokenizer.close
  writer.close
end

def tests
  test("SquareGame")
  test("Main")
  test("Square")
end

tests
