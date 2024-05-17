class NearestNeighborTSP
  def initialize(graph)
    @graph = graph
  end

  def nearestNeighborTSPFirst
    @counter = 0
    nearestNeighborTSPHelper(@graph.vertices.first[0])
  end

  def nearestNeighborTSP
    result = [nil, Float::INFINITY]
    @counter = 0
    @graph.vertices.keys.sample(4).each do |vertice|
      newResult = nearestNeighborTSPHelper(vertice)
      result = newResult if newResult[1] < result[1]
    end
    result
  end

  def getTourValue(tour)
    previousElement = tour.first
    tourValue = tour.reduce(0) do |result, element|
      currentResult = result + Math.sqrt(@graph.getEdgeValue(previousElement, element))
      previousElement = element
      currentResult
    end

    tourValue + Math.sqrt(@graph.getEdgeValue(tour[0], tour[-1]))
  end

  private

  def nearestNeighborTSPHelper(currentVertice)
    tour = [currentVertice]
    tourValue = 0
    @unvisitedVertices = @graph.vertices.clone
    @unvisitedVertices.delete(currentVertice)

    until @unvisitedVertices.empty?
      @counter += 1
      puts "#{Time.now.strftime("%d/%m/%Y %H:%M:%S")} vertice #{@counter} of #{@graph.vertices.size} = #{@counter * 100.0 / @graph.vertices.size} %" if @counter % 5000 == 0
      nearestUnvisitedNeighbor = getNearestUnvisitedNeighbor(currentVertice)
      tourValue += nearestUnvisitedNeighbor[1]
      tour.push(nearestUnvisitedNeighbor[0])
      @unvisitedVertices.delete(nearestUnvisitedNeighbor[0])
      currentVertice = nearestUnvisitedNeighbor[0]
    end
    tourValue += @graph.getEdgeValue(tour[0], tour[-1])
    tour.push(tour[0])

    return [tour, getTourValue(tour)] if @graph.type == :CARTESIAN

    [tour, tourValue]
  end

  def getNearestUnvisitedNeighbor(vertice)
    result = [nil, Float::INFINITY]

    @unvisitedVertices.keys.each do |neighbor|
      distance = @graph.getEdgeValue(vertice, neighbor)
      result = [neighbor, distance] if (distance < result[1])
    end
    result
  end
end
