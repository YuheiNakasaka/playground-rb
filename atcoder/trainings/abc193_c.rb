# https://atcoder.jp/contests/abc193/tasks/abc193_c
#
# ■考えたこと
# N<=10^10だと2^34未満。最大で10^2程度。さらに(10^5)^2以上はないので調べる数は10^5程度。
# 2^2,2^3,2^4,...100000^2=(10^10)まで数え上げてNから引けば良さそう
# ■解説
# https://atcoder.jp/contests/abc193/editorial/808
require "set"

N = gets.to_i
set = Set.new([])
2.upto(10 ** 5) do |a|
  b = 2
  x = 1
  while x <= N
    x = a.pow(b)
    if x <= N
      set.add(x)
    end

    b += 1
  end
end

puts(N - set.size)
