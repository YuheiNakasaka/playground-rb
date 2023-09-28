# https://atcoder.jp/contests/abc280/tasks/abc280_d
#
# ■考えたこと
# Kに含まれる素因数が全て含まれるN!の中で最小のNを求める。
# 各素因数ごとに最低でも幾つのN!が必要か調べる方法あれば良さそう。
# ■解説
#
require 'prime'
k = gets.to_i
primes = k.prime_division
ans = primes.map! do |prime, cnt|
  arr = Array.new(cnt + 1) { _1 }
  arr.map! do |i|
    x = 1
    s = 0
    while x <= i
      s += i / x
      x *= prime
    end
    s
  end
  arr.index { _1 >= cnt } * prime
end.max
puts ans
