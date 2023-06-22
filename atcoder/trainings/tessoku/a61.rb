# グラフ
# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_bi
#
class Solver
  def initialize
  end

  def solve
    n, m = gets.split.map(&:to_i)
    g = Array.new(n + 1) { [] }
    m.times do |i|
      a, b = gets.split.map(&:to_i)
      g[a] << b
      g[b] << a
    end

    1.upto(n) do |i|
      puts("#{i}: {#{g[i].join(", ")}}")
    end
  end
end

Solver.new.solve
