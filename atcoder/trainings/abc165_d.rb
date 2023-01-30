# https://atcoder.jp/contests/abc165/tasks/abc165_d

A, B, N = gets.split.map(&:to_i)

# ナイーブな実装
# N <= 10**12なのでTLEになる
# どうやったら計算回数を減らせるかを考える
# ans = -10 ** 18
# (N + 1).times do |x|
#   res = (A * x / B).floor - A * (x / B).floor
#   puts("A: #{A} B: #{B} x: #{x} floor(x/B): #{(x / B).floor} res: #{res}")
#   if res > ans
#     ans = res
#   end
# end

# p(ans)

# 実験した感じだと
# B <= N の時はx=B-1で最大になりそう
# N < B の時はx=Nで最大になりそう
if B <= N
  puts((A * (B - 1) / B).floor - A * ((B - 1) / B).floor)
else
  puts((A * N / B).floor - A * (N / B).floor)
end
