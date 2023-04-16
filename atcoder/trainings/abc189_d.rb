# https://atcoder.jp/contests/abc189/tasks/abc189_d
#
# ■考えたこと
# 2^60は大きすぎるので無理。では2^20くらいはどうか。これならO(10^6)で間に合う。
# またAND,ORの結果は前がTRUEかFALSEかだけで決まる
# であるならば最大N=60なので、2^20の全探索を最大でも3回すれば答えが求まりそう。
# S[N-1]までのAND,ORを計算して、その結果がTRUEかFALSEかで場合分けする。
#
# AND -> trueの場合は全てtrueの1種類のみ
# AND -> falseの場合は上記以外
# OR -> falseの場合は全てfalseの1種類のみ
# OR -> trueの場合は上記以外
# Sは最後のOP以外は順不同で考えて良さそう
# よってANDとORの個数を数えて最後の出力で場合分けして計算すればいけそう
# -> 順不同じゃダメじゃん
# ■解説
#
# https://atcoder.jp/contests/abc189/tasks/abc189_d
#
# ■考えたこと
# 2^60は大きすぎるので無理。では2^20くらいはどうか。これならO(10^6)で間に合う。
# またAND,ORの結果は前がTRUEかFALSEかだけで決まる
# であるならば最大N=60なので、2^20の全探索を最大でも3回すれば答えが求まりそう。
# S[N-1]までのAND,ORを計算して、その結果がTRUEかFALSEかで場合分けする。
#
# ■解説
# DPで解くのが想定解法っぽい
# https://atcoder.jp/contests/abc189/editorial/537
# https://qiita.com/wihan23/items/5d8fcccdc656cb4fd17d

# # 数学的解法
# N = gets.to_i
# ans = 1
# N.times do |i|
#   s = gets.chomp
#   if s == "OR"
#     ans += 2 ** (i + 1)
#   end
# end

# puts(ans)

# DP解法
N = gets.to_i
dp = Array.new(N + 1) { Array.new(2, 0) }
dp[0][0] = 1
dp[0][1] = 1

N.times do |i|
  s = gets.chomp
  if s == "AND"
    dp[i + 1][1] = dp[i][1]
    dp[i + 1][0] = dp[i][0] * 2 + dp[i][1]
  else
    dp[i + 1][0] = dp[i][0]
    dp[i + 1][1] = dp[i][0] + dp[i][1] * 2
  end
end

puts(dp[N][1])
