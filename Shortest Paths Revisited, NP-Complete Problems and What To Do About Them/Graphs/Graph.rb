class Graph
  attr_reader :vertices

  def initialize
    @edges = {}
    @vertices = {}
  end

  def self.createGraphFromFile(filePath)
    graph = Graph.new
    File.open(filePath).each_line do |line|
      values = line.split(" ").map(&:to_i)
      next if values.size < 3
      graph.addEdge(values[0], values[1], values[2].to_i)
    end
    graph
  end

  def self.generateGraphWithNVertices(n)
    total = n * n
    per1 = total / 100
    current = 1
    graph = Graph.new
    (1..n).each do |i|
      (1..n).each do |j|
        puts " #{Time.now.strftime("%d/%m/%Y %H:%M:%S")} - #{current}/#{total} = #{current / per1} %" if (current % per1) == 0
        current += 1
        next if i == j
        graph.addEdge(i, j, rand(0..100))
      end
    end
    graph
  end

  def addEdge(firstVertex, secondVertex, value)
    @vertices[firstVertex.to_s] = nil unless @vertices.has_key?(firstVertex.to_s)
    @vertices[secondVertex.to_s] = nil unless @vertices.has_key?(secondVertex.to_s)
    @edges["#{firstVertex}:#{secondVertex}"] = value
    @edges["#{secondVertex}:#{firstVertex}"] = value
  end

  def getEdgeValue(firstVertex, secondVertex)
    @edges["#{firstVertex}:#{secondVertex}"]
  end

  def type
    :ORDINARY
  end
end
