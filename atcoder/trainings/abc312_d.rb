# https://atcoder.jp/contests/abc312/tasks/abc312_d
#
# ■考えたこと
# ?を)(に変える2**3000通りのパターンを全探索すると普通にTLE。
# 制約は3000なので3000*3000の計算量か3000*3000*log(3000)の計算量か。
# 過去解いてきた問題的にはスタックやDPや優先度付きキューあたりをうまく使うのだろうか。
# 998244353で割った値を答えるので相当な計算量になるから単純な数え上げではない。
# (を+1で)を-1で表現すると計算しやすいとかもありそう。
# ■解説
# やはりDP。遷移式を考えるのが難しい。()の条件を整理してDPに落とし込むところが思いつかなかった。
# https://atcoder.jp/contests/abc312/editorial/6852
# https://qiita.com/solarflare20031028/items/8303a84085b3528f36af
s = gets.chomp.split("")
n = s.length
dp = Array.new(n + 1) { Array.new(n + 1, 0) }
dp[0][0] = 1
mod = 998244353

n.times do |i|
  n.times do |j|
    next if dp[i][j] == 0

    if s[i] != ")"
      dp[i + 1][j + 1] += dp[i][j] % mod
    end

    if j != 0 && s[i] != "("
      dp[i + 1][j - 1] += dp[i][j] % mod
    end
  end
end

puts(dp[n][0] % mod)
