# Read input values
h, w, n = map(int, input().split())
t = input().strip()
g = []

# Read the grid
for _ in range(h):
    g.append(list(input().strip()))

ans = 0

# Iterate over each cell in the grid
for i in range(h):
    for j in range(w):
        # Skip if the cell is an obstacle
        if g[i][j] == '#':
            continue

        ok = True
        now = [i, j]

        # Execute each move in t
        for c in t:
            if c == 'L':
                now = [now[0], now[1] - 1]
            elif c == 'R':
                now = [now[0], now[1] + 1]
            elif c == 'U':
                now = [now[0] - 1, now[1]]
            else:  # Down
                now = [now[0] + 1, now[1]]

            # Check if out of bounds or hit an obstacle
            if now[0] < 0 or now[0] >= h or now[1] < 0 or now[1] >= w or g[now[0]][now[1]] == '#':
                ok = False
                break

        if ok:
            ans += 1

# Print the answer
print(ans)
