class ExhaustiveSearchTSP
  def initialize(graph)
    @graph = graph
  end

  def tsp
    result = tspBase { |s, currentResult| tspSearch(s, currentResult) }
    result[2] = Math.sqrt(result[2]) if @graph.type == :CARTESIAN
    result
  end

  def tspNaive
    result = tspBase { |s, currentResult| tspSearch(s, currentResult, true) }
    result[2] = Math.sqrt(result[2]) if @graph.type == :CARTESIAN
    result
  end

  private

  def tspBase
    n = @graph.vertices.size
    vertices = @graph.vertices.keys
    w = (0..(n - 2)).inject { |sum, i| sum + @graph.getEdgeValue(vertices[i], vertices[i + 1]) } + @graph.getEdgeValue(vertices[n - 1], vertices[0])
    currentResult = [n, vertices, w]
    s = [1, [vertices[0]], 0]
    yield(s, currentResult)
  end

  def tspSearch(s, currentResult, naive = false)
    k, arr, w = s
    n = currentResult[0]
    wB = currentResult[2]
    if k == n
      new_w = w + @graph.getEdgeValue(arr[k - 1], arr[0])
      currentResult = [k, arr, new_w] if new_w < wB
    else
      notInArr = @graph.vertices.keys - arr
      notInArr.each do |j|
        new_w = w + @graph.getEdgeValue(arr[k - 1], j)
        if new_w < wB || naive
          new_S = [k + 1, arr + [j], new_w]
          currentResult = tspSearch(new_S, currentResult, naive)
        end
      end
    end
    currentResult
  end
end
