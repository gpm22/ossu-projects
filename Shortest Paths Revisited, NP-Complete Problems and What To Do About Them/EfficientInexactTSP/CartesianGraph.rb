require_relative "./BaseGraph"

class CartesianGraph < BaseGraph
  def initialize
    @vertices = {}
  end

  def self.createGraphFromFile(filePath)
    graph = CartesianGraph.new
    File.open(filePath).each_line.with_index do |line, index|
      next if index == 0
      values = line.split(" ").map(&:to_i)
      graph.addVertex(index, values[0], values[1])
    end
    graph
  end

  def self.generateGraphWithNVertices(n)
    graph = CartesianGraph.new
    (1..n).each do |i|
      graph.addVertex(i, rand(-100.000..100.000), rand(-100.000..100.000))
    end
    graph
  end

  def nearestNeighborTSPHelper(currentVertice)
    tour = super(currentVertice)[0]
    [tour, getTourValue(tour)]
  end

  def addVertex(value, x, y)
    @vertices[value.to_s] = CartesianNode.new(value, x, y)
  end

  def getEdgeValue(firstVertex, secondVertex)
    @vertices[firstVertex].distanceTo(@vertices[secondVertex])
  end

  private

  def getTourValue(tour)
    previousElement = tour.first
    tourValue = tour.reduce(0) do |result, element|
      currentResult = result + Math.sqrt(getEdgeValue(previousElement, element))
      previousElement = element
      currentResult
    end

    tourValue + Math.sqrt(getEdgeValue(tour[0], tour[-1]))
  end
end

class CartesianNode
  attr_reader :x, :y

  def initialize(value, x, y)
    @value = value
    @x = x
    @y = y
  end

  def distanceTo(otherNode)
    #it's not squared as it does not make a difference in the comparison
    (@x - otherNode.x) ** 2 + (@y - otherNode.y) ** 2
  end
end
