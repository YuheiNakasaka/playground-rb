# https://atcoder.jp/contests/abc291/tasks/abc291_e
#
# ■考えたこと
# 有向グラフを作ってルートを探す。ルートから順に巡り分岐が無いかつ全ての頂点が連結してるか確認する。ルートから葉まで一直線である頂点の番号を元に数字を割り当てて出力する。
# ■解説
# トポロジカルソートを使う！！！
# https://atcoder.jp/contests/abc291/tasks/abc291_e/editorial

n, m = gets.split.map(&:to_i)
a = Array.new(n) { [] }
d = Array.new(n, 0)

# 大きいAiから小さいAiへ辺を張るDAG(有向非循環グラフ)を作り、一番大きい頂点の次数を0として次数を管理する
m.times do |i|
  u, v = gets.split.map(&:to_i)
  a[v - 1].push(u - 1)
  d[u - 1] += 1
end

# 一番大きい頂点(次数が0)をキューに入れる
q = []
n.times do |i|
  if d[i] == 0
    q << i
  end
end

# トポロジカルソートの結果を管理
A = Array.new(n, 0)
na = n
while q.empty?.!
  # 今回は頂点から貼られた辺が複数ある(大小関係が一意に定まらない)時はNoとする
  if q.size > 1
    puts("No")
    exit
  end

  # 一番大きい頂点から順にでかい値(n以下)を割り当てる
  # 例) 1 > 3 > 2 の関係なら
  # 1には3を3には2を2には1を割り当てる -> A = [3, 1, 2] となる
  v = q.shift
  A[v] = na
  na -= 1
  a[v].each do |u|
    d[u] -= 1
    if d[u] == 0
      q << u
    end
  end
end

puts("Yes")
puts(A.join(" "))
