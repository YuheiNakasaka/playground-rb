# https://atcoder.jp/contests/abc302/tasks/abc302_d
#
# ■考えたこと
# 価値の差をD以下にしつつA+Bを最大化する
# 普通にやるとO(AB)で10**10になり間に合わない
# 片方の価値の配列Aの値aともう片方の価値の配列Bを二分探索で探索する
# 二分探索の条件はmid+1の値が条件を満たしつつ最大を更新する時は右に、そうでない時は左に探索する
# ■解説
# Ai - Bi <= D <=> Ai <= Bi + D として考えると、
# 昇順ソートしたAの中でBi+Dとなる値を二分探索してその値もしくはそれより一つ小さい値を選べば良い
# こっちの方が実装簡単だ...
# https://atcoder.jp/contests/abc302/editorial/6412
N, M, D = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort
B = gets.split.map(&:to_i).sort
ans = -1

if A.size > B.size
  x = A
  y = B
else
  x = B
  y = A
end

x.each do |a|
  l = 0
  r = y.size - 1
  while l <= r
    mid = (l + r) / 2
    b = y[mid]
    ans = [ans, a + b].max if (a - b).abs <= D
    if (a - b).abs <= D || b < a
      l = mid + 1
    else
      r = mid - 1
    end
  end
end

puts(ans)
