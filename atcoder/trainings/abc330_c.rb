# frozen_string_literal: true

# https://atcoder.jp/contests/abc330/tasks/abc330_c
#
# ■考えたこと
#
# ■解説
#
D = gets.to_i
ans = 10**12
Math.sqrt(D).floor.downto(0) do |i|
  i2 = i**2
  j1 = Math.sqrt((D - i2)).ceil**2
  j2 = Math.sqrt((D - i2)).floor**2
  ans = [(i2 + j1 - D).abs, ans].min
  ans = [(i2 + j2 - D).abs, ans].min
  break if ans.zero?
end

puts ans
