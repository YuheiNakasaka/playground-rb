# https://atcoder.jp/contests/abc306/tasks/abc306_d
#
# ■考えたこと
# DPか累積和か。mexの組を数え上げられれば良いかと思ったが、n^3通り出てくるからダメでは。
# ■解説
# https://atcoder.jp/contests/abc308/editorial/6708
def mex(a, b, c)
  3.times do |i|
    return i if a != i && b != i && c != i
  end

  return 3
end

n = gets.to_i
a = gets.split.map(&:to_i)
s = gets.chomp.split("")

ans = 0
[0, 1, 2].repeated_permutation(3).each do |perm|
  cnt_mex = [0, 0, 0]
  s.each_with_index do |c, i|
    if c == "M" && perm[0] == a[i]
      cnt_mex[0] += 1
    elsif c == "E" && perm[1] == a[i]
      cnt_mex[1] += cnt_mex[0]
    elsif c == "X" && perm[2] == a[i]
      cnt_mex[2] += cnt_mex[1]
    end
  end

  p("perm: #{perm}, cnt_mex: #{cnt_mex}")
  ans += cnt_mex[2] * mex(perm[0], perm[1], perm[2])
end

puts(ans)
