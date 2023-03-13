# https://atcoder.jp/contests/abc168/tasks/abc168_c
#
# ■考えたこと
# 短針と長針のなす角度を求められれば余弦定理を使って長さを求められる。
# 短針は1時間で360/12=30度、長針は1時間で360/60=6度動く。
# 例えば9:00の時は9*30=270度、長針は0*6=0=360度。よってなす角は(270-360).abs=90度。
# ■解説
#
A, B, H, M = gets.split.map(&:to_i)
# 秒間に動く短針の角度
hang = 360 * (1 / (12 * 60 * 60.0))
# 秒間に動く長針の角度
mang = 360 * (1 / (60 * 60.0))

h = (H * 60 * 60 + M * 60) * hang
m = (M * 60) * mang
m1, m2 = [m, h].sort
r = m2 - m1
if r > 180
  r = 360 - r
end

puts(Math.sqrt(A ** 2 + B ** 2 - 2 * A * B * Math.cos(r * Math::PI / 180)))
