# https://atcoder.jp/contests/abc285/tasks/abc285_d
#
# ■考えたこと
# 無向グラフと見て、頂点数ごとにBFSして開始頂点からの葉の数を開始頂点の訪問回数より多くならなければYesみたいな。->だめ
# 有向グラフでDFS。閉路があるかどうか探すだけでは。S1~SnもT1~Tnも相異なるから、直線になるか閉路になるかだけ考えればよさそう。あとvisitedはskipするので計算量はほぼO(N)でいいのかな。
# ■解説
# UnionFindでマージしながら、同じグループに属する頂点が2つあったらNoというやり方も良い
# https://atcoder.jp/contests/abc285/submissions/41382924
@visited = {}
@start = nil
def dfs(g, v)
  if @visited[v] && v == @start
    return "No"
  end

  if g[v].nil?
    @visited[v] = true
    return
  end

  return if @visited[v]

  @visited[v] = true
  g[v].each do |next_v|
    if dfs(g, next_v) == "No"
      return "No"
    end
  end
end

n = gets.to_i
g = {}
n.times do |i|
  a, b = gets.chomp.split(" ")
  g[a] ||= []
  g[a] << b
end

keys = g.keys
keys.each do |key|
  next if @visited[key]
  @start = key
  if dfs(g, key) == "No"
    puts("No")
    exit
  end
end

puts("Yes")
