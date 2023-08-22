# https://atcoder.jp/contests/abc315/tasks/abc315_e
#
# ■考えたこと
# トポロジカルソートするだけっぽい。abc291eでやったばかりだ。
# ■解説
# トポロジカルソートだけじゃダメだった
n = gets.to_i
g = Array.new(n) { [] }
d = Array.new(n, 0)
n.times do |i|
  a = gets.split.map(&:to_i)
  a[0].times do |j|
    g[i] << a[j + 1] - 1
    d[a[j + 1] - 1] += 1
  end
end

visited = Array.new(n, false)
q = [0]
while q.empty?.!
  v = q.pop
  g[v].each do |u|
    next if visited[u]
    visited[u] = true
    q << u
  end
end

q = []
n.times do |i|
  if d[i] == 0
    q << i
  end
end

t = []
while q.empty?.!
  v = q.shift
  g[v].each do |u|
    d[u] -= 1
    if d[u] == 0
      t << u + 1 if visited[u]
      q << u
    end
  end
end

puts(t.reverse.join(" "))
