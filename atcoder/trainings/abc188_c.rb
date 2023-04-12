# https://atcoder.jp/contests/abc188/tasks/abc188_c
#
# ■考えたこと
# 普通にシュミレーションすれば良い
# ■解説
# 別解の方がシンプルで良い。トーナメントで準優勝する人は全体で一番強い人の逆側のブロックで一番強い人になる。
# https://atcoder.jp/contests/abc188/editorial/481
N = gets.to_i
A = gets.split.map(&:to_i)
Q = (0...(2 ** N)).to_a
score = {}
A.each_with_index do |a, i|
  score[i] = a
end

ans = -1
while true
  if Q.size == 2
    a, b = Q.shift(2)
    if score[a] > score[b]
      ans = b
    else
      ans = a
    end

    break
  else
    a, b = Q.shift(2)
    if score[a] > score[b]
      Q << a
    else
      Q << b
    end
  end
end

puts(ans + 1)
