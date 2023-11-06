# frozen_string_literal: true

# https://atcoder.jp/contests/abc327/tasks/abc327_c
#
# ■考えたこと
#
# ■解説
#
A = Array.new(9) { Array.new(9) }
9.times do |i|
  A[i] = gets.chomp.split.map(&:to_i)
end

ans = true
9.times do |i|
  h = {}
  9.times do |j|
    h[A[i][j]] = true
  end
  if h.keys.size < 9
    ans = false
    break
  end
end

9.times do |i|
  h = {}
  9.times do |j|
    h[A[j][i]] = true
  end
  if h.keys.size < 9
    ans = false
    break
  end
end

[0, 3, 6].each do |i|
  [0, 3, 6].each do |j|
    h = {}
    3.times do |k|
      3.times do |l|
        h[A[i + k][j + l]] = true
      end
    end
    if h.keys.size < 9
      ans = false
      break
    end
  end
end

puts ans ? 'Yes' : 'No'
