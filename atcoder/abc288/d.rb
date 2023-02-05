# 連続部分列
# ある操作を好きなだけ行って全ての要素を0にするとYes, そうでないならNo
#
# 普通にTLEになるな...
#
# わからん。解説見て再度解いた。
# https://atcoder.jp/contests/abc288/editorial/5664

N, K = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
q = gets.to_i

cum = Array.new(K) { Array.new(N + 1, 0) }
K.times do |j|
  N.times do |i|
    cum[j][i + 1] = cum[j][i]
    if i % K == j
      cum[j][i + 1] += a[i]
    end
  end
end

q.times do
  l, r = gets.split.map(&:to_i)
  init = cum[0][r] - cum[0][l - 1]
  flag = true
  1.upto(K - 1) do |j|
    flag = init == (cum[j][r] - cum[j][l - 1])
    if !flag
      break
    end
  end

  if flag
    puts("Yes")
  else
    puts("No")
  end
end
