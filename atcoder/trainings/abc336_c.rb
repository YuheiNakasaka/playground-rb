# frozen_string_literal: true

# https://atcoder.jp/contests/abc336/tasks/abc336_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i - 1
a = 0
i = 0
while n.positive?
  a += (n % 5) * 10**i
  i += 1
  n /= 5
end
puts a * 2
