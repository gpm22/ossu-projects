class UnionFindCompressed:
    def __init__(self, objects):
        self.parent = {obj: obj for obj in objects}
        self.rank = {obj: 0 for obj in objects}

    def find(self, obj):
        if self.parent[obj] != obj:
            self.parent[obj] = self.find(self.parent[obj])  # Path compression
        return self.parent[obj]

    def union(self, obj1, obj2):
        x_root = self.find(obj1)
        y_root = self.find(obj2)
        if x_root != y_root:
            if self.rank[x_root] < self.rank[y_root]:
                self.parent[x_root] = y_root
            else:
                self.parent[y_root] = x_root
                if self.rank[x_root] == self.rank[y_root]:
                    self.rank[x_root] += 1
