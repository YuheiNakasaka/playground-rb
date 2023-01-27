# 貪欲法
# 常にその場で最適な選択肢を選ぶことで、最終的に最適な解を導くアルゴリズム
# 典型問題: 1円と5円を使ってN円を支払うために必要な最小のコインの枚数を求める

n = gets.to_i
coins = [5, 1]

result = 0
while !coins.empty?
  if n - coins.first >= 0
    n = n - coins.first
    result += 1
  else
    coins.shift
  end
end

puts(result)
