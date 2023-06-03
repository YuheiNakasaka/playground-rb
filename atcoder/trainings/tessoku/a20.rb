# DP LCS 最長共通部分列問題
# 上・横・斜め前の3通りの遷移のうち斜め前の遷移のみ+1する
# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_t
class Solver
  def initialize
  end

  def solve
    s = gets.chomp.split("")
    n = s.size
    t = gets.chomp.split("")
    m = t.size
    dp = Array.new(2009) { Array.new(2009, 0) }
    dp[0][0] = 0
    (n + 1).times do |i|
      (m + 1).times do |j|
        if i >= 1 && j >= 1 && s[i - 1] == t[j - 1]
          dp[i][j] = [dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1] + 1].max
        elsif i >= 1 && j >= 1
          dp[i][j] = [dp[i - 1][j], dp[i][j - 1]].max
        elsif i >= 1
          dp[i][j] = dp[i - 1][j]
        elsif j >= 1
          dp[i][j] = dp[i][j - 1]
        end
      end
    end

    puts(dp[n][m])
  end
end

Solver.new.solve
