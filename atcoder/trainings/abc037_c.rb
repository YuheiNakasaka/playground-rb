# https://atcoder.jp/contests/abc037/tasks/abc037_c
N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

S = Array.new(N + 1, 0)
N.times do |i|
  S[i + 1] = S[i] + A[i]
end

ans = 0
l = 0
while l < N - K + 1
  ans += S[l + K] - S[l]
  l += 1
end

puts(ans)
