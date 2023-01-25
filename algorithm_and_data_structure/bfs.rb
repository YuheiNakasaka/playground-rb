# 幅優先探索(Breathe First Search)
N = 9
G = []

N.times do
  G.push([])
end

# 無向グラフ
G[0] = [1, 4, 2]
G[1] = [0, 4, 3, 8]
G[2] = [0, 5]
G[3] = [1, 8, 7]
G[4] = [0, 1, 8]
G[5] = [2, 8, 6]
G[6] = [5, 7]
G[7] = [3, 6]
G[8] = [1, 3, 4, 5]

# 基本形。訪れた場所をtrueにする。
def search(s)
  n = G.length
  seen = (0...n).map { |i| false }
  todo = []

  seen[s] = true
  todo.push(s)

  while !todo.empty?
    v = todo.first
    todo.shift

    G[v].map do |x|
      next if seen[x]
      seen[x] = true
      todo.push(x)
    end
  end

  seen
end

# 頂点s->s'への最短距離を求める場合
def bfs(s)
  n = G.length
  dist = (0...n).map { |i| -1 }
  que = []

  dist[s] = 0
  que.push(s)

  while !que.empty?
    v = que.first
    que.shift

    G[v].map do |x|
      next if dist[x] != -1
      dist[x] = dist[v] + 1
      que.push(x)
    end
  end

  dist
end

dist = bfs(0)
N.times do |i|
  puts("#{i}: #{dist[i]}")
end

seen = search(0)
N.times do |i|
  puts("#{i}: #{seen[i]}")
end
