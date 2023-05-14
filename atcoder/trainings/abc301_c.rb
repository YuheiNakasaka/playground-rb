# https://atcoder.jp/contests/abc301/tasks/abc301_c
#
# ■考えたこと
#
# ■解説
#
# src = ("a".."z").to_a + ["@"]
# S = []
# T = []
# (10 ** 5).times { S << src.sample }
# (10 ** 5).times { T << src.sample }

S = gets.chomp.chars
T = gets.chomp.chars
sh = {}
th = {}
(("a".."z").to_a + ["@"]).each do |c|
  sh[c] = 0
  th[c] = 0
end

S.each do |c|
  sh[c] += 1
end

T.each do |c|
  th[c] += 1
end

"atcoder".chars.each do |c|
  m = [sh[c], th[c]].max
  if sh["@"] < m - sh[c] || th["@"] < m - th[c]
    puts("No")
    exit
  end

  sh["@"] -= m - sh[c]
  sh[c] = m
  th["@"] -= m - th[c]
  th[c] = m
end

sh == th ? puts("Yes") : puts("No")
