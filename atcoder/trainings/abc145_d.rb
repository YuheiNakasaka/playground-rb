# https://atcoder.jp/contests/abc145/tasks/abc145_d

X, Y = gets.split.map(&:to_i)

# # 全探索パターン -> 計算量が大きいのでTLE
# $cnt = 0
# $memo = []
# (X + 1).times do
#   $memo << Array.new(Y + 1, [-1, -1])
# end

# def func(x, y)
#   if x >= X || y >= Y
#     return [x, y]
#   end

#   if $memo[x][y][0] != -1 && $memo[x][y][1] != -1
#     return $memo[x][y]
#   end

#   # (i+1, j+2)を選ぶ場合
#   $memo[x][y] = func(x + 1, y + 2)
#   if $memo[x][y][0] == X && $memo[x][y][1] == Y
#     $cnt += 1
#     return $memo[x][y]
#   end

#   # (i+2, j+1)を選ぶ場合
#   $memo[x][y] = func(x + 2, y + 1)
#   if $memo[x][y][0] == X && $memo[x][y][1] == Y
#     $cnt += 1
#     return $memo[x][y]
#   end

#   $memo[x][y]
# end

# func(0, 0)
# puts($cnt)

# わからない...
# X,Yの範囲がでかいので数学的な考え方とか法則があるはずだがわからん。
