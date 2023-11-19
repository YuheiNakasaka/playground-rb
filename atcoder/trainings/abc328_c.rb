# frozen_string_literal: true

# https://atcoder.jp/contests/abc328/tasks/abc328_c
#
# ■考えたこと
#
# ■解説
#
n, q = gets.split.map(&:to_i)
s = gets.chomp
acc = Array.new(n, 0)
prev = s[0]
1.upto(n - 1) do |i|
  acc[i] = if prev == s[i]
             acc[i - 1] + 1
           else
             acc[i - 1]
           end
  prev = s[i]
end

ans = []
q.times.map do
  l, r = gets.split.map(&:to_i)
  ans << acc[r - 1] - acc[l - 1]
end

ans.each { |a| puts a }
