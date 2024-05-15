class BaseGraph
  def BellmanHeldKarp
    subproblems = {}
    # base cases (|S| = 2)
    (2..@vertices.size - 1).each do |j|
      subproblems[[@vertices[0], @vertices[j]]] = {}
      subproblems[[@vertices[0], @vertices[j]]][@vertices[j]] = getEdgeValue(@vertices[0], @vertices[j])
    end

    # systematically solve all subproblems

    (3..@vertices.size).each do |subproblemSize|
      currentSubproblems = generateSubProblems(subproblemSize)
      currentSubproblems.each do |subproblem|
        subproblems[subproblem] = {}
        subproblemClean = subproblem - @vertices[0]

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
    subproblemClean2 = subproblemClean - @vertices[0]
    minimal = Float::INFINITY
    subproblemClean2.each do |neighbor|
      newMinimal = subproblems[subproblemClean][neighbor] + getEdgeValue(neighbor, vertex)

      minimal = newMinimal if newMinimal < minimal
    end
    minimal
  end
end
