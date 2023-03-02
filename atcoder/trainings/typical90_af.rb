# https://atcoder.jp/contests/typical90/tasks/typical90_af
# ■ 考えたこと
# 制約が小さいので順列の全探索ができそう。最大で10!通り(O(10^6))だし実行時間も5secある。
#
# 解説。考え方は合ってたがRubyだと500msくらいTLEになるのでだるいハックをしないといけない。
# https://twitter.com/e869120/status/1390074137192767489/photo/1

N = gets.to_i
A = []
N.times do |i|
  A << gets.split.map(&:to_i)
end

M = gets.to_i
XY = []
M.times do |i|
  XY << gets.split.map(&:to_i)
end

# 全通りの順列
INF = 10 ** 18
ans = INF
tmp_ans = []
permutation = (0...N).to_a.permutation.to_a
i = 0
while i < permutation.size
  perm = permutation[i]
  i += 1
  # 制約を満たすかチェック
  is_ok = true
  XY.each do |x, y|
    xindex = perm.index(x - 1)
    if xindex + 1 < N
      if perm[xindex + 1] == y - 1
        is_ok = false
        break
      end
    end

    if xindex - 1 >= 0
      if perm[xindex - 1] == y - 1
        is_ok = false
        break
      end
    end
  end

  next if !is_ok

  tmp_ans << perm
end

i = 0
while i < tmp_ans.size
  perm = tmp_ans[i]
  i += 1
  # タイムを計算
  sum = 0
  j = 0
  perm.each do |i|
    sum += A[i][j]
    j += 1
  end

  if ans > sum
    ans = sum
  end
end

ans == INF ? puts(-1) : puts(ans)
