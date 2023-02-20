# https://atcoder.jp/contests/typical90/tasks/typical90_l
#
# マス目をt1なら赤に塗りt2ならその地点に赤上を上下左右移動してたどり着けるかを判定する
# Qが10^5でH,Wが2000とかHWで0(10^6)となるのでぎりぎり
#
# 解説。
# https://twitter.com/e869120/status/1381739128291614720/photo/1
# UnionFindで解くのか。
# マスに色を塗る時はそのマスをルートとして上下左右のマスを調べ、すでに塗られたマスがあればそのマスをそのルートにUnionする
# あとはクエリ2のマスAとマスBつながる経路があるか調べるためにそれらをルートとしてis_sameで判定すればOK

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

H, W = gets.split.map(&:to_i)
uf = UnionFind.new(H * W)

ans = []
used = Array.new(2009) { Array.new(2009, false) }
Q = gets.to_i
Q.times do |i|
  q = gets.split.map(&:to_i)
  # 色を塗るクエリ
  if q[0] == 1
    # 塗るマス
    px = q[1]
    py = q[2]
    # その四方のマス
    dx = [0, 0, -1, 1]
    dy = [-1, 1, 0, 0]
    # 塗るマスを中心に周囲をチェックしていき、すでに塗られたマスがある場合はUnionFindで接続する
    4.times do |i|
      sx = px + dx[i]
      sy = py + dy[i]
      next if used[sx][sy] == false
      hash1 = (px - 1) * W + (py - 1)
      hash2 = (sx - 1) * W + (sy - 1)
      uf.unite(hash1, hash2)
    end

    used[px][py] = true
  end

  # つながる経路が存在するか調べるクエリ
  if q[0] == 2
    # 調べるマス
    px = q[1]
    py = q[2]
    qx = q[3]
    qy = q[4]
    if used[px][py] == false || used[qx][qy] == false
      ans << "No"
      next
    end

    hash1 = (px - 1) * W + (py - 1)
    hash2 = (qx - 1) * W + (qy - 1)
    if uf.is_same(hash1, hash2)
      ans << "Yes"
    else
      ans << "No"
    end
  end
end

ans.each do |a|
  puts(a)
end
