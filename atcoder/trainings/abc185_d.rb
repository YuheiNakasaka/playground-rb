# https://atcoder.jp/contests/abc185/tasks/abc185_d
#
# ■考えたこと
#
# ■解説
#
N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort
INF = 10 ** 18
k = INF
a = 0
M.times do |i|
  n = A[i] - a - 1
  if n > 0
    k = [k, n].min
  end

  a = A[i]
end

if k == INF
  k = 1
end

ans = 0
a = 0
M.times do |i|
  n = A[i] - a - 1
  if n > 0
    ans += n % k == 0 ? n / k : n / k + 1
  end

  a = A[i]
end

if a < N
  n = N - a
  if n > 0
    ans += n % k == 0 ? n / k : n / k + 1
  end
end

puts(ans)
