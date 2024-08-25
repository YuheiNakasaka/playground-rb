# frozen_string_literal: true

# https://atcoder.jp/contests/abc365/tasks/abc365_c
#
# ■考えたこと
#
# ■解説
#
n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i).sort
sum = a.sum
b = Array.new(n + 1, 0)
n.times do |i|
  b[i + 1] = b[i] + a[i]
end

if sum <= m
  puts 'infinite'
  exit
end

# p a, b
l = 0
r = a.last
ans = -1
loop do
  mid = (l + r) / 2
  index = a.bsearch_index { |x| x > mid } || n
  v = b[index] + (n - index) * mid
  # p "l: #{l}, r: #{r}, mid: #{mid}, index: #{index}, v: #{v}"
  if v < m
    l = mid
  else
    r = mid
  end

  next unless r - l <= 1

  index_l = a.bsearch_index { |x| x > l } || n
  vl = b[index_l] + (n - index_l) * l
  index_r = a.bsearch_index { |x| x > r } || n
  vr = b[index_r] + (n - index_r) * r

  ans = if vr > m
          l
        elsif m - vl < m - vr
          l
        else
          r
        end
  break
end

# puts l, r
puts ans
