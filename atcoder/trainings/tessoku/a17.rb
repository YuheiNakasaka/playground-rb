# DP 復元
# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_q
class Solver
  def initialize
  end

  def solve
    n = gets.to_i
    a = gets.split.map(&:to_i)
    b = gets.split.map(&:to_i)
    dp = Array.new(n, 0)

    # スタートからゴールまでの最短時間計算
    n.times do |i|
      if i - 1 >= 0
        dp[i] = dp[i - 1] + a[i - 1]
      end

      if i - 2 >= 0 && dp[i] > (dp[i - 2] + b[i - 2])
        dp[i] = dp[i - 2] + b[i - 2]
      end
    end

    # 復元
    # ゴールからa,bのどちらで来たかをdpの値とa,bの差で比較してみて判定
    routes = [n]
    i = n - 1
    while i > 0
      route = []
      if i - 1 >= 0 && dp[i - 1] == dp[i] - a[i - 1]
        routes << i
        i = i - 1
      else
        routes << i - 1
        i = i - 2
      end
    end

    puts(routes.size)
    puts(routes.reverse.join(" "))
  end
end

Solver.new.solve
