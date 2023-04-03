# https://atcoder.jp/contests/abc186/tasks/abc186_c
#
# ■考えたこと
#
# ■解説
#
N = gets.to_i

ans = 0
1.upto(N) do |i|
  if !i.to_s.match(/7/) && !i.to_s(8).match(/7/)
    ans += 1
  end
end

puts(ans)
