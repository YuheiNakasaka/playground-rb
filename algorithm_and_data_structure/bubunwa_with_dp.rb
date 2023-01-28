# 部分和問題のDP解法
#
# https://algo-method.com/tasks/438
# 例
# 4 14
# 3 2 6 5
# => true
N, W = gets.split.map { |e| e.to_i }
a = gets.to_s.split.map { |e| e.to_i }

dp = []
(N + 1).times do |i|
  dp << Array.new(W + 1, false)
end

dp[0][0] = true
N.times do |i|
  (W + 1).times do |j|
    next if !dp[i][j]

    dp[i + 1][j] = true

    if j + a[i] <= W
      dp[i + 1][j + a[i]] = true
    end
  end
end

puts(dp[N][W] ? "Yes" : "No")

# dp.each do |e|
#   p(e)
# end
# [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
# [true, false, false, true,  false, false, false, false, false, false, false, false, false, false, false]
# [true, false, true,  true,  false, true,  false, false, false, false, false, false, false, false, false]
# [true, false, true,  true,  false, true,  true,  false, true,  true,  false, true,  false, false, false]
# [true, false, true,  true,  false, true,  true,  true,  true,  true,  true,  true,  false, true,  true]
