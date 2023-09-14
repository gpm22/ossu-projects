STDOUT.sync = true
require_relative "./ExhaustiveSearchTSP"

require "test/unit"
extend Test::Unit::Assertions

def getGraphFromFile(file)
  currentFolder = File.absolute_path(File.dirname(__FILE__))
  inputPath = currentFolder + "/test_files/#{file}.txt"
  graph = Graph.new
  File.open(inputPath).each_line do |line|
    values = line.split(" ").map(&:to_i)
    next if values.size < 3
    graph.addEdge(values[0], values[1], values[2].to_i)
  end
  graph
end

def test(file, expected, name)
  result = getGraphFromFile(file).tsp
  puts "#{name} tour: #{result}"
  assert_equal(expected, result[2], name)

  puts "Test passed! #{name}"
end

test("tsptest1", 13, "quiz 19.2")
test("tsptest2", 23, "quiz 20.7")
