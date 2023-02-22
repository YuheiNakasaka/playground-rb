# https://atcoder.jp/contests/typical90/tasks/typical90_t
# 流石にこの問題は自明っぽい
#
# 解説
# https://twitter.com/e869120/status/1385001057512693762/photo/1
a, b, c = gets.split.map(&:to_i)
puts(a < c ** b ? "Yes" : "No")
