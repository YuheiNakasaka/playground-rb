# frozen_string_literal: true
# https://atcoder.jp/contests/abc343/tasks/abc343_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
ans = 1
1.upto(10**6) do |i|
  k = i.pow(3)
  s = k.to_s
  break if k > n
  sl = s.size
  flag = true
  (sl / 2).times do |j|
    unless s[j] == s[sl - j - 1]
      flag = false
      break
    end
  end
  if flag
    ans = k
  end
end
puts ans