# frozen_string_literal: true

# https://atcoder.jp/contests/abc339/tasks/abc339_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
a = gets.split.map(&:to_i)

now = 0
n.times do |i|
  now += a[i]

  now = 0 if now.negative?
end

puts now
