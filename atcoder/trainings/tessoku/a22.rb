# DP 遷移形式の工夫
# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_v
#
class Solver
  def initialize
  end

  def solve
    n = gets.to_i
    a = gets.split.map(&:to_i)
    b = gets.split.map(&:to_i)
    dp = Array.new(n + 1, -(10 ** 9))
    dp[0] = 0
    dp[1] = 0
    1.upto(n - 1) do |i|
      dp[a[i - 1]] = [dp[a[i - 1]], dp[i] + 100].max
      dp[b[i - 1]] = [dp[b[i - 1]], dp[i] + 150].max
    end

    puts(dp[n])
  end
end

Solver.new.solve
