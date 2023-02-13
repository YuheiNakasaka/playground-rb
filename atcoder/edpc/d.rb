# https://atcoder.jp/contests/dp/tasks/dp_d
#
# ■考えたこと
# 典型的なナップザック問題
# 遷移式
# dp[i][j] = max(dp[i - 1][j - w[i]] + v[i], dp[i - 1][j])

N, W = gets.split.map(&:to_i)
w = Array.new(N + 1, 0)
v = Array.new(N + 1, 0)
1.upto(N) do |i|
  w[i], v[i] = gets.split.map(&:to_i)
end

dp = Array.new(N + 1) { Array.new(W + 1, 0) }
1.upto(N) do |i|
  0.upto(W) do |j|
    dp[i][j] = dp[i - 1][j]

    if j - w[i] >= 0
      dp[i][j] = [dp[i][j], dp[i - 1][j - w[i]] + v[i]].max
    end
  end
end

p(dp[N][W])
