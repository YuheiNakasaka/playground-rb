class UnionFind:
    def __init__(self, size):
        self.rank = [0] * size
        self.parent = list(range(size))

    def unite(self, id_x, id_y):
        x_parent = self.find(id_x)
        y_parent = self.find(id_y)
        if x_parent == y_parent:
            return

        if self.rank[x_parent] > self.rank[y_parent]:
            self.parent[y_parent] = x_parent
        else:
            self.parent[x_parent] = y_parent
            if self.rank[x_parent] == self.rank[y_parent]:
                self.rank[y_parent] += 1

    def find(self, id_x):
        if self.parent[id_x] != id_x:
            self.parent[id_x] = self.find(self.parent[id_x])
        return self.parent[id_x]

    def same(self, id_x, id_y):
        return self.find(id_x) == self.find(id_y)

    def size(self, i):
        return self.rank[self.find(i)]


def dfs(i, arr, n, m, k, uvw, ans):
    if len(arr) == n - 1:
        uf = UnionFind(n)
        tmp = 0
        ok = True
        for j in arr:
            u, v, w = uvw[j]
            if uf.same(u, v):
                ok = False
                break
            uf.unite(u, v)
            tmp = (tmp + w) % k
        if ok:
            ans[0] = min(ans[0], tmp)
    else:
        if i == m:
            return
        dfs(i + 1, arr, n, m, k, uvw, ans)
        dfs(i + 1, arr + [i], n, m, k, uvw, ans)


n, m, k = map(int, input().split())
uvw = [list(map(int, input().split())) for _ in range(m)]
for i in range(m):
    uvw[i][0] -= 1
    uvw[i][1] -= 1

ans = [10**18]
dfs(0, [], n, m, k, uvw, ans)
print(ans[0])
