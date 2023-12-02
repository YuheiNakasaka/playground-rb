# frozen_string_literal: true

# https://atcoder.jp/contests/abc331/tasks/abc331_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
a = gets.split.map(&:to_i)
sums = Array.new(10**6 + 1, 0)
a.each do |i|
  sums[i] += i
end

(sums.size - 1).times do |i|
  sums[i + 1] += sums[i]
end

ans = []
a.each do |i|
  ans << sums[-1] - sums[i]
end

puts ans.join(' ')
