# https://atcoder.jp/contests/abc287/tasks/abc287_d
S = gets.chomp
T = gets.chomp
sl = S.length
tl = T.length

s2 = []
(tl + 1).times do |x|
  s2 << S[0, x] + S[sl - tl + x, tl - x]
end

p(s2)
T.chars do |c|
  p(c)
end
