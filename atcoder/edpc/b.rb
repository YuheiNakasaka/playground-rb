# https://atcoder.jp/contests/dp/tasks/dp_b
#
# A問題の移動が1段または2段の場合をK段に拡張した問題
# 計算量がO(N)だったのがO(NK)になった

N, K = gets.split.map(&:to_i)
h = gets.split.map(&:to_i)
INF = 10 ** 18
dp = Array.new(N, INF)
dp[0] = 0
N.times do |n|
  cost = INF
  1.upto(K) do |i|
    if n - i >= 0
      dp[n] = [(h[n - i] - h[n]).abs + dp[n - i], dp[n]].min
    end
  end
end

puts(dp[N - 1])
