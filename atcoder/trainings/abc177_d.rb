# https://atcoder.jp/contests/abc177/tasks/abc177_d
#
# ■考えたこと
# 友達関係の情報からいくつかの友達グループが作れる。
# 各グループから1人ずつfetchして1グループ作る。これを繰り返す。
# 実装としてはUnionFindを使ってグループを作り、
# グループのsizeが一番大きいグループの人数が最大値になる(各グループから1人ずつfetchしてグループを作って余った人=最大グループの余りは1人グループになる)出力する。
# ■解説
# https://atcoder.jp/contests/abc177/editorial/90
class UnionFind
  attr_reader :par, :siz
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

N, M = gets.split.map(&:to_i)
uf = UnionFind.new(N)
M.times do |i|
  a, b = gets.split.map(&:to_i)
  uf.unite(a - 1, b - 1)
end

p(uf.siz.max)
