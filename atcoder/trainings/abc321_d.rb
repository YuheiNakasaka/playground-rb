# https://atcoder.jp/contests/abc321/tasks/abc321_d
#
# ■考えたこと
# 副菜の累積和を計算。副菜をソートして主菜ごとに二分探索。O(nlog(n))くらいでいけそう。
# ■解説
#
n, m, P = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i).sort
sum = Array.new(m + 1, 0)
m.times do |i|
  sum[i + 1] = sum[i] + b[i]
end

ans = 0
n.times do |i|
  d = P - a[i]
  t = b.bsearch_index { |x| x > d }
  # p "i: #{i}, d: #{d}, t: #{t} a[i]: #{a[i]} sum[t]: #{t ? sum[t] : 0}"
  ans += if t.nil?
           sum[m] + a[i] * m
         else
           sum[t] + a[i] * t + P * (m - t)
         end
end

puts ans
