# https://atcoder.jp/contests/abc185/tasks/abc185_c
#
# ■考えたこと
# L-1C11
# ■解説
#
L = gets.to_i

ans = 1
b = 11 * 10 * 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1
0.upto(10) do |i|
  ans *= L - 1 - i
end

puts(ans / b)
