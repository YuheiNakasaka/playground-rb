# https://atcoder.jp/contests/abc278/tasks/abc278_e
#
# ■考えたこと
#
# ■解説
#
H, W, n, h, w = gets.split.map(&:to_i)

min_x = Array.new(n, H + 1)
max_x = Array.new(n, 0)
min_y = Array.new(n, W + 1)
max_y = Array.new(n, 0)

1.upto(H) do |i|
  row = gets.split.map(&:to_i)
  1.upto(W) do |j|
    a = row[j - 1] - 1
    min_x[a] = [min_x[a], i].min
    max_x[a] = [max_x[a], i].max
    min_y[a] = [min_y[a], j].min
    max_y[a] = [max_y[a], j].max
  end
end

anss = Array.new(H - h + 1) { Array.new(W - w + 1, n) }
0.upto(H - h) do |i|
  0.upto(W - w) do |j|
    k = i + h
    l = j + w
    ans = n
    n.times do |a|
      ans -= 1 if i < min_x[a] && max_x[a] <= k && j < min_y[a] && max_y[a] <= l
    end
    anss[i][j] = ans
  end
end

anss.each do |ans|
  puts ans.join(' ')
end
