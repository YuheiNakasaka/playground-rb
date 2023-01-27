# 累積和
# 適切な前処理をしておくことで、配列上の区間の総和を求めるクエリを爆速で処理できるようになる手法
# 事前に配列の累積和を求めておくことで、区間の総和を求めるクエリをO(1)で処理できる
#
# 典型問題: https://qiita.com/drken/items/56a6b68edef8fc605821
# a0~anからK個の連続する整数の和の最大値を求める

INF = 2 ** 60
N = 5
K = 3
a = [2, 5, -4, 10, 3]

# s[0] = 0なのでN + 1個の要素を持つ配列を用意して、累積和を前計算しておく
s = Array.new(N + 1, 0)
N.times do |i|
  s[i + 1] = s[i] + a[i]
end

res = -INF
(N - K + 1).times do |i|
  val = s[K + i] - s[i]
  if res < val
    res = val
  end
end

puts(res)
