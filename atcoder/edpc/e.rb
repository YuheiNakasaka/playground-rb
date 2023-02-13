# https://atcoder.jp/contests/dp/tasks/dp_e
#
# ■考えたこと
# d問題と一緒だけどWの制約が10^5から10^9に大きくなっている。あとはvの制約は10^5から10^3と小さくなっている。
# dと同じ解き方だとO(N * W)だから100 * 10^9となってTLEする
# vの制約の小ささはどういうことだろうか？
# 遷移パターンが1つだとダブリングとかが使えるが今回はだめ
# 多分wだった部分をvにすることでO(N * V)にするのだろう。だがどうやってdpにするか...
#
# ■解法
# dp[i+1][sum_v] = max(dp[i][sum_v], dp[i][sum_v - v[i]] + w[i])

N, W = gets.split.map(&:to_i)
w = Array.new(N, 0)
v = Array.new(N, 0)
0.upto(N - 1) do |i|
  w[i], v[i] = gets.split.map(&:to_i)
end

INF = 10 ** 32
max_v = 10 ** 5 + 1
max_n = 10 ** 2 + 1
sum_v = v.inject(:+)
dp = Array.new(max_n) { Array.new(max_v, INF) }
dp[0][0] = 0

0.upto(N - 1) do |i|
  0.upto(max_v - 1) do |j|
    if j - v[i] >= 0
      dp[i + 1][j] = [dp[i + 1][j], dp[i][j - v[i]] + w[i]].min
    end

    if dp[i + 1][j] > dp[i][j]
      dp[i + 1][j] = dp[i][j]
    end
  end
end

max = 0
max_v.times do |sum_v|
  if dp[N][sum_v] <= W
    max = sum_v
  end
end

puts(max)
