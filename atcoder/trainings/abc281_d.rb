# https://atcoder.jp/contests/abc281/tasks/abc281_d
#
# ■考えたこと
#
# ■解説
#
n, k, d = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

dp = Array.new(n + 1) { Array.new(k + 1) { Array.new(d, -1) } }

dp[0][0][0] = 0

n.times do |i|
  (k + 1).times do |j|
    d.times do |l|
      next if dp[i][j][l] == -1

      dp[i + 1][j][l] = [dp[i + 1][j][l], dp[i][j][l]].max

      dp[i + 1][j + 1][(l + a[i]) % d] = [dp[i + 1][j + 1][(l + a[i]) % d], dp[i][j][l] + a[i]].max if j != k
    end
  end
end

puts dp[n][k][0]
