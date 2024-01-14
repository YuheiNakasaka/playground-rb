# frozen_string_literal: true

# https://atcoder.jp/contests/abc269/tasks/abc269_d
#
# ■考えたこと
# 各点の周囲の6点について、与えられた点でかつまだチェックしていない点があれば再帰的にマークしていく。
# その点について一通り探索したらans+=1。
# すでにマークされている点の場合はすでにどこかと隣接しているので何もしない。
# ちなみにansの最大値は全ての点が孤立している場合でnになる。
# ■解説
#
def dfs(i, j)
  [
    [-1, -1],
    [-1, 0],
    [0, -1],
    [0, 1],
    [1, 0],
    [1, 1]
  ].each do |di, dj|
    next unless @xy[[i + di, j + dj]]

    if @visited[[i + di, j + dj]].nil?
      @visited[[i + di, j + dj]] = true
      dfs(i + di, j + dj)
    end
  end
end

n = gets.to_i
@xy = {}
@visited = {}
n.times do
  x, y = gets.split.map(&:to_i)
  @xy[[x, y]] = true
end

ans = 0
@xy.each_key do |k|
  next unless @visited[k].nil?

  @visited[k] = true
  dfs(k[0], k[1])
  ans += 1
end

puts ans
