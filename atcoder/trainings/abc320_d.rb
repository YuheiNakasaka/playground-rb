# https://atcoder.jp/contests/abc320/tasks/abc320_d
#
# ■考えたこと
#
# ■解説
# ACしたけどBFSよりDFSの方が実装簡単だったな...
n, m = gets.split.map(&:to_i)
g = Array.new(n) { [] }
pts = Array.new(n)
pts[0] = [0, 0]
diff = {}
m.times do |i|
  a, b, dx, dy = gets.split.map(&:to_i)
  a -= 1
  b -= 1
  g[a] << b
  g[b] << a
  diff[[a, b]] = [dx, dy]
end

q = [0]
visited = Array.new(n, false)
visited[0] = true
until q.empty?
  v = q.shift
  g[v].each do |gv|
    next if visited[gv] || (diff[[gv, v]].nil? && diff[[v, gv]].nil?)

    visited[gv] = true
    x, y = pts[v]
    if diff[[v, gv]].nil?
      dx, dy = diff[[gv, v]]
      dx = -dx
      dy = -dy
    else
      dx, dy = diff[[v, gv]]
    end
    pts[gv] = [x + dx, y + dy]

    q << gv
  end
end

n.times do |i|
  if pts[i].nil?.!
    puts pts[i].join(' ')
  else
    puts 'undecidable'
  end
end
