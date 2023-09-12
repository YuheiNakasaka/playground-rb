import itertools

g = []
for _ in range(3):
    g.append(list(map(int, input().split())))

h = {
    0: [0, 0],
    1: [0, 1],
    2: [0, 2],
    3: [1, 0],
    4: [1, 1],
    5: [1, 2],
    6: [2, 0],
    7: [2, 1],
    8: [2, 2]
}

all_permutations = list(itertools.permutations(range(9)))
all_permutations_cnt = len(all_permutations)
cnt = 0

for pm in all_permutations:
    y1 = []
    y2 = []
    y3 = []
    x1 = []
    x2 = []
    x3 = []
    xy1 = []
    xy2 = []

    for i in range(9):
        a = h[pm[i]]
        if a == [0, 0]:
            y1.append(g[0][0])
            x1.append(g[0][0])
            xy1.append(g[0][0])
        elif a == [0, 1]:
            y2.append(g[0][1])
            x1.append(g[0][1])
        elif a == [0, 2]:
            y3.append(g[0][2])
            x1.append(g[0][2])
            xy2.append(g[0][2])
        elif a == [1, 0]:
            y1.append(g[1][0])
            x2.append(g[1][0])
        elif a == [1, 1]:
            y2.append(g[1][1])
            x2.append(g[1][1])
            xy1.append(g[1][1])
            xy2.append(g[1][1])
        elif a == [1, 2]:
            y3.append(g[1][2])
            x2.append(g[1][2])
        elif a == [2, 0]:
            y1.append(g[2][0])
            x3.append(g[2][0])
            xy2.append(g[2][0])
        elif a == [2, 1]:
            y2.append(g[2][1])
            x3.append(g[2][1])
        elif a == [2, 2]:
            y3.append(g[2][2])
            x3.append(g[2][2])
            xy1.append(g[2][2])

    if ((y1[0] == y1[1] and y1[0] != y1[2]) or
       (y2[0] == y2[1] and y2[0] != y2[2]) or
       (y3[0] == y3[1] and y3[0] != y3[2]) or
       (x1[0] == x1[1] and x1[0] != x1[2]) or
       (x2[0] == x2[1] and x2[0] != x2[2]) or
       (x3[0] == x3[1] and x3[0] != x3[2]) or
       (xy1[0] == xy1[1] and  xy1[0] != xy1[2]) or
       (xy2[0] == xy2[1] and  xy2[0] != xy2[2])):
      cnt += 1

print((all_permutations_cnt - cnt) / float(all_permutations_cnt))
