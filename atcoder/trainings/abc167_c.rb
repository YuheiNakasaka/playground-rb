# https://atcoder.jp/contests/abc167/tasks/abc167_c
#
# ■考えたこと
# N,Mの最大値が12なので全探索でいけそう
# ■解説
# https://img.atcoder.jp/abc167/editorial.pdf
N, M, X = gets.split.map(&:to_i)
C = Array.new(N, 0)
A = Array.new(N)
N.times do |i|
  c, *a = gets.split.map(&:to_i)
  C[i] = c
  A[i] = a
end

INF = 10 ** 18
ans = INF
(1 << N).times do |bit|
  ok = 0
  c = 0
  sum = Array.new(M, 0)
  N.times do |i|
    if bit & (1 << i) != 0
      c += C[i]
      M.times do |j|
        next if sum[j] >= X
        sum[j] += A[i][j]
        if sum[j] >= X
          ok += 1
        end
      end
    end
  end

  if ok == M
    ans = [ans, c].min
  end
end

puts(ans == INF ? -1 : ans)
