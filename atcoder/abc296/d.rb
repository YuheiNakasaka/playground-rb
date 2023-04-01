# 条件:
# X = a * b
# 1 <= a, a <= N, 1 <= b, b <= N
# M <= X
# M以上の値を二分探索的に探すのはどうか？
# a,bの組み合わせは約数列挙したものからNをどちらも見たすか確認すれば良いか？
#
# 小さいa,bから順に見ていくと、a * bがM以上になるのはaが...
# 10**6の範囲で行けそうだけど...
#
# 解説
# 数学的に考える問題だった
# https://atcoder.jp/contests/abc296/editorial/6115
N, M = gets.split.map(&:to_i)
INF = 10 ** 32
ans = INF
x = INF
1.upto(N) do |i|
  x = (M + i - 1) / i
  if x <= N
    ans = [i * x, ans].min
  end

  break if i > x
end

if ans == INF
  puts(-1)
else
  puts(ans)
end
