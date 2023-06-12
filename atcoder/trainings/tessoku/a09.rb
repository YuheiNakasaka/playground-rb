# 2次元累積和 いもす法
# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_i
#
class Solver
  def initialize
  end

  def solve
    h, w, n = gets.split.map(&:to_i)
    g = Array.new(h + 1) { Array.new(w + 1, 0) }
    n.times do |i|
      a, b, c, d = gets.split.map(&:to_i)
      g[a - 1][b - 1] += 1
      g[a - 1][d] -= 1
      g[c][b - 1] -= 1
      g[c][d] += 1
    end

    h.times do |i|
      1.upto((w - 1)) do |j|
        g[i][j] = g[i][j - 1] + g[i][j]
      end
    end

    w.times do |i|
      1.upto((h - 1)) do |j|
        g[j][i] = g[j - 1][i] + g[j][i]
      end
    end

    (g.size - 1).times do |i|
      puts(g[i][0..(w - 1)].join(" "))
    end
  end
end

Solver.new.solve
