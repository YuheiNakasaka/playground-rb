# frozen_string_literal: true

# https://atcoder.jp/contests/abc310/tasks/abc310_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
s = Hash.new(false)
n.times do |i|
  k = gets.chomp
  s[k] = false
end

ans = 0
keys = s.keys
keys.each do |k|
  next if s[k]

  ans += 1
  r_k = k.reverse
  s[r_k] = true
end

puts ans
