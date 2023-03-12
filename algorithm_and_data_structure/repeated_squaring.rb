# 繰り返し二乗法 / ダブリング
# 例えば x ** n (0<x<100, 0<n<10^9) とかを求める際に普通にpowをすると間に合わないが
# 繰り返し二乗法を使うと間に合う。
#
# イメージとしてはn乗を2進数で考えると10**9とかでも`111011100110101100101000000000`で
# 高々30回の掛け算で十分計算できることを利用している。
# https://kyo-pro.hatenablog.com/entry/Repeated-Squaring

def pow_mod(x, n, mod)
  res = 1
  while n > 0
    if n & 1 == 1
      res = res * x % mod
    end

    x = x ** 2 % mod
    n >>= 1
  end

  res
end

p(pow_mod(2, 10 ** 9, 1000000007))
p(pow_mod(99, 10 ** 9, 1000000007))
