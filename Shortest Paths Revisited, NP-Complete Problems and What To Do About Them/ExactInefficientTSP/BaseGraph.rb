require "set"

class BaseGraph
  #TODO version optimized
  def BellmanHeldKarp
    @subproblems = {}
    # base cases (|S| = 2)
    @firstVertex = @vertices.keys[0]
    @nonFirstVertex = @vertices.keys.drop(1)
    @nonFirstVertex.each do |vertex|
      setSubproblem = Set[@firstVertex, vertex]
      @subproblems[setSubproblem] = {}
      @subproblems[setSubproblem][vertex] = getEdgeValue(@firstVertex, vertex)
    end

    # systematically solve all subproblems

    (3..@vertices.size).each do |subproblemSize|
      currentSubproblems = generateSubProblems(subproblemSize)
      currentSubproblems.each do |subproblem|
        @subproblems[subproblem] = {}
        subproblemClean = subproblem - Set[@firstVertex]

        subproblemClean.each do |j|
          @subproblems[subproblem][j] = getMinimal(j, subproblem)
        end
      end
    end

    getTourValue()
  end

  private

  def generateSubProblems(subproblemSize)
    raise "subproblem size must be larger than 2" if subproblemSize < 3
    raise "subproblem size must be at most the number of vertices" if subproblemSize > @vertices.size

    return [@vertices.to_set] if subproblemSize == @vertices.size

    subproblems = []

    @nonFirstVertex.combination(subproblemSize-1).each do |combination| #subproblemSize counts the firstVertex that are added after
      subproblems.push((combination.push(@firstVertex)).to_set)
    end
    subproblems
  end

  def getMinimal(vertex, subproblem)
    subproblemClean = subproblem - Set[vertex]
    subproblemClean2 = subproblemClean - Set[@firstVertex]
    minimal = Float::INFINITY
    subproblemClean2.each do |neighbor|
      newMinimal = @subproblems[subproblemClean][neighbor] + getEdgeValue(neighbor, vertex)

      minimal = newMinimal if newMinimal < minimal
    end
    minimal
  end

  def getTourValue
    minimal = Float::INFINITY
    vertexSet = @vertex.keys.to_set
    @nonFirstVertex.each do |vertex|
      newMinimal = @subproblems[vertexSet][vertex] + getEdgeValue(neighbor, @firstVertex)

      minimal = newMinimal if newMinimal < minimal
    end
    minimal
  end
end
