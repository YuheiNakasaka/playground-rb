# https://atcoder.jp/contests/abc282/tasks/abc282_d
#
# ■考えたこと
# 辺を追加した時に二部グラフになる頂点組の数を数える問題
# まず最初から連結してなかったり二部グラフでないグラフは0(多分)なので、最初にその判定をする(DFSとか)
# その後二部グラフの黒か白のどちらかの頂点群(N/2個ずつ)から繋がっているもう一方の(全もう一方の色の頂点数 - その頂点からのもう一方の色の頂点数)を足していった結果が答え
# ■解説
# 全てのグラフが連結している必要があると問題文を誤読していた...
# あと余事象っぽくn*(n-1)/2から引いていく方が実装楽そうだった
@n, @m = gets.split.map(&:to_i)
@g = Array.new(@n) { [] }
@colors = Array.new(@n, 0)
@m.times do |i|
  u, v = gets.split.map(&:to_i)
  @g[u - 1] << v - 1
  @g[v - 1] << u - 1
end

def dfs(v, prev, color)
  ret = [0, 0]
  @colors[v] = color
  color == 1 ? ret[0] += 1 : ret[1] += 1

  @g[v].each do |u|
    next if u == prev || @colors[u] == -color
    return [-1, -1] if @colors[u] == color
    res = dfs(u, v, -color)
    return [-1, -1] if res[0] == -1
    ret[0] += res[0]
    ret[1] += res[1]
  end

  return ret
end

ans = @n * (@n - 1) / 2 - @m
@n.times do |i|
  if @colors[i].zero?
    res = dfs(i, -1, 1)
    if res[0] == -1
      puts(0)
      exit
    end

    ans -= res[0] * (res[0] - 1) / 2
    ans -= res[1] * (res[1] - 1) / 2
  end
end

puts(ans)
