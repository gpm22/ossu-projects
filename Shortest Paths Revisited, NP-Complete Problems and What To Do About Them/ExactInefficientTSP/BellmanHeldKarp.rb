require "set"

class BellmanHeldKarp
  def initialize(graph)
    @graph = graph
  end

  #TODO version optimized
  def BellmanHeldKarp
    result = BellmanHeldKarpHelper(false)
    @graph.type == :CARTESIAN ? Math.sqrt(result) : result
  end

  def BellmanHeldKarpOptimized
    result = BellmanHeldKarpHelper(true)
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

    (3..@graph.vertices.size).each do |subproblemSize|
      currentSubproblems = generateSubProblems(subproblemSize)

      cleaner = [] if optimized

      currentSubproblems.each do |subproblem|
        @subproblems[subproblem] = {}
        subproblemClean = subproblem - Set[@firstVertex]

        subproblemClean.each do |j|
          cleaner.push(subproblem - Set[j]) if optimized
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
      newMinimal = @subproblems[subproblemClean][neighbor] + @graph.getEdgeValue(neighbor, vertex)

      minimal = newMinimal if newMinimal < minimal
    end
    minimal
  end

  def getTourValue
    minimal = Float::INFINITY
    vertexSet = @graph.vertices.keys.to_set

    @nonFirstVertices.each do |vertex|
      newMinimal = @subproblems[vertexSet][vertex] + @graph.getEdgeValue(vertex, @firstVertex)

      minimal = newMinimal if newMinimal < minimal
    end
    minimal
  end
end
