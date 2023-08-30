# https://atcoder.jp/contests/abc317/tasks/abc317_d
#
# ■考えたこと
# NとZでDPしたらいける？必要な支持者数を最小にする。
# 選挙区 x 獲得議席数でDPテーブルを作り、ある獲得議席数を得るために必要な候補者の鞍替え数を最小化するように更新していく。
# 作成したDPテーブルのうち選挙区全体の過半数となる議席数以上の中から最小の値になるものを探し出力すればOK。
# ■解説
#
n = gets.to_i
x = Array.new(n)
y = Array.new(n)
z = Array.new(n)
n.times do |i|
  x[i], y[i], z[i] = gets.split.map(&:to_i)
end

INF = 10 ** 18
dp = Array.new(n + 1) { Array.new(10 ** 5 + 2, INF) }
dp[0][0] = 0

1.upto(n) do |i|
  d = 0
  if x[i - 1] < y[i - 1]
    d = ((x[i - 1] + y[i - 1]) / 2) + 1 - x[i - 1]
  end

  dp[i].size.times do |j|
    dp[i][j] = dp[i - 1][j]
    if j - z[i - 1] >= 0 && dp[i - 1][j - z[i - 1]] + d < dp[i][j]
      dp[i][j] = dp[i - 1][j - z[i - 1]] + d
    end
  end
end

t = (z.sum / 2) + 1
min = INF
1.upto(n) do |i|
  t.upto(dp[i].size - 1) do |j|
    if dp[i][j] < min
      min = dp[i][j]
    end
  end
end

puts(min)
