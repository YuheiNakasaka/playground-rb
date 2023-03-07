# https://atcoder.jp/contests/abc175/tasks/abc175_c
#
# ■考えたこと
# 偶奇性に注目する問題っぽい？割り算とあまりに注目？条件の数がデカすぎなので算数的に求めるやつ。
# ■解説
# 考え方も合っている。
# https://atcoder.jp/contests/abc175/editorial/52
X, K, D = gets.split.map(&:to_i)

x = X.abs / D
r = X.abs % D

if x <= K
  k = K - x
  if k % 2 == 0
    puts(r)
  else
    puts([(r - D).abs, (r + D).abs].min)
  end
else
  puts(X.abs - K * D)
end
