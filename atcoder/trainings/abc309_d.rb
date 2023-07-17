# https://atcoder.jp/contests/abc309/tasks/abc309_d
#
# ■考えたこと
# 1<=u,v<=N1のグラフをG、N1<=u,v<=N1+N2のグラフをHとする
# 1から最も離れた頂点、N1+N2から最も離れた頂点をそれぞれ求めてその頂点同士を結べば最大の長さになりそう
# G,Hでそれぞれ1, N1+N2からの最短距離を幅優先探索で求めてその最大値同士の和+1が答えになるはず
# ■解説
#
n1, n2, m = gets.split.map(&:to_i)
g = Array.new(n1 + n2) { [] }
m.times do
  a, b = gets.split.map(&:to_i)
  g[a - 1] << b - 1
  g[b - 1] << a - 1
end

visited = Array.new(n1 + n2, false)
visited[0] = true
distance1 = Array.new(n1, 0)
q1 = [0]
while q1.empty?.!
  u = q1.shift
  g[u].each do |v|
    next if visited[v]
    visited[v] = true
    distance1[v] = distance1[u] + 1
    q1.push(v)
  end
end

visited[n1 + n2 - 1] = true
distance2 = Array.new(n1 + n2, 0)
q2 = [n1 + n2 - 1]
while q2.empty?.!
  u = q2.shift
  g[u].each do |v|
    next if visited[v]
    visited[v] = true
    distance2[v] = distance2[u] + 1
    q2.push(v)
  end
end

puts(distance1.max + 1 + distance2.max)
