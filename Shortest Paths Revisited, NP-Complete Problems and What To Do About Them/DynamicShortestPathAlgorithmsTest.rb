require_relative "./DynamicShortestPathAlgorithms"
require "test/unit"
extend Test::Unit::Assertions

def testBellmanFord(graph, expected, name)
  result = graph.bellmanFord(graph.nodes[0])

  assert_equal(expected, result, name)
  puts "test passed! #{name}"
end

def getBookGraph1
  s = Node.new(0)
  v = Node.new(1)
  u = Node.new(2)
  t = Node.new(3)
  w = Node.new(4)

  s.addNeighbor([v, 4])
  s.addNeighbor([u, 2])

  v.addNeighbor([t, 4])

  u.addNeighbor([v, -1])
  u.addNeighbor([w, 2])

  w.addNeighbor([t, 2])

  Graph.new([s, v, u, t, w])
end

def getBookGraph2
  s = Node.new(0)
  u = Node.new(1)
  x = Node.new(2)
  v = Node.new(3)
  w = Node.new(4)

  s.addNeighbor([u, 10])

  u.addNeighbor([v, -20])
  u.addNeighbor([x, 40])

  v.addNeighbor([w, -30])

  w.addNeighbor([u, -10])

  Graph.new([s, v, u, x, w])
end

testBellmanFord(getBookGraph1, [0, 1, 2, 5, 4], "Book test 1")
testBellmanFord(getBookGraph2, "negative cycle", "Book test 2")
