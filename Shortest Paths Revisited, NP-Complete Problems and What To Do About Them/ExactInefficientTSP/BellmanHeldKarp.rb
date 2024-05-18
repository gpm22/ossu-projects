require "set"

class BellmanHeldKarp
  def initialize(graph)
    @graph = graph
  end

  def BellmanHeldKarp
    result = BellmanHeldKarpHelper(false)
    puts "counter: #{@counter}"
    @graph.type == :CARTESIAN ? Math.sqrt(result) : result
  end

  def BellmanHeldKarpOptimized
    result = BellmanHeldKarpHelper(true)
    puts "counter: #{@counter}"
    @graph.type == :CARTESIAN ? Math.sqrt(result) : result
  end

  private

  def BellmanHeldKarpHelper(optimized)
    @subproblems = {}
    # base cases (|S| = 2)
    @firstVertex = @graph.vertices.keys[0]
    @nonFirstVertices = @graph.vertices.keys.drop(1)
    @nonFirstVertices.each do |vertex|
      setSubproblem = Set[@firstVertex, vertex]
      @subproblems[setSubproblem] = {}
      @subproblems[setSubproblem][vertex] = @graph.getEdgeValue(@firstVertex, vertex)
    end

    # systematically solve all subproblems

    verticesSize = @graph.vertices.size
    @totalNumberOfProblems = verticesSize * (2 ** (verticesSize + 1))
    @counter = 0
    (3..verticesSize).each do |subproblemSize|
      currentSubproblems = generateSubProblems(subproblemSize)

      cleaner = Set[] if optimized
      currentSubproblems.each do |subproblem|
        @subproblems[subproblem] = {}
        subproblemClean = subproblem - Set[@firstVertex]

        subproblemClean.each do |j|
          cleaner.add(subproblem - Set[j]) if optimized
          @subproblems[subproblem][j] = getMinimal(j, subproblem)
        end
      end
      #clean @subproblems
      cleaner.each { |usedSubproblem| @subproblems.delete(usedSubproblem) } if optimized
    end

    getTourValue()
  end

  def generateSubProblems(subproblemSize)
    raise "subproblem size must be larger than 2" if subproblemSize < 3
    raise "subproblem size must be at most the number of vertices" if subproblemSize > @graph.vertices.size

    return [@graph.vertices.keys.to_set] if subproblemSize == @graph.vertices.size

    subproblems = []

    @nonFirstVertices.combination(subproblemSize - 1).each do |combination| #subproblemSize counts the firstVertex that are added after
      subproblems.push((combination.push(@firstVertex)).to_set)
    end
    subproblems
  end

  def getMinimal(vertex, subproblem)
    subproblemClean = subproblem - Set[vertex]
    subproblemClean2 = subproblemClean - Set[@firstVertex]
    minimal = Float::INFINITY

    subproblemClean2.each do |neighbor|
      puts "#{Time.now.strftime("%d/%m/%Y %H:%M:%S")} - subproblems size: #{@subproblems.size} - iteration #{@counter} of #{@totalNumberOfProblems} = #{@counter * 100.0 / @totalNumberOfProblems} %" if @counter % 1_500_000 == 0
      newMinimal = @subproblems[subproblemClean][neighbor] + @graph.getEdgeValue(neighbor, vertex)
      @counter += 1

      minimal = newMinimal if newMinimal < minimal
    end
    minimal
  end

  def getTourValue
    minimal = Float::INFINITY
    vertexSet = @graph.vertices.keys.to_set

    @nonFirstVertices.each do |vertex|
      puts "#{Time.now.strftime("%d/%m/%Y %H:%M:%S")} - subproblems size: #{@subproblems.size} - iteration #{@counter} of #{@totalNumberOfProblems} = #{@counter * 100.0 / @totalNumberOfProblems} %" if @counter % 1_500_000 == 0
      newMinimal = @subproblems[vertexSet][vertex] + @graph.getEdgeValue(vertex, @firstVertex)
      @counter += 1

      minimal = newMinimal if newMinimal < minimal
    end
    minimal
  end
end
