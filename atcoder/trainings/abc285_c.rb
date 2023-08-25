# https://atcoder.jp/contests/abc285/tasks/abc285_c
#
# ■考えたこと
# 26進数を考えれば良さそう
# ■解説
#
s = gets.chomp
dict = ("A".."Z").to_a.each_with_index.map { |k, v| [k, v + 1] }.to_h
a = 0
ans = 0
(s.size - 1).downto(0) do |i|
  ans += dict[s[i]] * 26 ** a
  a += 1
end

puts(ans)
