# https://atcoder.jp/contests/abc166/tasks/abc166_d
#
# A^5 - B^5 = X
# 1 <= X <= 10^9
# A,Bは整数
#
# とりあえず条件を整理。
# A正B正: A > B。Bの方が大きいとXが負になってしまう。
# A負B正: ありえない。Xは正なので。
# A正B負: ありえる。
# A負B負: A > B。Bの方が大きいとXが負になってしまう。
#
# Xが与えられておりBを動かしていくとA^5は一意に決まる。
# A^5をAに直すにはどうするか？
# Xを表現するのに10^9以上の数値はいらないのでは？65の5乗は10^9を超える。
# 負の数を合わせてもたかだか10^2程度のオーダーになる。その数値を全て試してみればいいのでは？
# =>ダメっぽい
# もっと範囲を増やす
# -10^3~10^3にしてみたら通った。ええんかこれで...

X = gets.to_i
a = []
ah = {}
1001.times do |i|
  m = i ** 5
  n = (-i) ** 5
  a << m
  a << n
  ah[m] = i
  ah[n] = -i
end

ans = []
i = 0
while i < a.length
  b = a[i] - X
  if a.include?(b)
    ans << [ah[a[i]], ah[b]]
    break
  end

  i += 1
end

puts(ans.first.join(" "))
