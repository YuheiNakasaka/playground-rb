# frozen_string_literal: true

# https://atcoder.jp/contests/abc329/tasks/abc329_d
#
# ■考えたこと
#
# ■解説
#
n, m = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
h = {}
prev_top = [0, 0]
ans = []
m.times do |i|
  h[A[i]] ||= 0
  h[A[i]] += 1
  if prev_top[0] < h[A[i]]
    prev_top = [h[A[i]], A[i]]
    ans << A[i]
  elsif prev_top[0] == h[A[i]]
    ans << if prev_top[1] < A[i]
             prev_top[1]
           else
             prev_top = [h[A[i]], A[i]]
             A[i]
           end
  else
    ans << prev_top[1]
  end
end

ans.size.times do |i|
  puts ans[i]
end
