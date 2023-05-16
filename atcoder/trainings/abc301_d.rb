# https://atcoder.jp/contests/abc301/tasks/abc301_d
#
# ■考えたこと
# ナイーブにやると、?を0,1に置き換えてできる全ての値を作りN以下になる最大の値を探索する。
# が、これだと|S|<=60なので2**60通りの可能性を試すことになり明らかにTLE。
# 2**n ~ 2**(n-1)で右端と左端を見つけてlog(2**60)=60回程度二分探索してみるか
# →だめ...
# ■解説
# 0) Sを逆順にして考える(i=0がSの一番小さい桁と一致させるため)
# -> こうした方がArrayのindexと一致させて考えることが出来てミスりにくい
# 1) Sの?が全て0とした場合の値をsとする
# 2) sがNより大きいならどう足掻いてもN以下の値は作れないので-1を出力して終了
# 3) sがN以下なら?を下から順に1に変えた値をsに足した時にNを超えないならsにその値を足すことを繰り返す
# https://atcoder.jp/contests/abc301/editorial/6342
S = gets.chomp.chars.reverse
N = gets.to_i
s = 0
S.size.times do |i|
  s |= (S[i] == "1" ? 1 : 0) << i
end

if s > N
  puts(-1)
else
  (S.size - 1).downto(0) do |i|
    if S[i] == "?" && (s | 1 << i) <= N
      s |= 1 << i
    end
  end

  puts(s)
end
