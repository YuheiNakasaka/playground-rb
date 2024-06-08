# frozen_string_literal: true

# https://atcoder.jp/contests/abc354/tasks/abc354_c
#
# ■考えたこと
#
# ■解説
#
N = gets.to_i
aci = []
N.times do |i|
  a, c = gets.split.map(&:to_i)
  aci << [a, c, i + 1]
end

sorted_c_desc = aci.sort_by { |a, c, i| c }

v = 0
s = []
N.times do |i|
  a, c, n = sorted_c_desc[i]
  if a > v
    s << [a, c, n]
    v = a
  end
end

puts s.size
puts s.map { |a, c, n| n }.sort.join(' ')
