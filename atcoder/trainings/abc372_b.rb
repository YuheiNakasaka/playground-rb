# frozen_string_literal: true

# https://atcoder.jp/contests/abc372/tasks/abc372_b
#
# ■考えたこと
#
# ■解説
#
m = gets.to_i
bases = 20.times.map { |i| [3**i, i] }.sort_by { |base, _| -base }
ans = []
bases.each do |base, i|
  next unless m >= base

  a = m / base
  a.times { ans << i }
  m -= a * base
end

m.times { ans << 0 } if m > 0

puts ans.size
puts ans.join(' ')
