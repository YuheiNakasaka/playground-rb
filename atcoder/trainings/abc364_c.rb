# frozen_string_literal: true

# https://atcoder.jp/contests/abc364/tasks/abc364_c
#
# ■考えたこと
#
# ■解説
#
N, x, y = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)
AB = A.zip(B)
AB_A = AB.sort { |a, b| -a[0] <=> -b[0] }
AB_B = AB.sort { |a, b| -a[1] <=> -b[1] }

ans_a = 0
AB_A.each do |a, b|
  x -= a
  ans_a += 1
  break if x < 0
end

ans_b = 0
AB_B.each do |a, b|
  y -= b
  ans_b += 1
  break if y < 0
end

p [ans_a, ans_b].min
