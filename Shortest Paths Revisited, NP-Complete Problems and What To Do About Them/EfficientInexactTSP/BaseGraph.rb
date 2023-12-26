class BaseGraph
  def nearestNeighborTSPFirst
    @counter = 0
    nearestNeighborTSPHelper(@vertices.first[0])
  end

  def nearestNeighborTSP
    result = [nil, Float::INFINITY]
    @counter = 0
    @vertices.keys.sample(4).each do |vertice|
      newResult = nearestNeighborTSPHelper(vertice)
      result = newResult if newResult[1] < result[1]
    end
    result
  end

  def TSP2OPT
    tour, distance = nearestNeighborTSP
    foundImprovement = true
    tour.pop
    n = tour.size

    while foundImprovement
      foundImprovement = false

      (0..(n - 2)).each do |i|
        ((i + 1)..(n - 1)).each do |j|
          delta = -getEdgeValue(tour[i], tour[(i + 1) % n]) - getEdgeValue(tour[j], tour[(j + 1) % n]) + getEdgeValue(tour[(i + 1) % n], tour[(j + 1) % n]) + getEdgeValue(tour[i], tour[j])

          if delta < 0
            tour = change2(tour, i, j)
            distance += delta
            foundImprovement = true
          end
        end
      end
    end

    tour.push(tour[0])
    [tour, distance]
  end

  private

  def change2(tour, positionOfFirstVertexOfFirstEdge, positionOfFirstVertexOfSecondEdge)
    tour[0..positionOfFirstVertexOfFirstEdge] + tour[(positionOfFirstVertexOfFirstEdge + 1)..positionOfFirstVertexOfSecondEdge].reverse + tour[(positionOfFirstVertexOfSecondEdge + 1)..-1]
  end

  def nearestNeighborTSPHelper(currentVertice)
    tour = [currentVertice]
    tourValue = 0
    @unvisitedVertices = @vertices.clone
    @unvisitedVertices.delete(currentVertice)

    until @unvisitedVertices.empty?
      @counter += 1
      puts "#{Time.now.strftime("%d/%m/%Y %H:%M:%S")} vertice #{@counter} of #{@vertices.size} = #{@counter * 100.0 / @vertices.size} %" if @counter % 5000 == 0
      nearestUnvisitedNeighbor = getNearestUnvisitedNeighbor(currentVertice)
      tourValue += nearestUnvisitedNeighbor[1]
      tour.push(nearestUnvisitedNeighbor[0])
      @unvisitedVertices.delete(nearestUnvisitedNeighbor[0])
      currentVertice = nearestUnvisitedNeighbor[0]
    end
    tourValue += getEdgeValue(tour[0], tour[-1])
    tour.push(tour[0])
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
