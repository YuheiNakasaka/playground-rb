# https://atcoder.jp/contests/abc177/tasks/abc177_c
#
# ■考えたこと
# 組み合わせをN*logNで求めてAi*Ajの計算をmodで行なって足していけばOK?
# これは普通にやるとO(N)+O(N/2)でTLEする。
# Aのsumを事前に求めてそれからAiを引いたやつと掛け算したものを足していけばOKでは？
# ■解説
#
# N = 2 * 10 ** 5
# A = N.times.map { rand(10 ** 9) }
N = gets.to_i
A = gets.split.map(&:to_i)
MOD = 10 ** 9 + 7
ans = 0
sum = A.sum
N.times do |i|
  ans += (A[i] * (sum - A[i])) % MOD
  sum = sum - A[i]
end

puts(ans % MOD)
