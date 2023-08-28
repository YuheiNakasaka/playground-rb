# https://atcoder.jp/contests/abc317/tasks/abc317_c
#
# ■考えたこと
#
# ■解説
#
n, m = gets.split.map(&:to_i)
@g = Array.new(n) { Array.new(n) }
m.times do |i|
  a, b, c = gets.split.map(&:to_i)
  @g[a - 1][b - 1] = c
  @g[b - 1][a - 1] = c
end

max = -1
(0..(n - 1)).to_a.permutation.each do |routes|
  i = 0
  sum = 0
  while i < routes.size - 1
    break if @g[routes[i]][routes[i + 1]].nil?
    sum += @g[routes[i]][routes[i + 1]]
    i += 1
  end

  if max <= sum
    max = sum
  end
end

puts(max)
