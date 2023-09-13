def tsp
  w = (1..(n - 1)).inject { |sum, i| sum + edges(i, i + 1) } + edges(n, 1)
  currentResult = [n, (1..n).to_a, w]
  s = [1, [1], 0]
  tspSearch(s, currentResult)
end

def tspSearch(s, currentResult)
  k, arr, w = s
  n = currentResult[0]
  wB = currentResult[2]
  if k == n
    new_w = w + edges(arr[k - 1], arr[0])
    currentResult = [k, arr, new_w] if new_w < wB
  else
    notInArr = (1..n).to_a - arr
    notInArr.each do |j|
      new_w = w + edges(arr[k - 1], j)
      new_S = [k + 1, arr.push(j), new_w]
      currentResult = tspSearch(new_S, currentResult)
    end
  end
  currentResult
end
