# https://atcoder.jp/contests/typical90/tasks/typical90_ab
#
# ■考えたこと
# 2枚の紙の左下と右上の座標を比べ合うと重なるかどうかはわかる。ただこれをK枚重なっている時の面積を一発で求め続けるのがわからない。
# 何をどう考えたらいいのか...難しすぎる。1..N回ごとに計算するとN!になるからTLEだしな...。
# 面積の最大は全ての紙が重ならない時で紙の面積の総和。これから重なってる部分を引いていく感じ？
# xy座標は0~1000なので二次元配列を作り、紙で覆う部分を+1していけば重なる場所がわかるかもしれない。
# O(10^5 * 10^6)なのでTLEか...
# もしかしていもす法的なやつ？二次元累積和みたいな
#
# わからん。解説。
# https://twitter.com/e869120/status/1388262816101007363/photo/1
# やはりそうだった...二次元いもす法(二次元累積和)だった。

# N = gets.to_i
# A = Array.new(N) { [] }
# grid = Array.new(1002) { Array.new(1002, 0) }
# N.times do |i|
#   lx, ly, rx, ry = gets.split.map(&:to_i)
#   (ly...ry).each do |y|
#     (lx...rx).each do |x|
#       grid[y][x] += 1
#     end
#   end
# end

# N.times do |i|
#   cnt = 0
#   1002.times do |y|
#     1002.times do |x|
#       if grid[y][x] == i + 1
#         cnt += 1
#       end
#     end
#   end

#   puts(cnt)
# end

N = gets.to_i
A = Array.new(N) { [] }
cnt = Array.new(1002) { Array.new(1002, 0) }
N.times do |i|
  lx, ly, rx, ry = gets.split.map(&:to_i)
  cnt[lx][ly] += 1
  cnt[lx][ry] -= 1
  cnt[rx][ly] -= 1
  cnt[rx][ry] += 1
end

# 上から下へ累積和
1.upto(1001) do |i|
  0.upto(1001) do |j|
    cnt[i][j] += cnt[i - 1][j]
  end
end

# 左から右へ累積和
0.upto(1001) do |i|
  1.upto(1001) do |j|
    cnt[i][j] += cnt[i][j - 1]
  end
end

# 重なった部分(インクリメントされた部分)の数を数える
ans = Array.new(N + 1, 0)
1002.times do |i|
  1002.times do |j|
    ans[cnt[i][j]] += 1
  end
end

# 重なった部分ごとに出力
1.upto(N) do |i|
  puts(ans[i])
end
