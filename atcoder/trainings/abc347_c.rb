# frozen_string_literal: true

# https://atcoder.jp/contests/abc347/tasks/abc347_c
#
# ■考えたこと
#
# ■解説
#
n, a, b = gets.split.map(&:to_i)
d = gets.split.map(&:to_i)
if d.length == 1
  puts 'Yes'
  exit
end
m = a + b
n.times do |i|
  d[i] = d[i] % m
end
d.sort!
d.uniq!
d.push(d[0] + m)
d.each_cons(2).any? { |x, y| (y - x) > b } ? puts('Yes') : puts('No')
