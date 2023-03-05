class UnionFind
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

# 頂点と辺の連結成分の数を頂点とそのroot、辺とそのrootを数えることで比較する
# https://atcoder.jp/contests/abc292/editorial/5873

N, M = gets.split.map(&:to_i)
uf = UnionFind.new(N)
u = Array.new(M, 0)
M.times do |i|
  u[i], v = gets.split.map(&:to_i)
  u[i] -= 1
  uf.unite(u[i], v - 1)
end

vs = Array.new(N + 1, 0)
es = Array.new(M + 1, 0)

N.times do |i|
  vs[uf.root(i)] += 1
end

M.times do |i|
  es[uf.root(u[i])] += 1
end

p(vs, es, u)

if vs == es
  puts("Yes")
else
  puts("No")
end
