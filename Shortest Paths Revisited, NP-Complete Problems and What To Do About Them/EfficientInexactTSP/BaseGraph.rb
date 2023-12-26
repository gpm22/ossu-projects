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
    puts "#{Time.now.strftime("%d/%m/%Y %H:%M:%S")} creating first tour using nearest neighbor"
    @tour2OPT, distance = nearestNeighborTSPFirst
    foundImprovement = true
    @tour2OPT.pop
    n = @tour2OPT.size

    maxImprovements = n # so the algorithm is n^3
    counter = 0

    puts "#{Time.now.strftime("%d/%m/%Y %H:%M:%S")} Starting improvements"

    while foundImprovement && counter < maxImprovements
      foundImprovement = false
      counter += 1
      puts "#{Time.now.strftime("%d/%m/%Y %H:%M:%S")} - improvement: #{counter} / #{maxImprovements} - #{counter * 100 / maxImprovements} % - current distance = #{distance}"

      (0..(n - 2)).each do |i|
        ((i + 1)..(n - 1)).each do |j|
          delta = calculateDeltaLength(i, j).round(2)
          hasImprovement = delta < 0
          if hasImprovement
            change2(i, j)
            distance += delta
            foundImprovement = true
          end
        end
      end
    end

    @tour2OPT.push(@tour2OPT[0])
    [@tour2OPT, distance]
  end

  private

  def calculateDeltaLength(positionOfFirstVertexOfFirstEdge, positionOfFirstVertexOfSecondEdge)
    n = @tour2OPT.size
    delta = -getEdgeValue(@tour2OPT[positionOfFirstVertexOfFirstEdge], @tour2OPT[(positionOfFirstVertexOfFirstEdge + 1) % n])
    delta -= getEdgeValue(@tour2OPT[positionOfFirstVertexOfSecondEdge], @tour2OPT[(positionOfFirstVertexOfSecondEdge + 1) % n])
    delta += getEdgeValue(@tour2OPT[(positionOfFirstVertexOfFirstEdge + 1) % n], @tour2OPT[(positionOfFirstVertexOfSecondEdge + 1) % n])
    delta + getEdgeValue(@tour2OPT[positionOfFirstVertexOfFirstEdge], @tour2OPT[positionOfFirstVertexOfSecondEdge])
  end

  def change2(positionOfFirstVertexOfFirstEdge, positionOfFirstVertexOfSecondEdge)
    @tour2OPT = @tour2OPT[0..positionOfFirstVertexOfFirstEdge] + @tour2OPT[(positionOfFirstVertexOfFirstEdge + 1)..positionOfFirstVertexOfSecondEdge].reverse + @tour2OPT[(positionOfFirstVertexOfSecondEdge + 1)..-1]
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
