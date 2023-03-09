# https://atcoder.jp/contests/abc170/tasks/abc170_c
#
# ■考えたこと
# XもNも小さいので全探索から考えたい。Xを基準に+-1して存在するものを出力する。両方ある場合は小さい方を出力する。
# ■解説
#
X, N = gets.split.map(&:to_i)
P = gets.split.map(&:to_i)
h = {}
N.times do |i|
  h[P[i]] = true
end

ans = 10 ** 6
d = 0
100.times do
  l = X - d
  r = X + d
  if !h[r]
    ans = r
  end

  if !h[l]
    ans = l
  end

  break if ans != 10 ** 6
  d += 1
end

puts(N == 0 ? X : ans)
