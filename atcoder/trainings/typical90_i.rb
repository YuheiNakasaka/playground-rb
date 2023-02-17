#
# 3点の角の求め方
# - 余弦定理 -> acos -> 弧度法を度数に変換
# 点を3点選ぶ方法
# - 3重ループ
# - O(10**9)くらいになる。3secでも全然間に合わない。オーダーを下げる必要がある。

# わからん。解説。
# https://twitter.com/e869120/status/1380290146340245505/photo/1
# 偏角ソート

# def get_angle(a, b, c)
#   x1, y1 = a
#   x2, y2 = b
#   x3, y3 = c

#   a = Math.sqrt((x2 - x3) ** 2 + (y2 - y3) ** 2)
#   b = Math.sqrt((x1 - x3) ** 2 + (y1 - y3) ** 2)
#   c = Math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2)

#   cos = (a ** 2 + b ** 2 - c ** 2) / (2 * a * b)
#   cos = cos < -1 ? -1 : cos
#   cos = cos > 1 ? 1 : cos
#   angle = Math.acos(cos) * 180 / Math::PI
# end

# N = gets.to_i
# vertex = N.times.map { gets.split.map(&:to_i) }

# ans = 0
# N.times do |i|
#   N.times do |j|
#     N.times do |k|
#       a, b, c = vertex[i], vertex[j], vertex[k]
#       l = get_angle(a, b, c)
#       m = get_angle(b, a, c)
#       n = get_angle(a, c, b)

#       ans = l if ans < l
#       ans = m if ans < m
#       ans = n if ans < n

#       k += 1
#     end

#     j += 1
#   end

#   i += 1
# end

# puts(ans)
