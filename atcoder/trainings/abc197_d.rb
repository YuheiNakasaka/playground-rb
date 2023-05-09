# https://atcoder.jp/contests/abc197/tasks/abc197_d
#
# ■考えたこと
# 正N角形を半分に分割して、A(x0,y0)B(x1,y1)C(xN/2,yN/2)とする。
# 角AOBは90度である。
# 正N角形なので全ての点は円上にある。
# 余弦定理でB(x1,y1)を変数として全探索すればいける？ => だめ。Bは必ずしも整数はないので。
# ■解説
# p(x0,y0)を360/N回転させた点がp(x1,y1)となる。
# https://atcoder.jp/contests/abc197/editorial/996
# https://blog.hamayanhamayan.com/entry/2021/03/27/224742
N = gets.to_i
x0, y0 = gets.split.map(&:to_i)
xn_2, yn_2 = gets.split.map(&:to_i)

# 回転行列を用いた回答
# # 中点
# ox = (xn_2 + x0) / 2.0
# oy = (yn_2 + y0) / 2.0
# # 中点を原点に移動した時のp0の座標
# xo2 = x0 - ox
# yo2 = y0 - oy
# # p1は360/Nだけ移動した点
# rad = (360 / N.to_f) * (Math::PI / 180)
# cos = Math.cos(rad)
# sin = Math.sin(rad)
# # 回転行列でp1の座標を求める
# x2 = xo2 * cos - yo2 * sin + ox
# y2 = xo2 * sin + yo2 * cos + oy
# puts("#{x2} #{y2}")

# 複素数を用いた回答
# 中点の複素数表現
m = Complex((xn_2 + x0) / 2.0, (yn_2 + y0) / 2.0)
# aの複素数表現
a = Complex(x0 - m.real, y0 - m.imag)
# 長さ1、角度360/N=2pi/Nの複素数表現
r = Complex.polar(1, Math::PI * 2.0 / N)
# θ回転させたいとき、回転させたい複素平面の座標に偏角θの単位ベクトルをかければよい
res = m + a * r
puts("#{res.real} #{res.imag}")
