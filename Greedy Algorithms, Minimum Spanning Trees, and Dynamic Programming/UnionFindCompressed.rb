class UnionFindCompressed
  def initialize(objects)
    @parent = Hash.new { |h, k| h[k] = k }
    @rank = Hash.new(0)
  end

  def find(obj)
    if @parent[obj] != obj
      @parent[obj] = find(@parent[obj])
    end
    @parent[obj]
  end

  def union(obj1, obj2)
    x_root = find(obj1)
    y_root = find(obj2)
    if x_root != y_root
      if @rank[x_root] < @rank[y_root]
        @parent[x_root] = y_root
      else
        @parent[y_root] = x_root
        if @rank[x_root] == @rank[y_root]
          @rank[x_root] += 1
        end
      end
    end
  end
end
