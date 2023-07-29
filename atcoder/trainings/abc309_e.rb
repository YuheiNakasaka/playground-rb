# https://atcoder.jp/contests/abc309/tasks/abc309_e
#
# ■考えたこと
# Mのクエリごとにlog(n)くらいで処理できるようにしたい。
# 頂点Nから任意の深さまでの頂点数を高速で求める方法はあるか？
# i>=2に対してしかpiが設定されてない+家系(繋がっている)から人1はグラフのrootと考えて良いのかな。
# 人1から巡って行って何かしらのキャッシュを作る方向だろうか。
# BFS/DFSにしてもグラフが綺麗に二分木みたいになってればいいけど、人1から人Nまで一直線になってるような偏った木だと最大でO(NM)になってしまう...
# ■解説
# 木だけどDPみたいな解法だった。
# 上から順に各頂点にて保険の対象範囲になる最大の深さを更新していき、
# 最後に更新された各値をみて-1以外のものを数え上げる。
# 1<=pi<=n-1という制約により自分の親の頂点の保険対象範囲を見れば自分が対象かどうかわかるというのがミソ。
# https://atcoder.jp/contests/abc309/tasks/abc309_e/editorial

n, m = gets.split.map(&:to_i)
pn = gets.split.map(&:to_i)
pn.unshift(1)
pn.unshift(0)

dp = Array.new(n + 1, -1)
m.times do
  x, y = gets.split.map(&:to_i)
  dp[x] = [dp[x], y].max
end

1.upto(n) do |i|
  dp[i] = [dp[i], dp[pn[i]] - 1].max
end

ans = 0
1.upto(n) do |i|
  if dp[i] >= 0
    ans += 1
  end
end

puts(ans)
