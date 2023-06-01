# ダブリング
# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_be
class Solver
  def initialize
  end

  def solve
    n, q = gets.split.map(&:to_i)
    dp = Array.new(31) { Array.new(n, -1) }
    a = gets.split.map(&:to_i)
    n.times do |i|
      dp[0][i] = a[i] - 1
    end

    1.upto(30) do |i|
      n.times do |j|
        dp[i][j] = dp[i - 1][dp[i - 1][j]]
      end
    end

    ans = []
    q.times do |i|
      x, y = gets.split.map(&:to_i)
      x -= 1
      30.times do |j|
        if (1 << j) & y > 0
          x = dp[j][x]
        end
      end

      ans << x
    end

    ans.each do |a|
      puts(a + 1)
    end
  end
end

Solver.new.solve
