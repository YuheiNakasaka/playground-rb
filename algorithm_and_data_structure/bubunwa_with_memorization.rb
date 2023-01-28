# 部分和問題のメモ化再帰
#
# 方針:
# 選ぶ場合と選ばない場合の2通りを再帰で全て試す(2^N)
# その中で計算結果をメモ化しておき、計算済みの場合はメモを返すようにする
# https://algo-method.com/tasks/438
# 例
# 4 14
# 3 2 6 5
# => true
N, W = gets.split.map { |e| e.to_i }
a = gets.to_s.split.map { |e| e.to_i }

$memo = []
(N + 1).times do
  $memo << Array.new(W + 1, -1)
end

def func(i, w, a)
  # puts("i: #{i}, w: #{w}, a: #{a}")
  if i == 0
    return $memo[i][w] = w == 0 ? 1 : 0
  end

  # すでに計算済みの場合
  return $memo[i][w] if $memo[i][w] != -1

  # 選ぶ場合
  if w - a[i - 1] >= 0
    $memo[i][w - a[i - 1]] = func(i - 1, w - a[i - 1], a)
    if $memo[i][w - a[i - 1]] == 1
      return 1
    end
  end

  # 選ばない場合
  $memo[i][w] = func(i - 1, w, a)
  if $memo[i][w] == 1
    return 1
  end

  return 0
end

res = func(N, W, a)
puts(res == 1 ? "Yes" : "No")
