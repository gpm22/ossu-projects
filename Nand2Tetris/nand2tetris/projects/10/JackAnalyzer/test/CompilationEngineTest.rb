require_relative "../src/JackTokenizer"
require_relative "../src/CompilationEngine"

def test(file)
  path = File.expand_path("../Square/#{file}.jack", File.dirname(__dir__))
  tokenizer = JackTokenizer.new(path)
  engine = CompilationEngine.new(tokenizer, File.dirname(__dir__) + "test#{file}.xml")
  engine.compileClass
  tokenizer.close
  engine.close
end

def tests
  test("SquareGame")
  test("Main")
  test("Square")
end

tests
