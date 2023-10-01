# https://atcoder.jp/contests/abc322/tasks/abc322_c
#
# ■考えたこと
# 累積和でi日目から次花火が上がるまでの日数を求めれば終わり
# ■解説
#
n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
ans = []
idx = 0
n.times do |i|
  ans << (a[idx] - 1) - i
  idx += 1 if (a[idx] - 1) <= i
end

ans.each do |b|
  puts b
end
