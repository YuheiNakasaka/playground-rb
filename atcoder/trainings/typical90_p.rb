# https://atcoder.jp/contests/typical90/tasks/typical90_p
#
# ■考え方
# 確かこれはこれは大きい硬貨から順に限界まで選び続ければよかったはず
# 1円硬貨があるわけじゃないからダメだ。
# てことはDPか？総当たりだとTLEだしどう工夫すべきか。
# C,B円だけで計算して、残額をA円で支払えるかを試すというやり方ならいけるか？
#
# 考え方は合ってるんだけど、Rubyだと通らない...
# https://atcoder.jp/contests/typical90/submissions/34709332

N = gets.to_i
abc = gets.split.map(&:to_i)
A, B, C = abc.sort

m = 9999
imax = [N / C, m].min
imax.downto(0) do |i|
  jmax = [m - i, (N - C * i) / B].min
  jmax.downto(0) do |j|
    k, left = (N - (C * i + B * j)).divmod(A)
    if left % A == 0 && left >= 0
      m = [m, i + j + k].min
      break
    elsif i + j + k >= m - 1
      break
    end
  end
end

puts(m)
