# 連続部分列
# ある操作を好きなだけ行って全ての要素を0にするとYes, そうでないならNo
#
# 普通にTLEになるな...
#
# わからん。解説。
# https://atcoder.jp/contests/abc288/editorial/5664

require "set"

N, K = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
q = gets.to_i
q.times do |qq|
  l, r = gets.split.map(&:to_i)
  x = a[l - 1..r - 1]
  cum = Array.new(K, 0)
  0.upto(x.size - 1) do |i|
    cum[i % K] += x[i]
  end

  Set.new(cum).size == 1 ? puts("Yes") : puts("No")
end
