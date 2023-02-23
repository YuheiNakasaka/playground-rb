# https://atcoder.jp/contests/typical90/tasks/typical90_v
# ■考え方
# 算数っぽい。A,B,Cの最大公約数が立方体の一辺の長さになりそう。
#
# 解説
# https://twitter.com/e869120/status/1385725481920520193/photo/1
A, B, C = gets.split.map(&:to_i)
gcd = A.gcd(B).gcd(C)
puts(((A / gcd) - 1) + ((B / gcd) - 1) + ((C / gcd) - 1))
