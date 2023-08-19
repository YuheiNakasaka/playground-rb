import time
import sys

sys.setrecursionlimit(1000000)

n, m = map(int, input().split())
g = [[] for _ in range(n)]
for _ in range(m):
    u, v = map(int, input().split())
    g[u - 1].append(v - 1)
    g[v - 1].append(u - 1)

start_time = time.time()

INF = 10**6
ans = [0]

def dfs(g, start, cache, ans):
    if ans[0] > INF:
        return
    if start in cache:
        return
    ans[0] += 1
    cache[start] = True
    for v in g[start]:
        if v not in cache and ans[0] <= INF:
            dfs(g, v, cache.copy(), ans)

dfs(g, 0, {}, ans)
print(min(ans[0], INF))
