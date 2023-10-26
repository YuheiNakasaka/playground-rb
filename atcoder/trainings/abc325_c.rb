# frozen_string_literal: true

# https://atcoder.jp/contests/abc325/tasks/abc325_c
#
# ■考えたこと
#
# ■解説
#
@h, @w = gets.split.map(&:to_i)
@g = Array.new(@h) { Array.new(@w) }
@visited = Array.new(@h) { Array.new(@w, false) }
@h.times do |i|
  @g[i] = gets.chomp.split('')
end

def dfs(i, j)
  @visited[i][j] = true
  dfs(i + 1, j) if i + 1 < @h && @g[i + 1][j] == '#' && !@visited[i + 1][j]
  dfs(i - 1, j) if i - 1 >= 0 && @g[i - 1][j] == '#' && !@visited[i - 1][j]
  dfs(i, j + 1) if j + 1 < @w && @g[i][j + 1] == '#' && !@visited[i][j + 1]
  dfs(i, j - 1) if j - 1 >= 0 && @g[i][j - 1] == '#' && !@visited[i][j - 1]
  dfs(i + 1, j + 1) if i + 1 < @h && j + 1 < @w && @g[i + 1][j + 1] == '#' && !@visited[i + 1][j + 1]
  dfs(i + 1, j - 1) if i + 1 < @h && j - 1 >= 0 && @g[i + 1][j - 1] == '#' && !@visited[i + 1][j - 1]
  dfs(i - 1, j + 1) if i - 1 >= 0 && j + 1 < @w && @g[i - 1][j + 1] == '#' && !@visited[i - 1][j + 1]
  dfs(i - 1, j - 1) if i - 1 >= 0 && j - 1 >= 0 && @g[i - 1][j - 1] == '#' && !@visited[i - 1][j - 1]
end

ans = 0
@h.times do |i|
  @w.times do |j|
    if @g[i][j] == '#' && !@visited[i][j]
      dfs(i, j)
      ans += 1
    end
  end
end

puts ans
