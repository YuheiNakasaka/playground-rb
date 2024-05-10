# frozen_string_literal: true
# https://atcoder.jp/contests/abc350/tasks/abc350_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
A = gets.split.map(&:to_i)

h = {}
n.times do |i|
  h[A[i]-1] = i
end

anses = []
n.times do |v|
  i = h[v]
  j = v
  next if i == j

  anses << [j+1, i+1]
  tmp = A[j]
  h[v] = j
  h[tmp-1] = i
  A[j] = A[i]
  A[i] = tmp
end

puts anses.size
anses.each do |ans|
  puts ans.join(' ')
end

# puts A.join(' ')
