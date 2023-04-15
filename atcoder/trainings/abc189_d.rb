# https://atcoder.jp/contests/abc189/tasks/abc189_d
#
# ■考えたこと
# 2^60は大きすぎるので無理。では2^20くらいはどうか。これならO(10^6)で間に合う。
# またAND,ORの結果は前がTRUEかFALSEかだけで決まる
# であるならば最大N=60なので、2^20の全探索を最大でも3回すれば答えが求まりそう。
# ■解説
#
N = gets.to_i
S = []
N.times { S << gets.chomp }
p(S)
