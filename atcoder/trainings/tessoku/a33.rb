# 数学的問題 ニム
# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_ag
#
class Solver
  def initialize
  end

  def solve
    n = gets.to_i
    a = gets.split.map(&:to_i)

    xor = a[0]
    (n - 1).times do |i|
      xor ^= a[i + 1]
    end

    if xor != 0
      puts("First")
    elsif xor == 0
      puts("Second")
    end
  end
end

Solver.new.solve
