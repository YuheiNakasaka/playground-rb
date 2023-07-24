# https://atcoder.jp/contests/abc311/tasks/abc311_c
#
# ■考えたこと
# 有向グラフのDFSで閉路探索
# 制約的に必ず閉路はあるようなので適当な頂点からDFSして、閉路があればそれを出力して終了
# ■解説
#
n = gets.to_i
a = gets.split.map(&:to_i)
g = Array.new(n + 1) { [] }
n.times do |i|
  g[i + 1] << a[i]
end

def dfs(g, v, vs)
  vs << v

  if @visited[v]
    return vs
  end

  if g[v].nil?
    return nil
  end

  @visited[v] = true
  g[v].each do |next_v|
    resp = dfs(g, next_v, vs)
    if !resp.nil?
      return resp
    end
  end

  nil
end

@start = nil
n.times do |i|
  v = i + 1
  @visited = Array.new(n + 1, false)
  @start = v
  resp = dfs(g, v, [])
  if resp.nil?.!
    start = resp[-1]
    l = resp[0...-1].index(start)
    puts(resp[l...-1].size)
    puts(resp[l...-1].join(" "))
    exit
  end
end
