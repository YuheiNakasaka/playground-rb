# 二次元DP ナップサック問題
# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_s
class Solver
  def initialize
  end

  def solve
    n, w = gets.split.map(&:to_i)
    weights = Array.new(n + 1, 0)
    values = Array.new(n + 1, 0)
    dp = Array.new(n + 1) { Array.new(w + 1, 0) }
    n.times do |i|
      weight, value = gets.split.map(&:to_i)
      weights[i] = weight
      values[i] = value
    end

    (n + 1).times do |i|
      next if i == 0
      (w + 1).times do |j|
        dp[i][j] = dp[i - 1][j]
        if j >= weights[i - 1] && dp[i - 1][j - weights[i - 1]] + values[i - 1] > dp[i][j]
          dp[i][j] = dp[i - 1][j - weights[i - 1]] + values[i - 1]
        end
      end
    end

    ans = -1
    (w + 1).times do |i|
      ans = [ans, dp[n][i]].max
    end

    puts(ans)
  end
end

Solver.new.solve
