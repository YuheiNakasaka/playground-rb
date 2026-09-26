# frozen_string_literal: true
# https://atcoder.jp/contests/abc157/tasks/abc157_b
#
# ■考えたこと
#
# ■解説
#
A = [].tap do |arr|
  3.times do
    arr << gets.chomp.split(' ').map(&:to_i)
  end
end
N = gets.to_i
B = []
N.times do |_|
  B << gets.to_i
end

B.each do |b|
  3.times do |i|
    3.times do |j|
      A[i][j] = 'x' if A[i][j] == b
    end
  end
end

res = false

3.times do |i|
  if A[i][0] == 'x' &&
    A[i][1] == 'x' &&
    A[i][2] == 'x'
    res = true
  end
end

3.times do |i|
  if A[0][i] == 'x' &&
    A[1][i] == 'x' &&
    A[2][i] == 'x'
    res = true
  end
end

if A[0][0] == 'x' &&
  A[1][1] == 'x' &&
  A[2][2] == 'x'
  res = true
end
if A[0][2] == 'x' &&
  A[1][1] == 'x' &&
  A[2][0] == 'x'
  res = true
end

puts res ? 'Yes' : 'No'
