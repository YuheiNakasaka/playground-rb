# frozen_string_literal: true

# https://atcoder.jp/contests/abc274/tasks/abc274_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
an = gets.split.map(&:to_i)
record = Array.new(2 * n + 1 + 1, 0)
record[1] = 0
1.upto(n) do |i|
  a = an[i - 1]
  record[2 * i] = record[a] + 1
  record[2 * i + 1] = record[a] + 1
end

record[1..(2 * n + 1)].each do |r|
  puts r
end
