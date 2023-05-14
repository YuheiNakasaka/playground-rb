# https://atcoder.jp/contests/abc300/tasks/abc300_d
#
# ■考えたこと
# a < b < c という条件がある.
# N<=10**12
# a**2 * b * c**2 <= N
# cは最大でも10**5*4以下
# aはcに影響されるが最大でも10**2程度(もし10**3ならa^2は10**6でbも10**3でc^2は10**6になる。もし10**2ならa^2は10**4でbは10**2でcは10**4でいける)
# cを求めて、a,bになり得るものを事前に列挙しておいた素数の組みの中から選んで試す
# 100msくらいRubyだと通らない...
# 2乗してるところをpowに変更。(10 ** 5) * 4を(10 ** 5) * 3に変更。これで通った。
# ■解説
# https://atcoder.jp/contests/abc300/tasks/abc300_d/editorial
require "prime"

def prime_numbers_under_n(n)
  res = []
  gen = Prime::EratosthenesGenerator.new
  i = 1
  while i < n
    i = gen.next
    res << i if i <= n
  end

  res
end

N = gets.to_i
primes = prime_numbers_under_n((10 ** 5) * 3)
a_primes = primes[0..900]
comb = a_primes.combination(2)
comb = comb.sort_by { |a, b| a.pow(2) * b }.to_a
ans = 0
i = 0
while i < primes.size
  c = primes[i]
  comb.each do |m|
    a, b = m
    next unless a < b && b < c
    if a.pow(2) * b * c.pow(2) <= N
      ans += 1
    else
      break
    end
  end

  i += 1
end

puts(ans)
