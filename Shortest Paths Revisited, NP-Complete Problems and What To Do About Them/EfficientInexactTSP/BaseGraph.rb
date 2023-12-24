class BaseGraph

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
      nearestUnvisitedNeighbor = getNearestUnvisitedNeighbor(currentVertice)
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

end
