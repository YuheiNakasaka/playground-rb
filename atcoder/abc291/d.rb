# https://atcoder.jp/contests/abc291/tasks/abc291_d
#
# 2^N通りの組み合わせはNが10^5なのでTLEになる
# 深さ優先探索していくだけじゃダメか？

MOD = 998244353
N = gets.to_i
ab = []
N.times do |i|
  ab << gets.split.map(&:to_i)
end

ans = 1
cur0 = -1
cur1 = -1
sm = 0
0.upto(N - 1) do |i|
  cnt = 0
  sm = 0
  if ab[i][0] != cur0
    cnt += 1
  else
    sm += 1
  end

  if ab[i][1] != cur0
    cnt += 1
  else
    sm += 1
  end

  if ab[i][0] != cur1
    cnt += 1
  else
    sm += 1
  end

  if ab[i][1] != cur1
    cnt += 1
  else
    sm += 1
  end

  ans *= cnt

  cur0, cur1 = ab[i][0], ab[i][1]
end

puts(ans / sm)
