# https://atcoder.jp/contests/typical90/tasks/typical90_f
#
# 長さNの文字列SからnCk種類取り出し方があり、それを順序を保ったまま連結してできる部分文字列のうち、辞書順で最小のものを求める。
# 辞書順とは下記の場合後者の方が辞書順は小さい
# kinla
# inlap
#
# ■考えたこと
# 文字ごとに出現する頻度を調べて、その中から辞書順の早い文字をから順にK個だけ選ぶ。
# Sを左から見ていって選んだ文字が出現するたびにその個数をデクリメントしていくというやり方はどうか？
# アルファベットは26種類しかないのでO(26*N)で探せる方法はないか？
# a~zの順にSを走査して一致する文字があればその位置の文字で空の配列を埋める。最後にそれを連結して出力。
# これだとK=3,kiapみたいな文字の時にiapでなくkiaが出力されてしまいだめ。
# わかりそうでわからない...
#
# ■解法
# 前から貪欲法。辞書順で最小の文字を選ぶ場合は前から貪欲に選ぶ場合がほとんど。
# あとはクエリをO(1)で済ませられるように準備しておく。
# https://twitter.com/e869120/status/1379202843622576130/photo/1
#
# naoyaさんの解説が良かった
# https://zenn.dev/naoya_ito/articles/24dc1117d3fe93

N, K = gets.split.map(&:to_i)
S = gets.chomp

nex = Array.new(N + 1) { Array.new(26, S.size) }

# Sの後ろから見ていって出現する文字がa~zの何番目かを事前計算した表を作っておく
# 例: N = 6 S = cbudar K = 3
#      a b c d ... r s t u v w x y z
# r 6              6
# a 5  5           6
# d 4  5     4     6
# u 3  5     4     6     3
# b 2  5 2   4     6     3
# c 1  5 2 1 4     6     3
alpha = ("a".."z").to_a
(N - 1).downto(0) do |i|
  26.times do |j|
    if alpha[j] == S[i]
      nex[i][j] = i
    else
      nex[i][j] = nex[i + 1][j]
    end
  end
end

# p(nex)

# K=3なので求める文字「***」を頭から順にnexを使って貪欲に決めていく
# nexを1行目の左から(aから)S.size - 見ていって
ans = ""
current_pos = 0
1.upto(K) do |i|
  26.times do |j|
    nex_pos = nex[current_pos][j]
    max_length = S.size - nex_pos - 1 + i
    # puts("i=#{i} j=#{j} current_pos=#{current_pos} nex_pos=#{nex_pos} max_length=#{max_length}")
    if max_length >= K
      # puts("ans=#{ans} alpha[j]=#{alpha[j]}")
      ans += alpha[j]
      current_pos = nex_pos + 1
      break
    end
  end
end

puts(ans)
