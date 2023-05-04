# https://atcoder.jp/contests/abc195/tasks/abc195_c
#
# ■考えたこと
#
# ■解説
# https://atcoder.jp/contests/abc195/editorial/837
N = gets.chomp
ans = 0
3.upto(N.size - 1) do |i|
  if i == N.size - 1
    ans += (N.to_i - 10.pow(i) + 1) * (i / 3)
  else
    ans += (10.pow(i + 1) - 10.pow(i)) * (i / 3)
  end
end

puts(ans)
