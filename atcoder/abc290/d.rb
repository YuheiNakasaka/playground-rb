# https://atcoder.jp/contests/abc290/tasks/abc290_d
#
# 解説。数学だ...
# https://atcoder.jp/contests/abc290/editorial/5767

T = gets.to_i
ans = []
T.times do |i|
  n, d, k = gets.split.map(&:to_i)
  k -= 1
  a = n / n.gcd(d)
  ans << d * k % n + k / a
end

ans.each do |a|
  puts(a)
end
