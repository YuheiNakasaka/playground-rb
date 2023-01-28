# https://atcoder.jp/contests/abc287/tasks/abc287_c
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

N, M = gets.chomp.split(" ").map(&:to_i)
uf = UnionFind.new(N + 1)
g = Array.new(N + 1) { [] }

ans = "Yes"
M.times do |i|
  u, v = gets.chomp.split(" ").map(&:to_i)
  g[u] << v
  if (!uf.unite(u, v))
    ans = "No"
  end

  if g[u].length > 2
    ans = "No"
  end
end

if N - M > 1
  puts("No")
else
  puts(ans)
end
