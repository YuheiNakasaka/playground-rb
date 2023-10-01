# https://atcoder.jp/contests/abc322/tasks/abc322_e
#
# ■考えたこと
# 制約的には3乗DPっぽい。遷移式の作り方がわからない。
# ■解説
# 難しかった..。まだ俺には手が届かない感じ
# https://atcoder.jp/contests/abc322/tasks/abc322_e/editorial
INF = 10**18
n, k, P = gets.split.map(&:to_i)
ca = Array.new(n) { gets.split.map(&:to_i) }
m = 0
k.times do |i|
  m *= P + 1
  m += P
end
dp = Array.new(n + 1) { Array.new(m + 1, INF) }

(n + 1).times do |i|
  dp[i][0] = 0
end

n.times do |i|
  c = ca[i][0]
  a = ca[i][1..]
  (m + 1).times do |j|
    np = 0
    k.times do |l|
      np *= P + 1
      cp = (j / ((P + 1)**(k - 1 - l))) % (P + 1)
      np += [cp + a[l], P].min
    end
    dp[i + 1][j] = [dp[i + 1][j], dp[i][j]].min
    dp[i + 1][np] = [dp[i + 1][np], dp[i][j] + c].min
  end
end

puts dp[n][m] == INF ? -1 : dp[n][m]
