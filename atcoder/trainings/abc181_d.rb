# https://atcoder.jp/contests/abc181/tasks/abc181_d
#
# ■考えたこと
# 全然検討つかない。1~9なので8,16,24,...,72をSに含まれる数字で作れるか調べて、、とか考えたけど、ダメか。
# 1~9の9通り x |S|(2x10**5) の計算量なら一応いけそう。もしかしてDPか？
# ■解説
# 8の倍数の判定法があった。8x125=1000なので以降、10**3以上の数字は10**3*m + nとなり、10**3*mは8で割り切れるため、あとはnが8で割り切れるかどうかを調べればよい。
# nは008,016,024,...,072,992なのでこれらのどれかを作れるかを判定する。
# Sが2桁以下の場合は注意。
# https://atcoder.jp/contests/abc181/editorial/259
S = gets.chomp
h = {}
S.size.times do |i|
  h[S[i]] ||= 0
  h[S[i]] += 1
end

if S.size <= 2
  if S.to_i % 8 == 0 || S.reverse.to_i % 8 == 0
    puts("Yes")
  else
    puts("No")
  end
else
  n = 112
  f = []
  while n < 1000
    f << n.to_s
    n += 8
  end

  ans = "No"
  f.each do |i|
    is_ok = true
    hh = h.clone
    i.split("").each do |j|
      if hh[j].nil?.! && hh[j] > 0
        hh[j] -= 1
      else
        is_ok = false
      end
    end

    if is_ok
      ans = "Yes"
      break
    end
  end

  puts(ans)
end
