# https://atcoder.jp/contests/abc186/tasks/abc186_d
#
# ■考えたこと
# Aをソート。累積和をとる。aがAの中で何番目かを基点にしてaより大きい方で(sum(A[n+1~N])-na).absを計算する。
# n+1~Nの和は累積和で求めると速い
# ■解説
# 解けた。が、O(N)だと思ってたけどソートしてるからそこでO(NlogN)になってた。
# https://atcoder.jp/contests/abc186/editorial/402
N = gets.to_i
A = gets.split.map(&:to_i).sort
acc = Array.new(N + 1, 0)
N.times do |i|
  acc[i + 1] = acc[i] + A[i]
end

ans = 0
N.times do |i|
  ans += (acc[N] - acc[i + 1] - A[i] * (N - i - 1)).abs
end

puts(ans)
