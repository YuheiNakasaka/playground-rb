# https://atcoder.jp/contests/abc277/tasks/abc277_e
#
# ■考えたこと
# 最初に通行できるか否かを無視してダイクストラなどで最短経路を求める。次にその最短経路をゴールから初めて、通行可能かいないかを判定しながら1へ戻っていく。
# 戻っていく中で何回スイッチを押すか数える。みたいな感じでどうか。
# 連結でない or 多重編も含むことがあるのでダメか。。
# 二部グラフっぽさもある。
# ■解説
# 頂点を倍にして01BFS。スイッチを押した世界線と押してない世界線を行き来する。
n, m, k = gets.split.map(&:to_i)
n2 = n * 2
g = Array.new(n2) { [] }
m.times do
  a, b, c = gets.split.map(&:to_i)
  a -= 1
  b -= 1
  if c == 1
    g[a].push([b, 1])
    g[b].push([a, 1])
  else
    g[n + a].push([n + b, 1])
    g[n + b].push([n + a, 1])
  end
end

s = gets.split.map(&:to_i)
k.times do |i|
  v = s[i] - 1
  g[v].push([n + v, 0])
  g[n + v].push([v, 0])
end

INF = 1_001_001_001
dist = Array.new(n2, INF)
q = []
dist[0] = 0
q.push([0, 0])
until q.empty?
  d, v = q.shift

  next if dist[v] != d

  g[v].each do |e|
    nd = d + e[1]
    next if nd >= dist[e[0]]

    dist[e[0]] = nd
    if e[1].positive?
      q.push([nd, e[0]])
    else
      q.unshift([nd, e[0]])
    end
  end
end

ans = [dist[n - 1], dist[n2 - 1]].min
if ans == INF
  puts -1
else
  puts ans
end
