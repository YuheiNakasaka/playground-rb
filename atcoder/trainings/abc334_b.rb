# frozen_string_literal: true

# https://atcoder.jp/contests/abc334/tasks/abc334_b
#
# ■考えたこと
#
# ■解説
#
a, m, l, r = gets.split.map(&:to_i)
l -= a
r -= a
puts (r / m - (l - 1) / m)
