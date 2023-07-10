# https://atcoder.jp/contests/abc306/tasks/abc306_d
#
# ■考えたこと
# 普通のDPかな
# ■解説
#
n = gets.to_i
x = Array.new(n)
y = Array.new(n)
n.times do |i|
  a, b = gets.split.map(&:to_i)
  x[i] = a
  y[i] = b
end

dp = Array.new(n + 1) { Array.new(2, 0) }
n.times do |i|
  if x[i] == 0
    dp[i + 1][0] = [dp[i][0] + 0, dp[i][0] + y[i], dp[i][1] + y[i]].max
    dp[i + 1][1] = dp[i][1]
  else
    dp[i + 1][0] = dp[i][0]
    dp[i + 1][1] = [dp[i][1] + 0, dp[i][0] + y[i]].max
  end
end

puts([dp[n][0], dp[n][1]].max)
