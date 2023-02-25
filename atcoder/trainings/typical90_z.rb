# https://atcoder.jp/contests/typical90/tasks/typical90_z
#
# ■考え方
# 木の直径が最大の頂点から深さ優先探索で見ていくのはどうか
#
# わからん。解説
# https://twitter.com/e869120/status/1387538790017769474/photo/1
# 二部グラフ問題。
# 2色に彩色して、大きい方の色の頂点をN/2個選ぶ。深さ優先探索で解けるとのこと

# INF = 10 ** 18
# N = gets.to_i
# g = Array.new(N + 1) { [] }
# (N - 1).times do |i|
#   a, b = gets.split.map(&:to_i)
#   g[a] << b
#   g[b] << a
# end

# q = []
# start_v = g[1].first
# q << start_v
# max_dist = Array.new(N + 1, INF)
# max_dist[start_v] = 1
# while q.empty?.!
#   v = q.shift
#   g[v].each do |gv|
#     if max_dist[gv] == INF
#       max_dist[gv] = max_dist[v] + 1
#       q << gv
#     end
#   end
# end

# max_dist_idx = -1
# max_dist_v = -1
# 1.upto(N) do |i|
#   if max_dist[i] > max_dist_v
#     max_dist_v = max_dist[i]
#     max_dist_idx = i
#   end
# end

# ans = []
# used = Array.new(N + 1, false)
# q = []
# q << max_dist_idx
# while q.empty?.!
#   v = q.shift

#   is_paintable = true
#   g[v].each do |gv|
#     if used[gv]
#       is_paintable = false
#     end

#     q << gv if used[gv].!
#   end

#   if is_paintable
#     used[v] = true
#     ans << v
#     if ans.size == N / 2
#       break
#     end
#   end
# end
# ans.sort!
# puts(ans.join(" "))

INF = 10 ** 18
N = gets.to_i
g = Array.new(N + 1) { [] }
(N - 1).times do |i|
  a, b = gets.split.map(&:to_i)
  g[a] << b
  g[b] << a
end

def dfs(pos, cur, g, col)
  col[pos] = cur
  g[pos].each do |to|
    next if col[to] >= 1
    dfs(to, 3 - cur, g, col)
  end
end

color = Array.new(N + 1, -1)
dfs(1, 1, g, color)

g1 = []
g2 = []
N.times do |i|
  if color[i] == 1
    g1 << i
  end

  if color[i] == 2
    g2 << i
  end
end

ans = []
if g1.size > g2.size
  (N / 2).times do |i|
    ans << g1[i]
  end

  puts(ans.join(" "))
else
  (N / 2).times do |i|
    ans << g2[i]
  end

  puts(ans.join(" "))
end
