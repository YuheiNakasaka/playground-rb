# https://atcoder.jp/contests/abc189/tasks/abc189_c
#
# ■考えたこと
# 尺取系？
# ■解説
#
N = gets.to_i
A = gets.split.map(&:to_i)
ans = 0
0.upto(N - 1) do |l|
  x = A[l]
  l.upto(N - 1) do |r|
    x = [x, A[r]].min
    break if x * (N - l) <= ans
    ans = [ans, x * (r - l + 1)].max
  end
end

puts(ans)
