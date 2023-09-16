# https://atcoder.jp/contests/abc319/tasks/abc319_d
#
# ■考えたこと
#
# ■解説
#
n, m = gets.split.map(&:to_i)
l = gets.split.map(&:to_i)
n.times do |i|
  l[i] += 1
end

lower = l.max - 1
upper = l.sum

while lower + 1 < upper
  mid = (lower + upper) / 2
  rows = 1
  length = 0
  n.times do |i|
    length += l[i]
    if length > mid
      rows += 1
      length = l[i]
    end
  end

  if rows > m
    lower = mid
  else
    upper = mid
  end
end

puts upper - 1
