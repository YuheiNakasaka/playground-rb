# https://atcoder.jp/contests/abc192/tasks/abc192_c
#
# ■考えたこと
# 普通にソートするとO(NlogN)かかり、さらにK番目まで続けるとO(KNlogN)かかる。
# Nが10^9でKが10^5だから普通にやると間に合わなそう。
# Kに関してはO(K)か0(KlogK)くらいならループできそうだから、f(x)の計算の方を0(logN)かO(1)でできれば良さそう。
# しかしやり方が思いつかない...
# ■解説
# あれ？10^9のループって間に合うの？
# => Nは10^9だけど、桁数は10じゃん...何言ってんだ我
# https://atcoder.jp/contests/abc192/editorial/688
N, K = gets.split.map(&:chomp)
fx = N
arr = N.split("")
K.to_i.times do
  fx = arr.sort.reverse.join("").to_i - arr.sort.join("").to_i
  arr = fx.to_s.split("")
end

puts(fx)
