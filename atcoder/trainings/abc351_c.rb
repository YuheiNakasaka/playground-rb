# frozen_string_literal: true

# https://atcoder.jp/contests/abc351/tasks/abc351_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
A = gets.split.map(&:to_i)
rows = []
n.times do |i|
  rows << A[i]
  next if A.length <= 1

  while rows.length > 1 && rows[-1] == rows[-2]
    x = rows.pop
    rows.pop
    rows << x + 1
  end
end

puts rows.length
