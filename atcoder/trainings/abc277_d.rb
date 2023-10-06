# https://atcoder.jp/contests/abc277/tasks/abc277_d
#
# ■考えたこと
# キャッシュしてるけどdfsの部分の計算量が不安。visitedになってる場合は探索しないからO(n + n)くらいで済むはず。
# ■解説
# n = 7 m = 7 a = [0, 1, 1, 3, 5, 5, 6]見たいな場合に
# 5,5,6,0,1,1みたいに1周する可能性を探索できてなかった。
# UnionFindでグループ作ってそのグループの和が最大のものを選んで全体の和から引くといける。
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

n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i).sort
uf = UnionFind.new(n)

n.times do |i|
  uf.rank[i] = a[i]
end

n.times do |i|
  j = (i + 1) % n
  uf.unite(i, j) if a[i] == a[j] || (a[i] + 1) % m == a[j]
end

sum = {}
n.times do |i|
  sum[uf.parent(i)] ||= 0
  sum[uf.parent(i)] += a[i]
end

max = 0
sum.each do |k, v|
  max = [max, v].max
end

puts a.sum - max
