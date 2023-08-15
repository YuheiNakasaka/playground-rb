# https://atcoder.jp/contests/abc302/tasks/abc302_e
#
# ■考えたこと
# 辺を追加するときは++していけばいいからそんな大変じゃない。頂点に繋がってる辺を消す時にその辺の数を--するのはわかるけど、
# 繋がっていた先の頂点間が繋がっているかどうかを調べる術がない。UnionFindとか使えばいける？
# ■解説
# 普通に無向グラフで管理して削除するときにO(logn)になるようにSetとか使えばいいだけだった。
# https://atcoder.jp/contests/abc302/tasks/abc302_e/editorial
require "set"

n, q = gets.split.map(&:to_i)
g = Array.new(n) { Set.new }
ans = []
cnt = n
q.times do
  t, u, v = gets.split.map(&:to_i)
  u = u - 1 if u.nil?.! && u > 0
  v = v - 1 if v.nil?.! && v > 0
  if t == 1
    cnt -= 1 if g[u].size == 0
    cnt -= 1 if g[v].size == 0
    g[u].add(v)
    g[v].add(u)
  else
    g[u].each do |a|
      g[a].delete(u)
      if g[a].size == 0
        cnt += 1
      end
    end

    if g[u].size > 0
      cnt += 1
    end

    g[u] = Set.new
  end

  ans << cnt
end

ans.each do |a|
  puts(a)
end
