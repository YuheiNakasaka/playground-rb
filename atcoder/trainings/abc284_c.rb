# https://atcoder.jp/contests/abc284/tasks/abc284_c
#
# ■考えたこと
#
# ■解説
#
require "set"

class UnionFind
  attr_accessor :siz

  def initialize(n)
    @par = Array.new(n, -1)
    @siz = Array.new(n, 1)
  end

  def root(x)
    if @par[x] == -1
      x
    else
      @par[x] = root(@par[x])
    end
  end

  def is_same(x, y)
    root(x) == root(y)
  end

  def unite(x, y)
    x = root(x)
    y = root(y)
    if x == y
      return false
    end

    if @siz[x] < @siz[y]
      tmp = x
      x = y
      y = tmp
    end

    @par[y] = x
    @siz[x] += @siz[y]

    return true
  end

  def size(x)
    @siz[root(x)]
  end
end

n, m = gets.split.map(&:to_i)
uf = UnionFind.new(n * 2)
ans = 0
m.times do
  a, b = gets.split.map(&:to_i)
  uf.unite(a, b)
end

set = Set.new([])
1.upto(n) do |i|
  set.add(uf.root(i))
end

puts(set.length)
