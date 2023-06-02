# DP 変則ナップザック
# valueが小さいので横軸をvalueにしてdp[i][j]を重さにしている
# jの価値を作る時により重さを最小にできる場合で更新していく
# dp[i][j]のうちwを満たすもの中で一番大きなjを出力すれば良さそう
# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_cr
class Solver
  def initialize
  end

  def solve
    n, w = gets.split.map(&:to_i)
    weights = Array.new(n + 1, 0)
    values = Array.new(n + 1, 0)
    vinf = 10 ** 5 + 9
    dp = Array.new(n + 1) { Array.new(vinf, 10 ** 9 + 9) }
    dp[0][0] = 0
    n.times do |i|
      weight, value = gets.split.map(&:to_i)
      weights[i] = weight
      values[i] = value
    end

    (n + 1).times do |i|
      next if i == 0
      vinf.times do |j|
        if j == 0
          dp[i][j] = 0
          next
        end

        dp[i][j] = dp[i - 1][j]
        if j - values[i - 1] >= 0 && dp[i - 1][j - values[i - 1]] + weights[i - 1] < dp[i][j]
          dp[i][j] = dp[i - 1][j - values[i - 1]] + weights[i - 1]
        end
      end
    end

    ans = 0
    (n + 1).times do |i|
      vinf.times do |j|
        if dp[i][j] <= w && ans < j
          ans = j
        end
      end
    end

    puts(ans)
  end
end

Solver.new.solve
