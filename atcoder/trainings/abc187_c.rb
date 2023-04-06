# https://atcoder.jp/contests/abc187/tasks/abc187_c
#
# ■考えたこと
#
# ■解説
#
N = gets.to_i
h = {}
S = []
N.times do |i|
  s = gets.chomp
  S << s
  h["#{s}"] = true
end

N.times do |i|
  if h[S[i]] && h["!" + S[i]]
    puts(S[i])
    exit
  end
end

puts("satisfiable")
