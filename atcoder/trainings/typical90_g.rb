# https://atcoder.jp/contests/typical90/tasks/typical90_g
#
# 全てのクエリで|a - b|を最小にする
#
# クエリに答えていくやつなのでO(N)かO(Q)で累積和でO(1)でクエリ処理するみたいな感じかな
# ナイーブにやるとO(NQ)でTLEする
# aからbに最も近い数を選び続けるだけなのでAiを二分探索でbに近いものを探していけばO(QlogN) + O(NlogN)でいけそうか？

# 合ってた。解説。
# https://twitter.com/e869120/status/1379565222541680644/photo/1

N = gets.to_i
A = gets.split.map(&:to_i)
Q = gets.to_i

ans = []
A.sort!
i = 0
while i < Q
  b = gets.to_i
  index = A.bsearch_index { |a| a >= b } || N - 1
  if index == 0
    ans << (A[index] - b).abs
  else
    ans << [(A[index] - b).abs, (A[index - 1] - b).abs].min
  end

  i += 1
end

ans.each do |an|
  puts(an)
end
