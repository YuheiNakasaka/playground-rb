# https://atcoder.jp/contests/typical90/tasks/typical90_a
#
# Kで均等に分割できればそれが一番理想
# 理想に一番分割点に近い値を選び続ければよいか？
#
# うまく通らない。
# 解説。解法的には合ってるっぽいが実装ができてない...
# https://twitter.com/e869120/status/1377027868518064129/photo/1
#
# よく読んだら微妙に違った。二分探索でmidを探しながらそれが条件を満たすかどうか判定していく感じ。

N, L = gets.split.map(&:to_i)
k = gets.to_i
A = gets.split.map(&:to_i)
A.unshift(0)

# めぐる式二分探索
# https://qiita.com/drken/items/97e37dd6143e33a64c8c
left = -1
right = L + 1
while right - left > 1
  mid = left + (right - left) / 2

  res = false
  cnt = 0
  pre = 0
  1.upto(N) do |i|
    if A[i] - pre >= mid && L - A[i] >= mid
      cnt += 1
      pre = A[i]
    end
  end

  if cnt >= k
    res = true
  end

  if res == false
    right = mid
  else
    left = mid
  end
end

puts(left)
