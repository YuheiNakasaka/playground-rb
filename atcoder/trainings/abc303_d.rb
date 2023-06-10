# https://atcoder.jp/contests/abc303/tasks/abc303_d
#
# ■考えたこと
#
# ■解説
#
class Solver
  def initialize
  end

  def solve
    x, y, z = gets.split.map(&:to_i)
    s = gets.chomp.split("")
    dp = Array.new(s.size) { Array.new(2, 10 ** 18) }
    # 最初はoff
    if s[0] == "a"
      dp[0][0] = x
      dp[0][1] = z + y
    else
      dp[0][0] = y
      dp[0][1] = z + x
    end

    1.upto(s.size - 1) do |i|
      if s[i] == "a"
        dp[i][0] = [dp[i - 1][0] + x, dp[i - 1][1] + z + x].min
        dp[i][1] = [dp[i - 1][0] + z + y, dp[i - 1][1] + y].min
      else
        dp[i][0] = [dp[i - 1][0] + y, dp[i - 1][1] + z + y].min
        dp[i][1] = [dp[i - 1][0] + z + x, dp[i - 1][1] + x].min
      end
    end

    puts([dp[s.size - 1][0], dp[s.size - 1][1]].min)
  end
end

Solver.new.solve
