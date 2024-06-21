# frozen_string_literal: true

# https://atcoder.jp/contests/abc355/tasks/abc355_c
#
# ■考えたこと
#
# ■解説
#
N, T = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
points = {}

# tmp_bingo = Array.new(N) { Array.new(N, 0) }

1.upto(N) do |i|
  1.upto(N) do |j|
    points[N * (i - 1) + j] = [i, j]
    # tmp_bingo[i - 1][j - 1] = (N * (i - 1) + j).to_s.rjust(3, '0')
  end
end

# puts ''
# N.times do |i|
#   puts tmp_bingo[i].join(' ')
# end
# puts ''

bingo_row = Array.new(N + 1, 0)
bingo_col = Array.new(N + 1, 0)
naname_a = 0
naname_b = 0

T.times do |i|
  row, col = points[A[i]]
  bingo_row[row] += 1
  bingo_col[col] += 1
  naname_a += 1 if row == col
  naname_b += 1 if row + col == N + 1

  if bingo_row[row] == N || bingo_col[col] == N || naname_a == N || naname_b == N
    puts i + 1
    exit
  end
end

puts(-1)
