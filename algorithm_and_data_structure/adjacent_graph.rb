# 連結グラフ
# 8 13
# 4 1
# 4 2
# 4 6
# 1 3
# 1 6
# 2 5
# 2 7
# 6 7
# 3 0
# 3 7
# 7 0
# 0 5
n, m = gets.split.map(&:to_i)
graph = Array.new(n) { [] }
(m - 1).times do
  k, v = gets.split.map(&:to_i)
  graph[k].push(v)
end

p(graph)
