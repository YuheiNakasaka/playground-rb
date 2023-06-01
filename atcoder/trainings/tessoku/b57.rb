# ダブリング
# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_ed
class Solver
  def initialize
  end

  def solve
    n, k = gets.split.map(&:to_i)
    dp = Array.new(30) { Array.new(n + 1, 0) }

    # 前計算(1回目)
    1.upto(n) do |i|
      dp[0][i] = i - i.digits.sum
    end

    # 前計算(2回目以降)
    1.upto(29) do |i|
      1.upto(n) do |j|
        dp[i][j] = dp[i - 1][dp[i - 1][j]]
      end
    end

    # k回目の結果を求める
    # 108で3回目の値の場合 => 72
    # 3 = 2**0 + 2**1
    # 2**0=1: 99
    # 2**1=2: 72
    ans = []
    1.upto(n) do |i|
      30.times do |j|
        if (1 << j) & k > 0
          i = dp[j][i]
        end
      end

      ans << i
    end

    ans.each do |a|
      puts(a)
    end
  end
end

Solver.new.solve
