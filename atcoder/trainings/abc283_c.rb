# https://atcoder.jp/contests/abc283/tasks/abc283_c
#
# ■考えたこと
#
# ■解説
#
s = gets.chomp.chars.map(&:to_i).reverse
s1, s2 = s.shift, nil
ans = 0
while s1.nil?.! || s2.nil?.!
  s2 = s.shift
  if s1 == 0 && s2 == 0
    ans += 1
    s1 = s.shift
  else
    ans += 1
    s1 = s2
  end
end

puts(ans)
