# これで通るんだ..
from more_itertools import distinct_permutations

N, K = map(int, input().split())
S = input().strip()
ans = 0

for arr in distinct_permutations(S):
    ok = True
    for i in range(N - K + 1):
        f = True
        for j in range(K):
            if arr[i + j] != arr[i + K - 1 - j]:
                f = False
                break
        if f:
            ok = False
            break
    if ok:
        ans += 1

print(ans)