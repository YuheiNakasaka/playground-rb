N, M = gets.split.map(&:to_i)
g = Array.new(N + 1) { [] }
M.times do |i|
  u, v = gets.split.map(&:to_i)
  g[u] << v
  g[v] << u
end

p(g)
