# ビット全探索
# N個のアイテムaからいくつか選んで重さの和がWになるかを判定する。

N = 8
W = 100
a = [10, 20, 30, 40, 50, 60, 70, 80]

exist = false
(1 << N).times do |bit|
  sum = 0
  N.times do |i|
    sum += a[i] if bit & (1 << i) != 0
  end

  if sum == W
    exist = true
    break
  end
end

puts(exist ? 'Yes' : 'No')
