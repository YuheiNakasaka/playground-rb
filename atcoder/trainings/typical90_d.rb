# https://atcoder.jp/contests/typical90/tasks/typical90_d
#
# 行の和と列の和の配列を用意して、ijの行の和の値 + ijの列の和の値 - ijのマスの値を計算すれば良さそう

# 普通に解けた。解説。
# https://twitter.com/e869120/status/1378115289649348611/photo/1

H, W = gets.split.map(&:to_i)
a = Array.new(H) { Array.new(W, 0) }

H.times do |i|
  row = gets.split.map(&:to_i)
  W.times do |j|
    a[i][j] = row[j]
  end
end

# 行の和
rowSum = Array.new(H, 0)
H.times do |i|
  rowSum[i] = a[i].sum
end

# 列の和
b = a.transpose
colSum = Array.new(W, 0)
W.times do |i|
  colSum[i] = b[i].sum
end

# 合計の計算
ans = Array.new(H) { Array.new(W, 0) }
H.times do |i|
  r = rowSum[i]
  W.times do |j|
    c = colSum[j]
    ans[i][j] = r + c - a[i][j]
  end

  puts(ans[i].join(" "))
end
