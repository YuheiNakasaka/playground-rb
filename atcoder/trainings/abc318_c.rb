# https://atcoder.jp/contests/abc318/tasks/abc318_c
#
# ■考えたこと
#
# ■解説
#
n, d, P = gets.chomp.split.map(&:to_i)
f = gets.chomp.split.map(&:to_i).sort
s = Array.new(n + 1)
s[0] = f[0]
(n - 1).times do |i|
  s[i + 1] = s[i] + f[i + 1]
end

k = (n + d - 1) / d
ans = P * k
k.times do |i|
  ans = [ans, s[n - 1 - (i * d)] + P * i].min
end

puts(ans)
