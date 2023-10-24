n = int(input())
s = list(map(int, input().strip()))

s.sort()
s = list(map(str, s))
max_val = 10 ** n
i = 0
ans = 0

while i * i < max_val:
    t = str(i * i).zfill(n)
    t = sorted(list(t))
    if s == t:
        ans += 1
    i += 1

print(ans)
