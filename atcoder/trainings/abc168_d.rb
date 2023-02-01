# https://atcoder.jp/contests/abc168/tasks/abc168_d
#
# 無向グラフを作り1から辿れるエッジをめぐっていく
# 1を0として離れていくごとに重みを加えていく
# 重みが小さい場合は重みを更新してキューに追加する
# キューがなくなるまで続ける
# で、時間かけたけどとりあえず通った。
# 無向グラフの作り方が微妙だけどこれで良いのか？
#
# 一応解説は下記
# https://drken1215.hatenablog.com/entry/2020/06/20/174100

require "set"

N, M = gets.split.map(&:to_i)
G = Array.new(N + 1) { Set.new }
M.times do |i|
  v, vv = gets.split.map(&:to_i)
  G[v].add(vv)
  G[vv].add(v)
end

mark = Array.new(N + 1, 0)
weights = Array.new(N + 1) { 10 ** 18 }
weights[0] = weights[1] = 0
queue = [1]
while queue.empty?.!
  v = queue.shift
  G[v].each do |g|
    if weights[g] > weights[v] + 1
      mark[g] = v
      weights[g] = weights[v] + 1
      queue << g
    end
  end
end

is_no = mark[2..-1].select { |b| b == 0 }.length > 0

if is_no
  puts("No")
else
  puts("Yes")
  mark[2..-1].each do |v|
    puts(v)
  end
end

# p(mark)
# p(weights)
# p(G)
