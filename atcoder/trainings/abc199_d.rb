# https://atcoder.jp/contests/abc199/tasks/abc199_d
#
# ■考えたこと
# 3**Nからどれか一組は条件を満たさないものを数え上げて引いて余事象っぽく解けないだろうか
# M(辺の数)が最大で190しかないので全探索できるかもしれない
# ■解説
# ある頂点を決め打ちして、その頂点に隣接する頂点の色を決めていく
# 最初一つ決めるとその先につながら頂点の色は2色しかないから3x2**(N-1)通りだけ探索すれば済む
# https://atcoder.jp/contests/abc199/editorial/1163

# gは閉路のグループ
# iは深さ
# dは無向グラフのリスト
# cは色のリスト
def dfs(g, i, d, c)
  return 1 if i == g.size
  ret = 0
  cur = g[i]
  3.times do |j|
    next if d[cur].any? { |nxt| c[nxt] == j }
    c[cur] = j
    ret += dfs(g, i + 1, d, c)
    c[cur] = -1
  end

  ret
end

N, M = gets.split.map(&:to_i)
g = Array.new(N) { Array.new }
M.times do |i|
  a, b = gets.split.map(&:to_i)
  g[a - 1].push(b - 1)
  g[b - 1].push(a - 1)
end

# ある頂点から巡れる頂点のグループをまとめる(閉路ごとのグループ分け)
#
# 閉路ごとのグループ
gs = []
visited = Array.new(N, false)
N.times do |i|
  next if visited[i]
  visited[i] = true
  s = [i]
  j = 0
  while j < s.size
    cur = s[j]
    g[cur].each do |nxt|
      next if visited[nxt]
      visited[nxt] = true
      s << nxt
    end

    j += 1
  end

  gs << s
end

c = Array.new(N, -1)
ans = 1
gs.each do |x|
  ans *= dfs(x, 0, g, c)
end

puts(ans)
