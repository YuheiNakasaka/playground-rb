# https://atcoder.jp/contests/abc196/tasks/abc196_c
#
# ■考えたこと
#
# ■解説
#
N = gets.chomp
ans = 0
1.upto(N.size) do |i|
  next if i % 2 != 0
  if i == N.size
    ans += N[0...(N.size / 2)].to_i <= N[(N.size / 2)...N.size].to_i ? N[0...(N.size / 2)].to_i - 10.pow(N.size / 2 - 1) + 1 : N[0...(N.size / 2)].to_i - 10.pow(N.size / 2 - 1)
  else
    ans += 10.pow(i / 2) - 10.pow(i / 2 - 1)
  end
end

puts(ans)
