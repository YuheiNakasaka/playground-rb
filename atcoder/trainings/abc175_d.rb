# https://atcoder.jp/contests/abc175/tasks/abc175_d
#
# 1回以上K回以下好きに移動できる。必ずK回移動しなくて良い。
# 2<=N<=5000なのでO(N^2)ができそう
# Kは<=10^9なのででかい
# Piは全て異なる -> 移動したら必ず別のコマへ移動する
# Ciは負の値も取り得る
#
# ナイーブにやるとO(NxK)でできるはずだがTLE
#
# 最小のCiのコマからスタートして取り敢えずmin(1周orK回)だけ進んでみるだけしてみるか？
# スタートするコマを決めるとルートは確定する。つまり周回ルートはN種類しかない。
# 1周分の累積和をN種類分求めておく
#
# 7 10
# 2 4 1 3 7 5 6
# 10 20 -30 40 -50 -60 70
#
# わからん。解説を見る
# https://drken1215.hatenablog.com/entry/2020/08/17/182700
# N, K = gets.split.map(&:to_i)
# P = gets.split.map(&:to_i)
# C = gets.split.map(&:to_i)

# s = Array.new(N) { Array.new(N + 1, 0) }

# defined = false
# ans = -10 ** 32
# N.times do |i|
#   idx = P[i] - 1
#   1.upto(N) do |j|
#     s[i][j] = s[i][j - 1] + C[idx]
#     idx = P[idx] - 1
#     if ans < s[i][j]
#       ans = s[i][j]
#     end
#   end
# end

# p(s)
# if N < K
#   m = -10 ** 32
#   maxIdxs = []
#   N.times do |i|
#     if m <= s[i][-1]
#       m = s[i][-1]
#       maxIdxs << i
#     end
#   end

#   if m > 0
#     a = K / N
#     r = K % N
#     rmax = -10 ** 32
#     maxIdxs.each do |maxIdx|
#       r.times do |i|
#         if s[maxIdx][i + 1] > rmax
#           rmax = s[maxIdx][i + 1]
#         end
#       end

#       puts(a * m + rmax)
#       rmax = -10 ** 32
#     end
#   else
#     puts(ans)
#   end
# else
#   puts(ans)
# end
