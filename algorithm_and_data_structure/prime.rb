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

# 素因数とその個数を配列で返す
# 18 => [[2, 1], [3, 2]] # 2^1 + 3^2
p(18.prime_division)

# 約数列挙
def enum_div(n)
  res = []
  i = 1
  while i * i <= n
    i += 1
    if n % i == 0
      res << i
      res << n / i if n / i != i
    end
  end

  res.sort!
  res
end

p(enum_div(18))
