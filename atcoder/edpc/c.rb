# https://atcoder.jp/contests/dp/tasks/dp_c
# ■考えたこと
# Nが10^5なので全列挙するのは0(3^N)になり無理
# 最大値が知りたいのでdpの初期値は0
# 0日目は0
# 緩和式。同じ活動を2日連続で選べないことに注意
# dp[i][j] = max(dp[i-1][j-1] + X[i], dp[i - 1][j]) -> これだと連続で同じ活動を選んでしまう可能性があるのでだめ
# dp[i] = max(dp[i-1] + A[i], dp[i-1] + B[i], dp[i-1] + C[i]) (前選択したものは選ばない) -> これだとダメなパターンがあるのでは？
# 例えば, 1 2 3
#        5 6 30
# みたいな場合。先のやり方だと9になるがベストは32。
#
# ■実際の解法
# i日目にa,b,cのどれを選んだかによってi+1日目がどうなるかをa,b,cの場合それぞれ計算していく。
# 横軸にa/b/cを持つというやり方があるのか〜となった。

N = gets.to_i
A = []
N.times do
  A << gets.split.map(&:to_i)
end

dp = Array.new(N + 1) { Array.new(3, 0) }
N.times do |i|
  3.times do |j|
    3.times do |k|
      next if j == k
      dp[i + 1][k] = [dp[i + 1][k], dp[i][j] + A[i][k]].max
    end
  end
end

max = 0
3.times do |i|
  max = [max, dp[N][i]].max
end

# p(A)
# p(dp)
p(max)
