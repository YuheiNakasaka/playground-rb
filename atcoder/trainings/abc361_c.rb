# frozen_string_literal: true

# https://atcoder.jp/contests/abc361/tasks/abc361_c
#
# ■考えたこと
#
# ■解説
# 最小値を固定するとそれ以外のN-K個は最小値以上の値を小さい順にしか選べない。
# それを全てのkの最小値に対して行うことで求める。
N, k = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort
ans = 10**18
0.upto(k) do |i|
  ans = [ans, A[i + (N - k) - 1] - A[i]].min
end
puts ans
