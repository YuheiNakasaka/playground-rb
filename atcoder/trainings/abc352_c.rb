# frozen_string_literal: true

# https://atcoder.jp/contests/abc352/tasks/abc352_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
ab = []
a_sum = 0
n.times do
  a, b = gets.split.map(&:to_i)
  ab << [a, b]
  a_sum += a
end

ans = -1
n.times do |i|
  ans = [ans, a_sum - ab[i][0] + ab[i][1]].max
end

puts ans
