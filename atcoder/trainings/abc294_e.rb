# https://atcoder.jp/contests/abc294/tasks/abc294_e
#
# ■考えたこと
# 上列をA、下列をBとする。Bの数字が変わる切れ目をiとして切れ目を並べた列をBIを作る。Aの切れ目をBIから二分探索で探す。計算量はO(nlogn)くらいで間に合うか？
# ■解説
# 前から2つの列を見ていって先に切れる点を前から順に見ていけばよかった...
# 想定解法としてはイベントソートというのを使っていたのでそれで解いてみる
# https://atcoder.jp/contests/abc294/tasks/abc294_e/editorial
L, n1, n2 = gets.split.map(&:to_i)
events = []

2.times do |i|
  t = 0
  [n1, n2][i].times do |j|
    v, l = gets.split.map(&:to_i)
    events << [t, i, v]
    t += l
  end
end

events.sort! do |a, b|
  a[0] <=> b[0]
end

events.push([L, 0, 0])

val = Array.new(2, 0)
pt = 0
ans = 0
events.each do |t, i, v|
  # p("t: #{t}, i: #{i}, v: #{v}, val: #{val}, pt: #{pt}, ans: #{ans}")
  if val[0] == val[1]
    ans += t - pt
  end

  val[i] = v
  pt = t
end

puts(ans)
