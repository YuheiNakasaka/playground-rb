# 桁DP/Digit DPの基本
# https://qiita.com/pinokions009/items/1e98252718eeeeb5c9ab
#
# キーワード: DP/未満フラグ/Kが出たかどうかのフラグ
#
# 例) 0~Nまでの数のうち3を含む数の個数
#
# dp[i][smaller][j]
# - 未満の時は1、そうでない時は0
# - 3が出た時は1、そうでない時は0
#
# 遷移式
# dp[i+1][smaller][j] = 上からi桁目までの数で条件(未満フラグ/j/いずれかの桁に3を含む)を満たす数の総数

N = gets.to_i
n = N.to_s.chars.map(&:to_i)
l = n.size
dp = Array.new(4) { Array.new(2) { Array.new(2, 0) } }

dp[0][0][0] = 1
l.times do |i|
  2.times do |smaller|
    2.times do |j|
      0.upto(smaller == 1 ? 9 : n[i]) do |x|
        dp[i + 1][smaller == 1 || x < n[i] ? 1 : 0][j == 1 || x == 3 ? 1 : 0] += dp[i][smaller][j]
      end
    end
  end
end

dp.each_with_index do |smaller, i|
  p("#{i}桁 0:#{smaller[0]} 1:#{smaller[1]}")
end

puts(dp[l][0][1] + dp[l][1][1])
