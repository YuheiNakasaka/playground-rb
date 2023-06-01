# DP
# https://atcoder.jp/contests/tessoku-book/tasks/dp_a
class Solver
  def initialize
  end

  def solve
    n = gets.to_i
    h = gets.split.map(&:to_i)
    dp = Array.new(n, 10 ** 5)
    dp[0] = 0
    n.times do |i|
      dp[i] = dp[i - 1] + (h[i - 1] - h[i]).abs if i - 1 >= 0
      if i - 2 >= 0
        dp[i] = [dp[i], dp[i - 2] + (h[i - 2] - h[i]).abs].min
      end
    end

    puts(dp[-1])
  end
end

Solver.new.solve
