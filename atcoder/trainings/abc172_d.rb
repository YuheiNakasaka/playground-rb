# https://atcoder.jp/contests/abc172/tasks/abc172_d
# X(自然数)でf(X)はXの約数の個数である。
# k=1~NまでのK x f(K)の和を求めよ。
# N <= 10**7
#
# 約数列挙するにしても素因数分解するにしても10**7をループさせるのは無理
# 下記のエラトステネスの篩的なやり方だと10**6くらいまでならギリギリ行けるが10**7だと10秒くらいかかって無理
# 累積和てきな考え方使うのかね？数学的な考え方か？

# わからん。解説
# https://crieit.net/posts/koya-abc172-d
# https://at274.hatenablog.com/entry/2020/06/28/193139
#
# よく見たら制限は3secだった。2secと勘違いしてたっぽい。
# てかC++だと下記の回答でもO(NlogN)で通るっぽい

# N = gets.to_i
# i = 0
# a = []
# while i < N + 1
#   a << i += 1
# end

# res = Array.new(N + 1, 1)
# i = 1
# while i < N + 1
#   j = 2
#   # ここは調和級数でO(logN)なはず
#   while i * j < N + 1
#     res[i * j] += 1
#     j += 1
#   end

#   i += 1
# end

# ans = 0
# l = res[1..-1]
# i = 0
# while i < l.length
#   ans += l[i] * (i + 1)
#   i += 1
# end

# puts(ans)

N = gets.to_i
ans = 0
d = 1
while d < N + 1
  # 等差数列の和
  # n(2a + d(n-1))/2
  n = N / d
  ans += n * (2 * d + d * (n - 1)) / 2
  d += 1
end

puts(ans)
