# frozen_string_literal: true

# https://atcoder.jp/contests/abc346/tasks/abc346_c
#
# ■考えたこと
#
# ■解説
require 'set'
n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
a = Set.new(a)
a = a.sort

ans = 0
first = 1
last = 1
a.length.times do |i|
  if first == a[i] - 1
    ans += first
  elsif first > a[i] - 1
  else
    last = [a[i] - 1, k].min
    l = last - first + 1
    ans += l * (first + last) / 2
  end
  first = a[i] + 1
  break if first > k
end

if first <= k
  l = k - first + 1
  ans += l * (first + k) / 2
end

puts ans
