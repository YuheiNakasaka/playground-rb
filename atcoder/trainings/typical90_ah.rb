# https://atcoder.jp/contests/typical90/tasks/typical90_ah
# ■考えたこと
# 典型的な部分和問題っぽい。しゃくとり法とかかな。
# 部分列に含まれる数の種類を高速に求めたいのでハッシュで管理する。キーの個数が数の種類になり、値がその数の登場回数になる。
# K=1でN=10^5で数列が全て異なる時はO(N^2)になりそう..。なんか実装間違ってる？
# 2200msとかで200msだけ遅い。Ruby以外だと通りそう。
# hash.keys.sizeがO(N)かかるっぽくてそれが原因だった。種類を変数で管理するようにして通った。

# 解説。考え方は合ってた。hash.keys.sizeがO(N)かかるのを見落としていたのはミス。最終的には自力で解けた。
# https://twitter.com/e869120/status/1390798852299448322/photo/1

# N, K = 10 ** 5, 10 ** 5
# A = (10 ** 5).times.map { |i| rand(10 ** 9) }
# t = Time.now.to_f

N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
i, j = 0, 0
max = 0
cnt = 0
kind = 0
hash = {}
while i < N
  while j < N
    if hash[A[j]].nil?
      kind += 1
    end

    hash[A[j]] ||= 0
    hash[A[j]] += 1

    if kind <= K
      cnt += 1
      max = [max, cnt].max
    else
      kind -= 1
      hash.delete(A[j])
      break
    end

    j += 1
  end

  hash[A[i]] = hash[A[i]] - 1
  if hash[A[i]] == 0
    kind -= 1
    hash.delete(A[i])
  end

  i += 1
  cnt -= 1
end

puts(max)

# puts("time: #{Time.now.to_f - t}")
