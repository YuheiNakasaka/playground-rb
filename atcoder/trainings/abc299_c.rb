# https://atcoder.jp/contests/abc299/tasks/abc299_c
#
# ■考えたこと
#
# ■解説
#
# S = 100000.times.map { ["o", "-"][rand(2)] }.join("")

N = gets.to_i
S = gets.chomp
ans = -1

if S.include?("-").!
  puts(ans)
  exit
end

S.split("-").each do |s|
  if s[0] == "o"
    ans = [ans, s.size].max
  end
end

puts(ans)
