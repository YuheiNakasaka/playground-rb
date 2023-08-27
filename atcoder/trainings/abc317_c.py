n, m = map(int, input().split())
cs = {}
g = [[] for _ in range(n)]
for _ in range(m):
    a, b, c = map(int, input().split())
    g[a - 1].append(b - 1)
    g[b - 1].append(a - 1)
    cs[(b - 1, a - 1)] = c
    cs[(a - 1, b - 1)] = c

max_value = -1
def dfs(idx, routes, total):
    routes[idx] = True
    global max_value
    for i in g[idx]:
        if routes[i]:
            if max_value <= total:
                max_value = total
            continue
        dfs(i, routes.copy(), total + cs[(idx, i)])

for i in range(n):
    dfs(i, [False] * n, 0)

print(max_value)
