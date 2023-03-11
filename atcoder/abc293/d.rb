require "set"

class UnionFind
  attr_accessor :par, :siz, :vets, :uniq
  def initialize(n)
    @par = Array.new(n, -1)
    @siz = Array.new(n, 1)
    @vets = Array.new(n) { [] }
    @uniq = Array.new(n) { Set.new }
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
    @vets[x] << y
    @vets[y] << x
    @uniq[x].add(y)
    @uniq[y].add(x)
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

N, M = gets.split.map(&:to_i)
uf = UnionFind.new(N)
M.times do |i|
  a, b, c, d = gets.chomp.split
  a = a.to_i - 1
  c = c.to_i - 1
  uf.unite(a, c)
end

all = 0
ok = 0
N.times do |i|
  if uf.par[i] == -1
    all += 1
    if uf.vets[i].size != uf.uniq[i].size
      ok += 1
    end
  end
end

puts("#{ok} #{all - ok}")
