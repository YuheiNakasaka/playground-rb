# https://atcoder.jp/contests/abc197/tasks/abc197_c
#
# ■考えたこと
# 数列Aを区間に分ける -> ORを取る -> その値の列でXORをとる -> そのうちの最小値を求める
# N<=20。区間の分け方がどのくらいあるだろうか？それの大きさによって決まるか
# 連続列だしORなら結局は複数区間ではなく2区間に分けるだけでいいのでは？
# ■解説
# どこで分けるかで2^(N-1)通りのbit全探索ができる
# https://atcoder.jp/contests/abc197/editorial/997
N = gets.to_i
A = gets.split.map(&:to_i)
ans = 10 ** 18
(1 << (N - 1)).times do |bit|
  xors = 0
  ors = 0
  0.upto(N) do |i|
    if i < N
      ors |= A[i]
    end

    if i == N || bit[i] == 1
      xors ^= ors
      ors = 0
    end
  end

  ans = [ans, xors].min
end

puts(ans)
