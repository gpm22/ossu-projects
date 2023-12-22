class Graph
  def initialize
    @edges = {}
    @vertices = {}
  end

  def addEdge(firstVertex, secondVertex, value)
    @vertices[firstVertex.to_s] = nil
    @vertices[secondVertex.to_s] = nil
    @edges["#{firstVertex}:#{secondVertex}"] = value
    @edges["#{secondVertex}:#{firstVertex}"] = value
  end

  def nearestNeighborTSPFirst
    nearestNeighborTSPHelper(@vertices.first[0])
  end

  def nearestNeighborTSP
    result = [nil, Float::INFINITY]
    @vertices.keys.sample(4).each do |vertice|
      newResult = nearestNeighborTSPHelper(vertice)
      result = newResult if newResult[1] < result[1]
    end
    result
  end

  private

  def nearestNeighborTSPHelper(currentVertice)
    tour = [currentVertice]
    tourValue = 0
    @unvisitedVertices = @vertices.clone
    @unvisitedVertices.delete(currentVertice)

    until @unvisitedVertices.empty?
      nearestUnvisitedNeighbor = getNearestUnvisitedNeighborClone(currentVertice)
      tourValue += nearestUnvisitedNeighbor[1]
      tour.push(nearestUnvisitedNeighbor[0])
      @unvisitedVertices.delete(nearestUnvisitedNeighbor[0])
      currentVertice = nearestUnvisitedNeighbor[0]
    end
    tourValue += getEdgeValue(tour[0], tour[-1])
    [tour, tourValue]
  end

  def getNearestUnvisitedNeighbor(vertice)
    result = [nil, Float::INFINITY]

    @unvisitedVertices.keys.each do |neighbor|
      distance = getEdgeValue(vertice, neighbor)
      result = [neighbor, distance] if (distance < result[1])
    end
    result
  end

  def getEdgeValue(firstVertex, secondVertex)
    @edges["#{firstVertex}:#{secondVertex}"]
  end
end
