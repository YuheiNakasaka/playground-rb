# https://atcoder.jp/contests/abc304/tasks/abc304_e
#
# ■考えたこと
# UnionFindを作ってQのp,qをunifiyした時にK個のx,yが同じグループに属していないかを判定する
# ただこれだとO(n^2 * log(n))でTLEになると思う。Qの方を減らすかKの方を減らすかする方法はないか...
# ■解説
# https://atcoder.jp/contests/abc304/tasks/abc304_e/editorial
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

n, m = gets.split.map(&:to_i)
uf = UnionFind.new(n)
uv = Array.new(m)
m.times do |i|
  uv[i] = gets.split.map(&:to_i)
  uf.unite(uv[i][0] - 1, uv[i][1] - 1)
end

k = gets.to_i
xy = Array.new(k)
k.times do |i|
  xy[i] = gets.split.map(&:to_i)
end

q = gets.to_i
pq = Array.new(q)
q.times do |i|
  pq[i] = gets.split.map(&:to_i)
end

# 繋がったらダメな集合のrootの組み合わせをハッシュで管理
h = {}
xy.each do |x, y|
  xx = uf.root(x - 1)
  yy = uf.root(y - 1)
  min = [xx, yy].min
  max = [xx, yy].max

  h[[min, max]] = true
end

pq.each do |p, q|
  pp = uf.root(p - 1)
  qq = uf.root(q - 1)
  min = [pp, qq].min
  max = [pp, qq].max
  if h[[min, max]]
    puts("No")
  else
    puts("Yes")
  end
end
