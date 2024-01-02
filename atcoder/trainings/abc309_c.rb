# frozen_string_literal: true

# https://atcoder.jp/contests/abc309/tasks/abc309_c
#
# ■考えたこと
#
# ■解説
#
n, k = gets.split.map(&:to_i)
h = Hash.new(0)
days_max = 0
n.times do
  a, b = gets.split.map(&:to_i)
  days_max += b
  h[a] += b
end

ans = 0
days = h.keys.sort
days.unshift(0)
days.each do |day|
  if days_max - h[day] <= k
    ans = day + 1
    break
  end
  days_max -= h[day]
end

puts ans
