# https://atcoder.jp/contests/typical90/tasks/typical90_c
#
# 辺を2本以上持たない頂点を1つ選び深さ優先探索を行い、条件を満たしながらスコアが最大になるような経路を見つける?
# 各頂点ごとにDFSするとO(N^2)になって解けなかった

# わからん。解説。
# https://twitter.com/e869120/status/1377752658149175299/photo/1
#
# - 頂点u->vに行く単純パスはただ一つ存在する
# - 頂点uとvを双方向に結ぶ辺を1本追加すると、閉路は1つ出現し長さは(u->vの単純パスの長さ)+1になる
# - 単純パスの長さの最大値を求めたい -> これを木の直径という。
INF = 10 ** 18
N = gets.to_i
g = Array.new(N + 1) { [] }
(N - 1).times do
  a, b = gets.split.map(&:to_i)
  g[a].push(b)
  g[b].push(a)
end

# p(g)

# まずある頂点vからuへの最短距離を求める
q = []
start_v = g[1].first
q << start_v
max_dist = Array.new(N + 1, INF)
max_dist[start_v] = 1
while q.empty?.!
  v = q.shift
  g[v].each do |gv|
    if max_dist[gv] == INF
      max_dist[gv] = max_dist[v] + 1
      q << gv
    end
  end
end

# p(max_dist)

# 最短距離が最大の頂点を求める
max_dist_idx = -1
max_dist_v = -1
1.upto(N) do |i|
  if max_dist[i] > max_dist_v
    max_dist_v = max_dist[i]
    max_dist_idx = i
  end
end

# p("max_dist_idx: #{max_dist_idx}, max_dist_v: #{max_dist_v}")

# 最短距離が最大の頂点から最短距離を求める
# まずある頂点vからuへの最短距離を求める
q = []
start_v = g[max_dist_idx].first
q << start_v
max_dist = Array.new(N + 1, INF)
max_dist[start_v] = 1
while q.empty?.!
  v = q.shift
  g[v].each do |gv|
    if max_dist[gv] == INF
      max_dist[gv] = max_dist[v] + 1
      q << gv
    end
  end
end

# p(max_dist)

# 最短距離が最大の頂点を求める
max_dist_idx = -1
max_dist_v = -1
1.upto(N) do |i|
  if max_dist[i] > max_dist_v
    max_dist_v = max_dist[i]
    max_dist_idx = i
  end
end

# p("max_dist_idx: #{max_dist_idx}, max_dist_v: #{max_dist_v}")

# 最短距離が最大の頂点からの最短距離が最大になる頂点からさらに1本辺を加えるので+1
puts(max_dist_v + 1)
