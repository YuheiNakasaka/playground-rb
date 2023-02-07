# https://atcoder.jp/contests/nikkei2019-final/tasks/nikkei2019_final_a
#
# 累積和の典型問題
#
# S: [0, 4, 5, 8, 11]
# A: [4, 1, 3, 3]
N = gets.to_i
A = gets.split.map(&:to_i)

i = 0
S = Array.new(N + 1, 0)
while i < N
  S[i + 1] = S[i] + A[i]
  i += 1
end

k = 1
l = 0
while k <= N
  ans = 0
  while l + k <= N
    ans = [S[l + k] - S[l], ans].max
    l += 1
  end

  l = 0
  k += 1
  puts(ans)
end
