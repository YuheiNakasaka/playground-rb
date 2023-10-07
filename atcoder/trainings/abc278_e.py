H, W, n, h, w = map(int, input().split())

min_x = [H + 1] * n
max_x = [0] * n
min_y = [W + 1] * n
max_y = [0] * n

for i in range(1, H + 1):
    row = list(map(int, input().split()))
    for j in range(1, W + 1):
        a = row[j - 1] - 1
        min_x[a] = min(min_x[a], i)
        max_x[a] = max(max_x[a], i)
        min_y[a] = min(min_y[a], j)
        max_y[a] = max(max_y[a], j)

anss = [[n] * (W - w + 1) for _ in range(H - h + 1)]

for i in range(H - h + 1):
    for j in range(W - w + 1):
        k = i + h
        l = j + w
        ans = n
        for a in range(n):
            if i < min_x[a] <= k and j < min_y[a] <= l and max_x[a] <= k and max_y[a] <= l:
                ans -= 1
        anss[i][j] = ans

for ans in anss:
    print(' '.join(map(str, ans)))
