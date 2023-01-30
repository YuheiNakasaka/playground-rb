# https://atcoder.jp/contests/abc164/tasks/abc164_d
#
# (i,j)文字目が2019の倍数になる数の個数
# 1817181712114 => 3
# (1,5)(5,9)(9,13)
#
# 2019 = 3 x 673
# 尺取法の応用か？
#
# |S|は最大200000桁

# わからん。解説はこれ。
# https://drken1215.hatenablog.com/entry/2020/04/29/171300
# https://qiita.com/Seika139/items/8cacdb3cc8fa6655573c
#
# S(5, 9) = 18171の時、18171/2019を計算するのではなく下記のようにする
# 181710000 ≡ 181712114 - 2114 ≡ 0 (mod 2019)
# 2019は2も5も含まないので10^4で割れて下記のようにできる
# 18171 ≡ 0 (mod 2019) つまり2019で割り切れる
# であるならば181712114や2114の剰余さえ求められれば良さそう

S = gets.chomp
sl = S.length
mods = Array.new(2019, 0)
fac = 1
current = 0
mods[current] += 1
sl.times do |i|
  # puts("#{current} + #{S[sl - 1 - i].to_i} x #{fac}")
  current = (current + fac * S[sl - 1 - i].to_i) % 2019
  # % 2019しないとTLEになる
  fac = (fac * 10) % 2019
  mods[current] += 1
end

# nC2
res = 0
mods.length.times do |i|
  res += mods[i] * (mods[i] - 1) / 2
end

puts(res)
