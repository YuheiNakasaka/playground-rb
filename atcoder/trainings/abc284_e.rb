# https://atcoder.jp/contests/abc284/tasks/abc284_e
#
# ■考えたこと
# 普通に10**6を超えるまではDFSして超えたらストップじゃダメなん。
# ■解説
# コーナーケースのTLEで消せなかった。通過済みの経路の保存の仕方が面白い。
# https://atcoder.jp/contests/abc284/tasks/abc284_e/editorial
n, m = gets.chomp.split.map(&:to_i)
g = Array.new(n) { [] }
m.times do |i|
  u, v = gets.chomp.split.map(&:to_i)
  g[u - 1] << v - 1
  g[v - 1] << u - 1
end

INF = 10 ** 6
@ans = 0
@vis = Array.new(n, false)
def dfs(g, start)
  return if @ans > INF
  @ans += 1
  @vis[start] = true
  g[start].each do |v|
    next if @vis[v]
    dfs(g, v)
  end

  @vis[start] = false
end

dfs(g, 0)
puts([@ans, INF].min)
