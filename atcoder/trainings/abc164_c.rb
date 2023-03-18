# https://atcoder.jp/contests/abc164/tasks/abc164_c
#
# ■考えたこと
# Setに入れて個数を数えるだけ。簡単すぎる...
# ■解説
# https://img.atcoder.jp/abc164/editorial.pdf
N = gets.to_i
h = {}
N.times do
  s = gets.chomp
  h[s] ||= 0
end

puts(h.keys.size)
