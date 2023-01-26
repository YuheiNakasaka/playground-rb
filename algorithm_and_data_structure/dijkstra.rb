# ダイクストラ法
# 全ての重みが非負の場合に使える
class Edge
  attr_accessor :to, :w
  def initialize(to, w)
    @to = to
    @w = w
  end
end

N = 6
M = 9
s = 0
G = []
INF = 2 ^ 60
N.times { |i| G << [] }

G[0] << Edge.new(1, 3)
G[0] << Edge.new(2, 5)
G[1] << Edge.new(2, 4)
G[1] << Edge.new(3, 12)
G[2] << Edge.new(3, 9)
G[2] << Edge.new(4, 4)
G[3] << Edge.new(5, 2)
G[4] << Edge.new(3, 7)
G[4] << Edge.new(5, 8)

used = Array.new(N, false)
dist = Array.new(N, INF)
dist[s] = 0
N.times do |i|
  min_dist = INF
  min_v = -1
  N.times do |v|
    if !used[v] && dist[v] < min_dist
      min_dist = dist[v]
      min_v = v
    end
  end

  next if min_v == -1

  G[min_v].each do |e|
    chmin = false
    if dist[e.to] > dist[min_v] + e.w
      dist[e.to] = dist[min_v] + e.w
      chmin = true
    end

    used[min_v] = true
  end
end

N.times do |v|
  if dist[v] < INF
    puts("#{s} -> #{v}: #{dist[v]}")
  else
    puts("INF")
  end
end
