# frozen_string_literal: true

# https://atcoder.jp/contests/abc362/tasks/abc362_c
#
# ■考えたこと
#
# ■解説
#
N = gets.to_i
L = Array.new(N, 0)
R = Array.new(N, 0)
N.times do |i|
  l, r = gets.split.map(&:to_i)
  L[i] = l
  R[i] = r
end

if L.sum.positive? || R.sum.negative?
  puts 'No'
  exit
end

X = L.clone
sum_x = X.sum
N.times do |i|
  d = [R[i] - L[i], -sum_x].min
  sum_x += d
  X[i] += d
end

puts 'Yes'
puts X.join(' ')
