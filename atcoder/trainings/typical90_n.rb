# https://atcoder.jp/contests/typical90/tasks/typical90_n
#
# ナイーブにAとBをループにして総当たりするとO(N^2)で間に合わない。
#
# ■考えたこと
# 数字の大きい順にソートして大きい数字のAとBを貪欲に選んで差を取って足していくとどうか？

N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

a = A.sort.reverse
b = B.sort.reverse

ans = 0
N.times do |i|
  ans += (a[i] - b[i]).abs
end

puts(ans)
