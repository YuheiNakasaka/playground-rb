# https://atcoder.jp/contests/abc176/tasks/abc176_c
#
# ■考えたこと
# 前から順に見ていき次の要素が条件を満たすように台を上げていく
# ■解説
# https://atcoder.jp/contests/abc176/editorial/61
N = gets.to_i
A = gets.split.map(&:to_i)

ans = 0
prev = A[0]
1.upto(N - 1) do |i|
  if prev > A[i]
    ans += prev - A[i]
    A[i] = prev
    prev = A[i]
  else
    prev = A[i]
  end
end

puts(ans)
