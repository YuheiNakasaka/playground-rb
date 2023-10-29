# frozen_string_literal: true

# https://atcoder.jp/contests/abc326/tasks/abc326_c
#
# ■考えたこと
#
# ■解説
#
n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i).sort
left = 0
right = 0
ans = 0
while right < n
  right += 1 while left < n && right < n && a[right] - a[left] < m
  ans = [ans, right - left].max
  left += 1
end

puts ans
