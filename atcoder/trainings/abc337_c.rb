# frozen_string_literal: true

# https://atcoder.jp/contests/abc337/tasks/abc337_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
a = gets.split.map(&:to_i)
h = {}
n.times do |i|
  h[a[i]] = i + 1
end

ans = []
i = -1
n.times do
  ans << h[i]
  i = h[i]
end

puts ans.join(' ')
