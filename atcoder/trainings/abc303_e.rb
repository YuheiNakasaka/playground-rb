# https://atcoder.jp/contests/abc303/tasks/abc303_e
#
# ■考えたこと
# 頂点が持つ辺の数の降順で見ていき、星になっているかチェック。
# 星の中心から2辺離れた頂点に印をつける。そこがつなぎめの可能性がある
# Lv2と接続部の頂点の数え分けるのが難しい...
# ■解説
# 葉からの距離に注目していく
# https://atcoder.jp/contests/abc303/tasks/abc303_e/editorial
n = gets.to_i
@uv = Array.new(n) { [] }
(n - 1).times do |i|
  u, v = gets.split.map(&:to_i)
  @uv[u - 1] << v - 1
  @uv[v - 1] << u - 1
end

leaf = -1
@uv.each.with_index do |v, i|
  if v.size == 1
    leaf = i
    break
  end
end

@ans = []
def dfs(v, p, d)
  if d % 3 == 1
    @ans << @uv[v].size
  end

  @uv[v].each do |u|
    next if u == p
    dfs(u, v, d + 1)
  end
end

dfs(leaf, -1, 0)

puts(@ans.sort.join(" "))
