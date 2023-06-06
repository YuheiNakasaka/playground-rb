# dp 区間dp
# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_u
#
class Solver
  def initialize
  end

  def solve
    n = gets.to_i
    @p = Array.new(2009, 0)
    @a = Array.new(2009, 0)
    1.upto(n) do |i|
      x, y = gets.split.map(&:to_i)
      @p[i] = x
      @a[i] = y
    end

    dp = Array.new(n + 1) { Array.new(n + 1, 0) }
    dp[1][n] = 0
    (n - 2).downto(0) do |i|
      1.upto(n - i) do |l|
        r = l + i

        score1 = 0
        if l <= @p[l - 1] && @p[l - 1] <= r
          score1 = @a[l - 1]
        end

        score2 = 0
        if l <= @p[r + 1] && @p[r + 1] <= r
          score2 = @a[r + 1]
        end

        if l == 1
          dp[l][r] = dp[l][r + 1] + score2
        elsif r == n
          dp[l][r] = dp[l - 1][r] + score1
        else
          dp[l][r] = [dp[l - 1][r] + score1, dp[l][r + 1] + score2].max
        end
      end
    end

    ans = 0
    1.upto(n) do |i|
      ans = [ans, dp[i][i]].max
    end

    puts(ans)
  end
end

Solver.new.solve
