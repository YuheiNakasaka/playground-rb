from collections import deque

h, w = map(int, input().split())
g = [['' for _ in range(w)] for _ in range(h)]
start = []
end = []

for i in range(h):
    hw = list(input().strip())
    for j in range(w):
        if hw[j] == 'S':
            start = [i, j]
        elif hw[j] == 'G':
            end = [i, j]
        g[i][j] = hw[j]

block = [[False for _ in range(w)] for _ in range(h)]

for i in range(h):
    blocking = False
    for j in range(w):
        if g[i][j] == '>':
            block[i][j] = True
            blocking = True
        elif g[i][j] in ['#', '<', '^', 'v']:
            block[i][j] = True
            blocking = False
        elif blocking:
            block[i][j] = True
        else:
            blocking = False

for i in range(h):
    blocking = False
    for j in range(w - 1, -1, -1):
        if g[i][j] == '<':
            block[i][j] = True
            blocking = True
        elif g[i][j] in ['#', '>', '^', 'v']:
            block[i][j] = True
            blocking = False
        elif blocking:
            block[i][j] = True
        else:
            blocking = False

for j in range(w):
    blocking = False
    for i in range(h):
        if g[i][j] == 'v':
            block[i][j] = True
            blocking = True
        elif g[i][j] in ['#', '>', '^', '<']:
            block[i][j] = True
            blocking = False
        elif blocking:
            block[i][j] = True
        else:
            blocking = False

for j in range(w - 1, -1, -1):
    blocking = False
    for i in range(h - 1, -1, -1):
        if g[i][j] == '^':
            block[i][j] = True
            blocking = True
        elif g[i][j] in ['#', '>', 'v', '<']:
            block[i][j] = True
            blocking = False
        elif blocking:
            block[i][j] = True
        else:
            blocking = False

scores = [[-1 for _ in range(w)] for _ in range(h)]
scores[start[0]][start[1]] = 0
q = deque()
q.append(start)

while q:
    i, j = q.popleft()
    directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    for di, dj in directions:
        y = i + di
        x = j + dj
        if 0 <= y < h and 0 <= x < w and not block[y][x]:
            if scores[y][x] == -1:
                q.append((y, x))
                scores[y][x] = scores[i][j] + 1

print(scores[end[0]][end[1]])
