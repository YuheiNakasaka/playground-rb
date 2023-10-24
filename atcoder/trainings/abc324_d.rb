# frozen_string_literal: true

# https://atcoder.jp/contests/abc324/tasks/abc324_d
#
# ■考えたこと
# 13桁以内の数だと平方数は10**7以下の個数に収まる。与えられたN個の数列からそれらの平方数が作れるかを一つづつ確認していけば良いのではないか。
# ■解説
#
n = gets.to_i
s = gets.chomp.split('').map(&:to_i)
s.sort!
s.map!(&:to_s)
max = 10**n
i = 0
ans = 0
while i * i < max
  t = format("%0#{n}d", i * i)
  t = t.split('').sort
  ans += 1 if s == t
  i += 1
end

puts ans
