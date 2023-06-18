# セグメント木 セグ木
# https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_bf
#
class SegmentTree
  attr_accessor :siz, :data

  def initialize(n)
    @data = Array.new(300000, 0)
    @siz = 1
    while @siz < n
      @siz *= 2
    end
  end

  def update(pos, x)
    pos = pos + @siz - 1
    @data[pos] = x
    while pos >= 2
      pos /= 2
      @data[pos] = [@data[pos * 2], @data[pos * 2 + 1]].max
    end
  end

  def query(l, r, a, b, u)
    return -1000000000 if r <= a || b <= l
    return @data[u] if l <= a && b <= r

    m = (a + b) / 2
    ans_l = query(l, r, a, m, u * 2)
    ans_r = query(l, r, m, b, u * 2 + 1)
    return [ans_l, ans_r].max
  end
end

class Solver
  def initialize
  end

  def solve
    n, q = gets.split.map(&:to_i)
    seg = SegmentTree.new(n)
    ans = []
    1.upto(q) do |i|
      q, a, b = gets.split.map(&:to_i)
      if q == 1
        seg.update(a, b)
      end

      if q == 2
        ans << seg.query(a, b, 1, seg.siz + 1, 1)
      end
    end

    ans.each { |a| puts(a) }
  end
end

Solver.new.solve
