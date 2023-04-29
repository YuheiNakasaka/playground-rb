# https://atcoder.jp/contests/abc193/tasks/abc193_d
#
# ■考えたこと
# ciの計算がわからん..。11229ならc1=2,c2=2,c9=1ってことかな。
# 既存の4枚の出現回数を調べて点数を求めておき、残りのカードの出現回数を調べて点数を求める。
# 例: K = 2, S = 1144, T = 2233の時、高橋くんが勝利するのは、5枚目の選び方で10C2通りある。そのうち(6,5),(7,5/6),(8,5/6/7),(9,5/6/7/8) x 2 = 20通り
# 20/10C2 = 20/45 = 4/9
# 愚直に組み合わせを数え上げると10^5 * 10^5 = 10^10でTLEになる。
# ■解説
# https://atcoder.jp/contests/abc193/editorial/810
K = gets.to_i
S = gets.chomp
T = gets.chomp
cards = Array.new(10, K)
cards[0] = 0
s_hist = {}
(0..9).each { |i| s_hist[i] = 0 }
t_hist = {}
(0..9).each { |i| t_hist[i] = 0 }
S.each_char do |c|
  if c.to_i != 0
    cards[c.to_i] -= 1
    s_hist[c.to_i] += 1
  end
end

T.each_char do |c|
  if c.to_i != 0
    cards[c.to_i] -= 1
    t_hist[c.to_i] += 1
  end
end

# 分子
a = 0
# 分母
b = (9 * K - 8) * (9 * K - 9)
(1..9).each do |i|
  if cards[i] > 0
    s_5 = i
    cards[i] -= 1
    (1..9).each do |j|
      if cards[j] > 0
        t_5 = j
        cards[j] -= 1
        # スコア計算
        s_h = s_hist.clone
        t_h = t_hist.clone
        s_h[s_5] += 1
        t_h[t_5] += 1
        s_score = 0
        t_score = 0
        (1..9).each do |k|
          s_score += k * (10.pow(s_h[k].to_i))
          t_score += k * (10.pow(t_h[k].to_i))
        end

        if s_score > t_score
          if s_5 == t_5
            a += (cards[s_5] + 2) * (cards[t_5] + 1)
          else
            a += (cards[s_5] + 1) * (cards[t_5] + 1)
          end
        end

        cards[j] += 1
      end
    end

    cards[i] += 1
  end
end

puts(a.to_f / b)
