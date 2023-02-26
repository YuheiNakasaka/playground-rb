# https://atcoder.jp/contests/abc291/tasks/abc291_d
#
# 2^N通りの組み合わせはNが10^5なのでTLEになる
# 深さ優先探索していくだけじゃダメか？
#
# わからん。解説。
# https://atcoder.jp/contests/abc291/editorial/5838
# DPだ...

MOD = 998244353
N = gets.to_i
ab = []
N.times do |i|
  ab << gets.split.map(&:to_i)
end

dp = Array.new(N) { [0, 0] }
dp[0] = [1, 1]

1.upto(N - 1) do |i|
  2.times do |pre|
    2.times do |nxt|
      if ab[i - 1][pre] != ab[i][nxt]
        dp[i][nxt] += dp[i - 1][pre]
      end
    end
  end

  dp[i][0] %= MOD
  dp[i][1] %= MOD
end

puts((dp[N - 1][0] + dp[N - 1][1]) % MOD)
