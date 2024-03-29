# https://atcoder.jp/contests/abc194/tasks/abc194_d
#
# ■考えたこと
# 全く検討が付かない。無限界の試行で期待値を求める問題なので数学的に処理するのか？
# 最短で連結するには最低でもN-1回の施行は必要。なのでN-2回以下の場合はたどり着けない。連結してるか調べるにはUnionFindが使える。
# 無限はせいぜい100回くらいまでの試行でいいのでは。
# あとはサンプルから2 * N - Σi*(1/2)^2 でそれっぽい値になるのでよくわからんが通してみるか〜。
# くらいしか思いつかない。
# ■解説
# やはり数学だった...。
# 「確率 p(p≠0) で成功する試行を、成功するまで行うときの試行回数(最後の成功した回も含む) の期待値は 1/pである。」を知らないと解けない
# https://atcoder.jp/contests/abc194/editorial/823
# https://blog.hamayanhamayan.com/entry/2021/03/07/000733
N = gets.to_i

ans = 0
1.upto(N - 1) do |i|
  ans += N.to_f / (N - i)
end

puts(ans)
