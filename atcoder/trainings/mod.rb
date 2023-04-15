# でかい数の累乗計算は時間がかかる

n = 10 ** 3
a = 2
MOD = 10 ** 9 + 7

t = Time.now.to_f
ans = 0
(10 ** 5).times do |i|
  # 2.5sec
  # ans += (a + i) ** n

  # 3sec
  # ans += ((a + i) ** n) % MOD

  # 0.03sec
  # ans += (a + i).pow(n, MOD)
end

puts(ans % MOD)
puts(Time.now.to_f - t)
