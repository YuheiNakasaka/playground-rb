# nCk
# 階乗
# 剰余の逆元
# a^(p-1) ≡ 1 (mod 13) pとaは互いに素であることが前提
# ※剰余: aを割った余りのことをaの剰余(modulo)という
# ※逆元: aにある値を掛けて1になるとき、その値のことをaの逆元(inverse element)という
#
#  下記記事のコードをライブラリとして使う
# https://qiita.com/k_karen/items/653ba7025a92f5ac1363

MOD = (10 ** 9) + 7
ONE = "1".freeze

# コンビネーションの計算
def nCk(n, k)
  (fact(k + 1, n) * inv(fact(1, n - k) % MOD)) % MOD
end

# 階乗の計算
def fact(s, e)
  (s..e).reduce(1) { |r, i| (r * i) % MOD }
end

# MOD下での逆元の計算
def inv(x)
  # 逆元をどんどんかけるやつ
  res = 1
  # 逆元を計算したい値のMOD化でのべき乗
  beki = x
  (MOD - 2).to_s(2).reverse.chars do |digest|
    res = (beki * res) % MOD if digest == ONE
    beki = (beki * beki) % MOD
  end

  res
end
