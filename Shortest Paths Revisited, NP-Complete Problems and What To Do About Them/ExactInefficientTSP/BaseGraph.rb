class BaseGraph
  #TODO version optimized
  def BellmanHeldKarp
    subproblems = {}
    # base cases (|S| = 2)
    firstVertex = @vertices.keys[0]
    @vertices.keys.drop(1).each do |j|
      subproblems[[firstVertex, @vertices[j]]] = {}
      subproblems[[firstVertex, @vertices[j]]][@vertices[j]] = getEdgeValue(firstVertex, @vertices[j])
    end

    # systematically solve all subproblems

    (3..@vertices.size).each do |subproblemSize|
      currentSubproblems = generateSubProblems(subproblemSize)
      currentSubproblems.each do |subproblem|
        subproblems[subproblem] = {}
        subproblemClean = subproblem - firstVertex

        subproblemClean.each do |j|
          subproblems[subproblem][j] = getMinimal(j, subproblem, subproblems)
        end
      end
    end

    getMinimal(@vertex[0], @vertex, subproblems)
  end

  private

  def generateSubProblems(subproblemSize)
    [] #TODO
  end

  def getMinimal(vertex, subproblem, subproblems)
    subproblemClean = subproblem - vertex
    firstVertex = @vertices.keys[0]
    subproblemClean2 = subproblemClean - firstVertex
    minimal = Float::INFINITY
    subproblemClean2.each do |neighbor|
      newMinimal = subproblems[subproblemClean][neighbor] + getEdgeValue(neighbor, vertex)

      minimal = newMinimal if newMinimal < minimal
    end
    minimal
  end
end
