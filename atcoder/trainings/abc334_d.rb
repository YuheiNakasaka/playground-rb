# frozen_string_literal: true

# https://atcoder.jp/contests/abc334/tasks/abc334_d
#
# ■考えたこと
#
# ■解説
#
n, q = gets.split.map(&:to_i)
r = gets.split.map(&:to_i).sort
sums = Array.new(n + 1, 0)
n.times do |i|
  sums[i + 1] = r[i] + sums[i]
end

ans = []
q.times do |i|
  x = gets.to_i
  index = sums.bsearch_index { |e| e > x }
  index = sums.size if index.nil?
  ans << index - 1
end

ans.each do |a|
  puts a
end
