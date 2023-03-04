# ■問題
# 正整数N が与えられます。
# 正整数の組 (A,B,C,D) であって、AB+CD=N を満たすものの個数を求めてください。

require "prime"

# nの素因数の数を数えるやつ
def d(n, primes)
  res = 1
  primes.each do |i|
    break if n < i
    tmp = 0
    while n % i == 0
      n /= i
      tmp += 1
    end

    res *= tmp + 1 if tmp > 0
  end

  if n >= 2
    res *= 2
  end

  res
end

n = gets.to_i
ans = 0
primes = Prime.each(Math.sqrt(n).to_i).to_a
(1..n).each do |ab|
  cd = n - ab
  next if cd == 0
  ans += d(ab, primes) * d(cd, primes)
end

puts(ans)
