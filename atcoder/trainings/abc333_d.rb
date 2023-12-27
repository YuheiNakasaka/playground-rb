# frozen_string_literal: true

# https://atcoder.jp/contests/abc333/tasks/abc333_d
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
g = Array.new(n) { [] }
(n - 1).times do
  u, v = gets.split.map(&:to_i)
  g[u - 1] << v - 1
  g[v - 1] << u - 1
end

# 頂点1が葉の場合は1を出力して終了
if g[0].size == 1
  puts 1
  exit
end

# 葉の頂点をキューに入れる
d = Array.new(n, 0)
q = []
g.each.with_index do |u, i|
  q << i if u.size == 1
end

# 頂点1をルートとして配下の各木について葉から根に向かって探索する
l = Array.new(n, 0)
visited = Array.new(n, false)
until q.empty?
  v = q.shift
  visited[v] = true

  g[v].each do |u|
    next if u.zero?
    next if visited[u]

    # 葉から根へ削除の操作回数を累積する
    d[u] += d[v] + 1
    # 削除された子の数を累積することで、ある頂点が現在葉かどうかを判定する
    l[u] += 1
    next if g[u].size - 1 != l[u]

    q << u
  end
end

# 頂点1の周囲の頂点のうち最も削除回数が多いものを除いたものの累計に頂点1の削除操作回数を足し合わせたもの出力する
v1 = g[0].map do |v|
  d[v]
end.sort
puts v1[0...(v1.size - 1)].sum + g[0].size
