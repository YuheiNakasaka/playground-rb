# https://atcoder.jp/contests/abc318/tasks/abc318_e
#
# ■考えたこと
# Aiを固定してAi=Akになるものを探していく感じかな。
# ただそれだと計算量がO(N^2)になってしまう。累積和でAi=Akになる個数を事前計算するとかでいけないかな。
# Aiの各総和sums = Array.new(n,0)とその累積和 Array.new(n) {Array.new(n,0)}を用意はできそう。
# Ai=AkでAi≠AjなのでAj≠Akでもある。なのでAjを固定し、Ajの時の時点での個数を右側・左側でそれぞれ出せるからあとはそれを掛け算して足せば良さそう。
# でもなかった...。
# というかAjは無視できるのでは。
# ■解説
# k以下のAi=Akの位置の個数 - Ai=Aj=Akの位置の個数
# https://atcoder.jp/contests/abc318/editorial/7094
n = gets.to_i
a = gets.split.map(&:to_i)
sum = Array.new(n + 1, 0)
cnt = Array.new(n + 1, 0)
ans = 0
n.times do |k|
  ans += (k - 1) * cnt[a[k]] - sum[a[k]]
  cnt[a[k]] += 1
  sum[a[k]] += k
end

n.times do |i|
  ans -= cnt[i + 1] * (cnt[i + 1] - 1) * (cnt[i + 1] - 2) / 6
end

puts(ans)
