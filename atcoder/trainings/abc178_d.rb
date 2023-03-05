# https://atcoder.jp/contests/abc178/tasks/abc178_d
#
# ■考えたこと
# 例えばS=10の3+7の場合=3+(3+4, 4+3, 7)=3+(3+(3+1,1+3), (3+1,1+3)+3, 7)みたいにできる。
# 再帰とメモ化で解くのはどうか。あとはDPで解くというのもあるのか？いずれも実装がうまくできない...
# ■解説
# 再帰+メモ化やDPで解くというのは合ってるっぽいが実装ができない
# https://atcoder.jp/contests/abc178/editorial/101
# https://drken1215.hatenablog.com/entry/2020/10/11/211000
# https://www.youtube.com/watch?v=jZ5B9U479oc
#
# 総和が一定値になるような数列の数え上げ == DP、が基本的な考え方

S = gets.to_i
dp = Array.new(S + 1, 0)
dp[0] = 1
1.upto(S) do |v|
  0.upto(v - 3) do |d|
    dp[v] += dp[d]
  end
end

puts(dp[S] % (10 ** 9 + 7))
