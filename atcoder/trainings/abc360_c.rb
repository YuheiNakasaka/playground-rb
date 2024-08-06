# frozen_string_literal: true

# https://atcoder.jp/contests/abc360/tasks/abc360_c
#
# ■考えたこと
#
# ■解説
#
N = gets.to_i
An = gets.split.map(&:to_i)
Wn = gets.split.map(&:to_i)

h = {}
N.times do |i|
  h[An[i]] ||= [0, 0, 0]
  h[An[i]][0] += 1
  h[An[i]][1] += Wn[i]
  h[An[i]][2] = [h[An[i]][2], Wn[i]].max
end

ans = 0
h.each do |k, v|
  cnt, sum, max = h[k]
  ans += sum - max if cnt > 1
end

puts ans
