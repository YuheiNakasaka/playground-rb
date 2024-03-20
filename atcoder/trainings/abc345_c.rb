# frozen_string_literal: true

# https://atcoder.jp/contests/abc345/tasks/abc345_c
#
# ■考えたこと
#
# ■解説
#
s = gets.chomp.chars
l = s.length
h = Hash.new(0)
hm = Hash.new(0)
s.each do |c|
  h[c] += 1
end

ans = 0
s.each do |c|
  hm[c] += 1
  ans += l - 1 - (h[c] - hm[c])
  l -= 1
end

puts h.values.select { |v| v > 1 }.empty? ? ans : ans + 1
