# https://atcoder.jp/contests/abc286/tasks/abc286_d
#
# ■考えたこと
# 普通のdpか？
# coinsがO(50*50)でxが10**4なのでdpはO(50*50*10**4)で3secなら間に合うはず。
# 計算量が微妙に間に合わない感じ。C++なら通りそう。
# すでにtrueになっているところはすぐnextするようにしたら通った。
# ■解説
#
n, x = gets.chomp.split(" ").map(&:to_i)
coins = []
n.times do
  i, j = gets.chomp.split(" ").map(&:to_i)
  j.times do
    coins << i
  end
end

dp = Array.new(coins.length) { Array.new(10 ** 4 + 1, false) }
dp[0][coins[0]] = true

dp.size.times do |i|
  dp[0].size.times do |j|
    if dp[i - 1][j]
      dp[i][j] = true
      next
    end

    if coins[i] == j
      dp[i][j] = true
      next
    end

    if i - 1 >= 0 && j - coins[i] >= 0 && dp[i - 1][j - coins[i]]
      dp[i][j] = true
    end
  end
end

puts(dp[-1][x] ? "Yes" : "No")
