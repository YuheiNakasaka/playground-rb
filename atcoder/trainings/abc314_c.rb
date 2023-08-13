# https://atcoder.jp/contests/abc314/tasks/abc314_c
#
# ■考えたこと
#
# ■解説
#

n, m = gets.split.map(&:to_i)
s = gets.chomp.split("")
c = gets.split.map(&:to_i)
colors = Array.new(m) { [] }
n.times do |i|
  colors[c[i] - 1] << i
end

ans = Array.new(n)
m.times do |i|
  next if colors[i].empty?
  colors[i].size.times do |j|
    ans[colors[i][(j + 1) % colors[i].size]] = s[colors[i][j]]
  end
end

puts(ans.join(""))
