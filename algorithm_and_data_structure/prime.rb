# 素数/素因数関連の処理まとめ
# Rubyではprimeライブラリがあるので、そちらを使うのが良い

require "prime"

# 素数判定
# Integer.prime?が速い
# false, true
p(18.prime?, 41.prime?)

# N個の素数列挙
# https://docs.ruby-lang.org/ja/latest/class/Prime=3a=3aEratosthenesGenerator.html
N = 10
gen = Prime::EratosthenesGenerator.new
p(
  # gen.nextを呼ぶたびに次の素数を返す/ rewindを呼び出すと最初からやり直す
  [].tap { |a| N.times { a << gen.next } }
)

# N以下の素数列挙
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

# 区間[n, m]の素数の個数
n = 10
m = 30
np = prime_numbers_under_n(n)
mp = prime_numbers_under_n(m)
p(mp.length - np.length)

# 素因数分解
# 素因数とその個数を配列で返す
# 18 => [[2, 1], [3, 2]] # 2^1 + 3^2
p(18.prime_division)

# nの素因数の数を数える
primes = Prime.each(Math.sqrt(n).to_i).to_a
def prime_division_count(n, primes)
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

# 約数列挙
# SortedSetはRuby3系では消えてるので注意
# addした順序を保ちたいなら普通のSetを使うべし
def enum_div(n)
  return SortedSet.new.add(1) if n == 1

  set = SortedSet.new
  i = 1
  while i * i <= n
    i += 1
    if n % i == 0
      set.add(i)
      set.add(n / i) if n / i != i
    end
  end

  set.add(1)
  set.add(n)
end

p(enum_div(18))

# 高速素因数分解
# https://qiita.com/ganyariya/items/fba261ee53a5b6decc47
#
# 計算量: O(Qlogxi) => Q = 10**6, xi = 10**6 then 10**6 * 6
# spf: xを素因数分解したときの最小の素数
# cnt: x = a * bを満たすa, bの組み合わせの個数
#
# 使い方
# n = 60
# spf = SmallestPrimeFactors.new(n)
# spf.factolize(x) # => [2, 2, 3, 5]
# spf.cnt # => 12
class SmallestPrimeFactors
  attr_accessor :spf, :cnt

  def initialize(n)
    @n = n
    @spf = Array.new(n + 1, 0)
    @cnt = 1
    init_spf
  end

  def factolize(x)
    @cnt = 1
    res = []
    prev = @spf[x]
    e = 0
    while x != 1
      if prev != @spf[x]
        @cnt *= e + 1
        prev = @spf[x]
        e = 0
      end

      e += 1
      res << @spf[x]
      x /= @spf[x]
    end

    @cnt *= e + 1

    res.sort
  end

  def init_spf
    (@n + 1).times do |i|
      @spf[i] = i
    end

    i = 2
    while i * i <= @n
      if @spf[i] == i
        j = i * i
        while j <= @n
          if @spf[j] == j
            @spf[j] = i
          end

          j += i
        end
      end

      i += 1
    end
  end
end
