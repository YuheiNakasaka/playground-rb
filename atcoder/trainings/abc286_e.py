n = int(input().strip())
a = list(map(int, input().split()))

INF = n
d = [[INF] * n for _ in range(n)]
val = [[0] * n for _ in range(n)]

for i in range(n):
    d[i][i] = 0
    val[i][i] = 0

for i in range(n):
    s = input().strip()
    for j in range(n):
        if s[j] == 'Y':
            d[i][j] = 1
            val[i][j] = a[j]

for j in range(n):
    for i in range(n):
        for k in range(n):
            if (d[i][j] + d[j][k]) < d[i][k]:
                d[i][k] = d[i][j] + d[j][k]
                val[i][k] = val[i][j] + val[j][k]
            elif (d[i][j] + d[j][k]) == d[i][k] and (val[i][j] + val[j][k]) > val[i][k]:
                val[i][k] = val[i][j] + val[j][k]

q = int(input().strip())
for _ in range(q):
    u, v = map(int, input().split())
    if d[u-1][v-1] == INF:
        print("Impossible")
    else:
        print(d[u-1][v-1], val[u-1][v-1] + a[u-1])
