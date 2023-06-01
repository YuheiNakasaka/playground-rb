# DP 部分和問題
# nが20ならbit全探索でいけるがnが60なのでだめ。
# 緩和条件
# dp[i][j] = dp[i - 1][j]
# dp[i][j] = j (if dp[i][j - A[i]] + A[i] == j)
# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_r
class Solver
  def initialize
  end

  def solve
    n, s = gets.split.map(&:to_i)
    a = gets.split.map(&:to_i)
    dp = Array.new(n + 1) { Array.new(s + 1, 0) }
    (n + 1).times do |i|
      next if i == 0
      (s + 1).times do |j|
        dp[i][j] = dp[i - 1][j]
        if j - a[i - 1] >= 0 && dp[i - 1][j - a[i - 1]] + a[i - 1] == j
          dp[i][j] = j
        end
      end
    end

    puts(dp[n][s] != 0 ? "Yes" : "No")
  end
end

Solver.new.solve
