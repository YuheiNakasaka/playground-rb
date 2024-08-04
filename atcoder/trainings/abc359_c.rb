# frozen_string_literal: true

# https://atcoder.jp/contests/abc359/tasks/abc359_c
#
# ■考えたこと
#
# ■解説
#
sx, sy = gets.split.map(&:to_i)
tx, ty = gets.split.map(&:to_i)
sx -= 1 if (sx + sy).odd?

tx -= 1 if (tx + ty).odd?

dx = (sx - tx).abs
dy = (sy - ty).abs

puts (dy + [dx, dy].max) / 2
