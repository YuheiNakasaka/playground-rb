# https://atcoder.jp/contests/abc292/tasks/abc292_d
#
# ■考えたこと
# UnionFindで連結成分の頂点を求める。求めた頂点からDFSで頂点と辺の数を数える。
# ■解説
# UnionFind + DFSだとエッジケースが2つだけあって潰せなかった。
# 正攻法だとUnionFindをして、頂点ごとにそのルートを数えるのと辺の先からルートを数えるのとをやり、比較すればOKだった。
# https://atcoder.jp/contests/abc292/tasks/abc292_d/editorial
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

n, m = gets.split.map(&:to_i)
uf = UnionFind.new(n)
u = Array.new(m, 0)
v = Array.new(m, 0)
m.times do |i|
  a, b = gets.split.map(&:to_i)
  u[i] = a - 1
  v[i] = b - 1
  uf.unite(a - 1, b - 1)
end

vs = Array.new(n, 0)
es = Array.new(n, 0)

n.times do |i|
  vs[uf.root(i)] += 1
end

m.times do |i|
  es[uf.root(u[i])] += 1
end

if vs == es
  puts("Yes")
else
  puts("No")
end

# roots = []
# uf.par.size.times do |i|
#   if uf.par[i] == -1
#     roots << i
#   end
# end

# def dfs(s)
#   @visited[s] = true
#   @vs += 1
#   @uv[s].each do |v|
#     @ms += 1
#     next if @visited[v]
#     dfs(v)
#   end
# end

# roots.each do |root|
#   @vs = 0
#   @ms = 0
#   @visited = Array.new(n, false)
#   dfs(root)
#   if @vs != @ms
#     puts("No")
#     exit
#   end
# end

# puts("Yes")
