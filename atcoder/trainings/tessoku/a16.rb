class Solver
  def initialize
  end

  def solve
    n = gets.to_i
    a = gets.split.map(&:to_i)
    b = gets.split.map(&:to_i)
    dp = Array.new(n, 0)
    dp[0] = 0
    n.times do |i|
      dp[i] = dp[i - 1] + a[i - 1] if i - 1 >= 0
      if i - 2 >= 0 && dp[i - 2] + b[i - 2] < dp[i]
        dp[i] = dp[i - 2] + b[i - 2]
      end
    end

    puts(dp.last)
  end
end

Solver.new.solve
