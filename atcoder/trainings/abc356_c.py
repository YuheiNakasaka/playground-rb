N, M, K = map(int, input().split())
tests = []

for _ in range(M):
    arr = input().split()
    first = int(arr[0])
    nums = list(map(int, arr[1:-1]))
    r = arr[-1]
    tests.append((first, nums, r))

ans = 0

for bit in range(1 << N):
    is_valid = True
    for test in tests:
        _, a, r = test
        k = sum(1 for ai in a if bit & (1 << (ai - 1)) != 0)

        if (k >= K and r == 'o') or (k < K and r == 'x'):
            continue
        else:
            is_valid = False
            break

    if is_valid:
        ans += 1

print(ans)
