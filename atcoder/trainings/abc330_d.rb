# frozen_string_literal: true

# https://atcoder.jp/contests/abc330/tasks/abc330_d
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
g = Array.new(n) { Array.new(n) }
n.times do |i|
  g[i] = gets.chomp.split('')
end

row = Array.new(n)
col = Array.new(n)
n.times do |i|
  cnt = 0
  n.times do |j|
    cnt += 1 if g[i][j] == 'o'
  end
  row[i] = cnt
end
n.times do |i|
  cnt = 0
  n.times do |j|
    cnt += 1 if g[j][i] == 'o'
  end
  col[i] = cnt
end

ans = 0
n.times do |i|
  n.times do |j|
    ans += (row[i] - 1) * (col[j] - 1) if g[i][j] == 'o'
  end
end

puts ans
