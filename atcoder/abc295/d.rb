# 嬉しい列判定をどうやるか
# -> (l, r)の間の列LでSetをとり、そのSetした個数が偶数でかつL以下になるかで判定できる
# -> (偶数か？, setの個数はLの半分) 12341234 => 8個 4個, 123456 => 6個 6個, 1111 => 4個 1個
# -> だめ
# 嬉しい列を作る(l,r)の組はSにいくつあるか
# -> l,rの組の選び方を工夫したい
# ->シャクトリをどう生かすかがわからん
#
# 解説
# 偶奇性に着目する問題だった。
# 各数字の個数の偶奇が等しくなるパターンの中からnC2選ぶことをiの数だけやって数え上げる
# https://atcoder.jp/contests/abc295/editorial/6034

# # S = (10 ** 4).times.map { rand(1...10) }.join.to_s
# S = gets.chomp.split("")
# acc = Array.new(10) { Array.new(S.size + 1, 0) }
# S.size.times do |i|
#   10.times do |j|
#     acc[j][i + 1] = acc[j][i]
#   end

#   acc[S[i].to_i][i + 1] = acc[S[i].to_i][i] + 1
# end

# l = 0
# r = 0
# ans = 0
# while l < S.size
#   h = {}
#   kind = 0
#   ok = 0
#   while r < S.size
#     if h[S[r]].nil?
#       h[S[r]] = 0
#       kind += 1
#     end

#     h[S[r]] += 1
#     h[S[r]] % 2 == 0 ? ok += 1 : ok -= 1
#     if ok == 0
#       ans += 1
#     end

#     r += 1
#   end

#   l += 1
#   r = l
# end

# puts(ans)

S = gets.chomp

cnt = Array.new(1 << 10, 0)
bit = 0
cnt[bit] += 1

S.each_char do |c|
  bit ^= 1 << c.to_i
  p(format("%010b", bit))
  cnt[bit] += 1
end

ans = 0
(1 << 10).times do |i|
  c = cnt[i]
  ans += c * (c - 1) / 2
end

puts(ans)
