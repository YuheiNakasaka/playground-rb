# frozen_string_literal: true

# https://atcoder.jp/contests/abc273/tasks/abc273_c
#
# ■考えたこと
#
# ■解説
#
require 'set'
n = gets.to_i
a = gets.split.map(&:to_i)
b = Set.new(a).sort
l = b.length
big = Hash.new(0)
l.times do |i|
  big[b[i]] = l - i - 1
end
hist = Hash.new(0)
a.each do |i|
  hist[big[i]] += 1
end

n.times.map do |i|
  hist[i]
end.each { |i| puts i }
