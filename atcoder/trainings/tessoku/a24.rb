# DP LIS 最長増加部分列
# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_x
# https://qiita.com/python_walker/items/d1e2be789f6e7a0851e5
class Solver
  def initialize
  end

  def solve
    n = gets.to_i
    a = gets.split.map { |x| x.to_i }
    l = []
    n.times do |i|
      pos = l.bsearch_index { _1 >= a[i] }
      if pos.nil?
        l << a[i]
      elsif l[pos] > a[i]
        l[pos] = a[i]
      end
    end

    puts(l.size)
  end
end

Solver.new.solve
