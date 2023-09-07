# https://atcoder.jp/contests/abc318/tasks/abc318_d
#
# ■考えたこと
# bitDPみたいなやつか。
# ■解説
# 方向性はわかったがDPの作り方がわからなかった。dp[i][j][2]みたいな感じにして複雑にしすぎて死んだ。
# https://atcoder.jp/contests/abc318/editorial/7066
n = gets.to_i
d = Array.new(n) { Array.new(n, 0) }
i = 0
(n - 1).times do |i|
  j = i + 1
  a = gets.split.map(&:to_i)
  while j < n
    d[i][j] = a[j - i - 1]
    j += 1
  end
end

dp = Array.new(1 << n, 0)
((1 << n) - 1).times do |b|
  l = -1
  n.times do |i|
    if b >> i & 1 == 0
      l = i
      break
    end
  end

  n.times do |i|
    if b >> i & 1 == 0
      nb = b | (1 << l) | (1 << i)
      dp[nb] = [dp[nb], dp[b] + d[l][i]].max
    end
  end
end

# p(dp)
puts(dp.last)
