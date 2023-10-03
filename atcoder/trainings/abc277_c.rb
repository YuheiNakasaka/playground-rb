# https://atcoder.jp/contests/abc277/tasks/abc277_c
#
# ■考えたこと
#
# ■解説
#

n = gets.to_i
@g = {}
@visited = {}
@ans = 0
n.times do
  a, b = gets.split.map(&:to_i)
  @g[a - 1] = [] if @g[a - 1].nil?
  @g[a - 1] << b - 1

  @g[b - 1] = [] if @g[b - 1].nil?
  @g[b - 1] << a - 1
end

def dfs(i)
  @ans = [i, @ans].max
  @visited[i] = true
  @g[i]&.each do |j|
    next if @visited[j]

    dfs(j)
  end
end

dfs(0)

puts @ans + 1
