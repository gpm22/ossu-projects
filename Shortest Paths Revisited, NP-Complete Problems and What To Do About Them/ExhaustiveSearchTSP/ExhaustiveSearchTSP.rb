class Graph
  def initialize
    @edges = {}
    @vertices = {}
  end

  def tsp
    tspBase { |s, currentResult| tspSearch(s, currentResult) }
  end

  def tspNaive
    tspBase { |s, currentResult| tspSearch(s, currentResult, true) }
  end

  def addEdge(firstVertex, secondVertex, value)
    @vertices[firstVertex.to_s] = nil
    @vertices[secondVertex.to_s] = nil
    @edges["#{firstVertex}:#{secondVertex}"] = value
    @edges["#{secondVertex}:#{firstVertex}"] = value
  end

  private

  def tspBase
    n = @vertices.size
    w = (1..(n - 1)).inject { |sum, i| sum + getEdgeValue(i, i + 1) } + getEdgeValue(n, 1)
    currentResult = [n, (1..n).to_a, w]
    s = [1, [1], 0]
    yield(s, currentResult)
  end

  def getEdgeValue(firstVertex, secondVertex)
    @edges["#{firstVertex}:#{secondVertex}"]
  end

  def tspSearch(s, currentResult, naive = false)
    k, arr, w = s
    n = currentResult[0]
    wB = currentResult[2]
    if k == n
      new_w = w + getEdgeValue(arr[k - 1], arr[0])
      currentResult = [k, arr, new_w] if new_w < wB
    else
      notInArr = (1..n).to_a - arr
      notInArr.each do |j|
        new_w = w + getEdgeValue(arr[k - 1], j)
        if new_w < wB || naive
          new_S = [k + 1, arr + [j], new_w]
          currentResult = tspSearch(new_S, currentResult, naive)
        end
      end
    end
    currentResult
  end
end
