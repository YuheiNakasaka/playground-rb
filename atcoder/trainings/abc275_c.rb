# frozen_string_literal: true

# https://atcoder.jp/contests/abc275/tasks/abc275_c
#
# ■考えたこと
# ポーンの位置の集合から4つ選んだ時の組み合わせについて全探索する。
# 正方形の判定条件はある1点Oを選び、その点と他の2点の距離d1,d2が等しく、残りの点との距離d3がd1もしくはd2の√2倍の関係にあること。
# ■解説
#
powns = []
9.times do |i|
  s = gets.chomp.split('')
  9.times do |j|
    powns << [i, j] if s[j] == '#'
  end
end

ans = 0
powns.combination(4).each do |pown|
  o = pown[0]
  others = pown.reject { |p| p == o }
  d1 = (o[0] - others[0][0]).pow(2) + (o[1] - others[0][1]).pow(2)
  d2 = (o[0] - others[1][0]).pow(2) + (o[1] - others[1][1]).pow(2)
  d3 = (o[0] - others[2][0]).pow(2) + (o[1] - others[2][1]).pow(2)
  d4 = (others[0][0] - others[1][0]).pow(2) + (others[0][1] - others[1][1]).pow(2)
  d5 = (others[0][0] - others[2][0]).pow(2) + (others[0][1] - others[2][1]).pow(2)
  d6 = (others[1][0] - others[2][0]).pow(2) + (others[1][1] - others[2][1]).pow(2)
  ds = [d1, d2, d3, d4, d5, d6].sort
  ans += 1 if ds[0] == ds[1] && ds[1] == ds[2] && ds[2] == ds[3] && ds[4] == ds[5] && ds[0] * 2 == ds[4]
end

puts ans
