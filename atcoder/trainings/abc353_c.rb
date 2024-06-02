# frozen_string_literal: true

# https://atcoder.jp/contests/abc353/tasks/abc353_c
#
# ■考えたこと
#
# ■解説
#
D = 10**8
N = gets.to_i
A = gets.split.map(&:to_i)
A.sort!

ans = (N - 1) * A.sum

cnt = 0
A.each_with_index do |a, i|
  r = A[i + 1..].bsearch_index { _1 + a >= D }
  cnt += r ? N - r - (i + 1) : 0
end

puts ans - cnt * D
