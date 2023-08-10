# UnionFind
class UnionFind
  attr_accessor :par, :siz

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

# Test
# #    7
# #  5   6
# # 3 2 1 4
# #
# #    9
# #  8   0
# N = 10
# uf = UnionFind.new(N)
# uf.unite(7, 5)
# uf.unite(7, 6)
# uf.unite(5, 3)
# uf.unite(5, 2)
# uf.unite(6, 1)
# uf.unite(6, 4)
# uf.unite(9, 8)
# uf.unite(9, 0)

# res = 0
# N.times do |i|
#   if uf.root(i) == i
#     res += 1
#   end
# end

# p(uf)
# p(res)
