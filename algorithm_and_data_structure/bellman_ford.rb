# ベルマンフォード法
# 有向閉路を含む有向グラフに対して、始点から負閉路へ到達する場合は報告し、そうでない場合は最短経路を求めることができる
class Edge
  attr_accessor :to, :w
  def initialize(to, w)
    @to = to
    @w = w
  end
end

N = 6
M = 12
s = 0
G = []
INF = 2 ^ 60
N.times { |i| G << [] }

G[0] << Edge.new(1, 3)
G[0] << Edge.new(3, 100)
G[1] << Edge.new(2, 50)
G[1] << Edge.new(3, 57)
G[1] << Edge.new(4, -4)
G[2] << Edge.new(3, -10)
G[2] << Edge.new(4, -5)
G[2] << Edge.new(5, 100)
G[3] << Edge.new(1, -5)
G[4] << Edge.new(2, 57)
G[4] << Edge.new(3, 25)
G[4] << Edge.new(5, 8)

exist_negative_cycle = false
dist = Array.new(N, INF)
dist[s] = 0
N.times do |i|
  update = false
  N.times do |v|
    next if dist[v] == INF

    G[v].each do |e|
      chmin = false
      if dist[e.to] > dist[v] + e.w
        dist[e.to] = dist[v] + e.w
        chmin = true
      end

      if chmin
        update = true
      end
    end
  end

  # 全て更新し終えていたら終了
  break if !update

  # N回目の反服で更新があったら負閉路が存在する
  if i == N - 1 && update
    exist_negative_cycle = true
  end
end

if exist_negative_cycle
  puts("NEGATIVE CYCLE")
else
  N.times do |v|
    if dist[v] < INF
      puts("#{v}: #{dist[v]}")
    else
      puts("INF")
    end
  end
end
