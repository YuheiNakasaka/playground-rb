n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
dp = Array.new(n) { Array.new(m, -1) }
dp[0][0] = 0
(n - 1).times do |i|
  m.times do |j|
    next if dp[i][j] == -1
    dp[i + 1][j] = [dp[i][j], dp[i + 1][j]].max
    if j + a[i] < m
      dp[i + 1][j + a[i]] = [dp[i][j] + b[i], dp[i + 1][j + a[i]]].max
    end
  end
end

puts(dp[n - 1][m - 1])
