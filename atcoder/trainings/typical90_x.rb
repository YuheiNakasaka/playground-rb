# https://atcoder.jp/contests/typical90/tasks/typical90_x
# ■考え方
# 操作の性質上、AiとAi+1はそれぞれ独立して考えられる。
# AiをBiと等しくするために最低必要な回数はAi-Biである。
# Ai-Bi + Ai+1-Bi+1 + ...というふうに計算した結果がA=Bにする最低回数
# あとはK回ピッタリにするのはどう判定するか。
# 偶数回残っていればOK。奇数回残っているなら元に戻せないのでNG。とか？
#
# 解説
# https://twitter.com/e869120/status/1386814047081746432/photo/1

N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

diff = 0
N.times do |i|
  diff += (A[i] - B[i]).abs
end

if diff > K
  puts("No")
else
  puts((K - diff) % 2 == 0 ? "Yes" : "No")
end
