# https://atcoder.jp/contests/typical90/tasks/typical90_r
#
# ■考えたこと
# まず絵を描く
# 制約が10^9なので数理的にQに答えていく感じっぽい
#
# 解説。三角関数の問題。
# https://twitter.com/e869120/status/1384276005330690049/photo/1
T = gets.to_i
L, X, Y = gets.split.map(&:to_i)
Q = gets.to_i
E = []
Q.times do
  E << gets.to_i
end

ans = []
Q.times do |i|
  e = E[i]
  x, y, z = 0, -L / 2.0 * Math.sin(2 * Math::PI * e / T), L / 2.0 - L / 2.0 * Math.cos(2 * Math::PI * e / T)
  xy_l = Math.sqrt(((x - X).abs) ** 2 + ((y - Y).abs) ** 2)
  puts(Math.atan((z / xy_l).to_f) * (180 / Math::PI))
end
