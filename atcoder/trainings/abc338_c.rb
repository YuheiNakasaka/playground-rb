# frozen_string_literal: true

# https://atcoder.jp/contests/abc338/tasks/abc338_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
q = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
inf = 10**18

ans = 0
(q.max + 1).times do |x|
  y = inf
  n.times do |i|
    if q[i] < a[i] * x
      y = -inf
    elsif b[i].positive?
      y = [y, (q[i] - a[i] * x) / b[i]].min
    end
  end
  ans = [ans, x + y].max
end

puts ans
