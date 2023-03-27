# https://atcoder.jp/contests/abc183/tasks/abc183_c
#
# ■考えたこと
# パターンを順列で作成して全探索。計算量はO((N-1)!*N)。Nが8なのでO(10**5)くらい。
# ■解説
# https://atcoder.jp/contests/abc183/editorial/286
N, K = gets.split.map(&:to_i)
T = Array.new(N)
N.times do |i|
  T[i] = gets.split.map(&:to_i)
end

pats = (2..N).to_a.permutation.to_a
pats.size.times do |i|
  pats[i] = pats[i].unshift(1).push(1)
end

ans = 0
pats.size.times do |i|
  sum = 0
  0.upto(N - 1) do |j|
    sum += T[pats[i][j] - 1][pats[i][j + 1] - 1]
  end

  if sum == K
    ans += 1
  end
end

puts(ans)
