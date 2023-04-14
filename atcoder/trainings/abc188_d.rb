# https://atcoder.jp/contests/abc188/tasks/abc188_d
#
# ■考えたこと
# i日目の合計金額が知りたい。いもす法を使いたいがa,bがデカくで使えない。
# ■解説
# mapでいもす法 or 座標圧縮していもす法
# Mがでかい場合のいもす法っぽいやり方
# pairで(始点,コスト)みたいな感じで配列に入れて点でソートする
# prevとsumを使って前から順に足したりしていくといい
# https://atcoder.jp/contests/abc188/editorial/346
N, C = gets.split.map(&:to_i)
events = []
N.times do |i|
  a, b, c = gets.split.map(&:to_i)
  events << [a, c]
  events << [b + 1, -c]
end

events.sort_by! { |e| e[0] }
ans = 0
sum = 0
prev = 0
events.each do |i, c|
  # i日目が同じプランに関しては(i - prev)が0なのでansは変わらない。なるほど...
  ans += [C, sum].min * (i - prev)
  # ここがいもすの累積和の計算になってる
  sum += c
  prev = i
end

puts(ans)
