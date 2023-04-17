# https://atcoder.jp/contests/abc190/tasks/abc190_c
#
# ■考えたこと
# K<=16なので2^16通りの組み合わせになる。なので2^16通りの組み合わせを再帰で作成し、その中で条件を満たすものの個数を数えてmaxを求める。
# O(2^K * M) = O(10^4 * 10^2) = O(10^6)
# ■解説
# https://atcoder.jp/contests/abc190/editorial/626
N, M = gets.split.map(&:to_i)
AB = M.times.map { gets.split.map(&:to_i) }
K = gets.to_i
CD = K.times.map { gets.split.map(&:to_i) }

ans = 0
(1 << K).times do |bit|
  comp = {}
  K.times do |i|
    if bit & (1 << i) != 0
      comp[CD[i][1]] = true
    else
      comp[CD[i][0]] = true
    end
  end

  sum = 0
  AB.each do |ab|
    if comp[ab[0]] && comp[ab[1]]
      sum += 1
    end
  end

  ans = [ans, sum].max
end

puts(ans)
