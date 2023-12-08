# frozen_string_literal: true

# https://atcoder.jp/contests/abc328/tasks/abc328_e
#
# ■考えたこと
#
# ■解説
#
class UnionFind
  attr_accessor :rank, :parent

  def initialize(size)
    @rank = Array.new(size, 0)
    @parent = Array.new(size, &:itself)
  end

  def unite(id_x, id_y)
    x_parent = parent(id_x)
    y_parent = parent(id_y)
    return if x_parent == y_parent

    if @rank[x_parent] > @rank[y_parent]
      @parent[y_parent] = x_parent
    else
      @parent[x_parent] = y_parent
      @rank[y_parent] += 1 if @rank[x_parent] == @rank[y_parent]
    end
  end

  def parent(id_x)
    @parent[id_x] == id_x ? id_x : (@parent[id_x] = parent(@parent[id_x]))
  end

  def same?(id_x, id_y)
    parent(id_x) == parent(id_y)
  end

  def size(i)
    @rank[parent(i)]
  end
end

@n, @m, @k = gets.split.map(&:to_i)
@uvw = @m.times.map do
  u, v, w = gets.split.map(&:to_i)
  [u - 1, v - 1, w]
end

# m-1C7の全パターンを列挙して調べる
@ans = 10**18
def dfs(i, arr)
  if arr.size == @n - 1
    uf = UnionFind.new(@n)
    tmp = 0
    ok = true
    arr.each do |j|
      u, v, w = @uvw[j]
      # 連結になっている場合は全域木にならないので、そのパターンは除外
      ok = false if uf.same?(u, v)

      uf.unite(u, v)
      tmp = (tmp + w) % @k
    end
    @ans = [@ans, tmp].min if ok
  else
    # mは最大でm-1C7になるのでiがmになったら終了
    return if i == @m

    # m-1C7のパターンのうち、このuvwの組みを選ぶか選ばないか
    dfs(i + 1, arr)
    dfs(i + 1, Array.new(arr) << i)
  end
end

dfs(0, [])
puts @ans
