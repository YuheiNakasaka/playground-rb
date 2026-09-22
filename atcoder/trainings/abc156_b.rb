# frozen_string_literal: true
# https://atcoder.jp/contests/abc156/tasks/abc156_b
#
# ■考えたこと
#
# ■解説
#
n, k = gets.chomp.split(' ').map(&:to_i)

i = 0
loop do
  break if n.zero?

  i += 1
  n /= k
end

puts i
