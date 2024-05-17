class TSP2OPT
  def initialize(graph)
    @graph = graph

    @nearestNeighborTSP = NearestNeighborTSP.new(graph)
  end

  def TSP2OPT
    puts "#{Time.now.strftime("%d/%m/%Y %H:%M:%S")} creating first tour using nearest neighbor"
    @tour2OPT, distance = @nearestNeighborTSP.nearestNeighborTSPFirst
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

    return [@tour2OPT, @nearestNeighborTSP.getTourValue(@tour2OPT)] if @graph.type == :CARTESIAN

    [@tour2OPT, distance]
  end

  private

  def calculateDeltaLength(positionOfFirstVertexOfFirstEdge, positionOfFirstVertexOfSecondEdge)
    n = @tour2OPT.size
    delta = -@graph.getEdgeValue(@tour2OPT[positionOfFirstVertexOfFirstEdge], @tour2OPT[(positionOfFirstVertexOfFirstEdge + 1) % n])
    delta -= @graph.getEdgeValue(@tour2OPT[positionOfFirstVertexOfSecondEdge], @tour2OPT[(positionOfFirstVertexOfSecondEdge + 1) % n])
    delta += @graph.getEdgeValue(@tour2OPT[(positionOfFirstVertexOfFirstEdge + 1) % n], @tour2OPT[(positionOfFirstVertexOfSecondEdge + 1) % n])
    delta + @graph.getEdgeValue(@tour2OPT[positionOfFirstVertexOfFirstEdge], @tour2OPT[positionOfFirstVertexOfSecondEdge])
  end

  def change2(positionOfFirstVertexOfFirstEdge, positionOfFirstVertexOfSecondEdge)
    @tour2OPT = @tour2OPT[0..positionOfFirstVertexOfFirstEdge] + @tour2OPT[(positionOfFirstVertexOfFirstEdge + 1)..positionOfFirstVertexOfSecondEdge].reverse + @tour2OPT[(positionOfFirstVertexOfSecondEdge + 1)..-1]
  end
end
