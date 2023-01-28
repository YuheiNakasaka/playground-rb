# メモ化再帰
#
# フィボナッチ数列を求める問題
# https://algo-method.com/tasks/423/editorial
#
# 例
# 40
# => 102334155

N = gets.to_i
$memo = Array.new(N, -1)

def func(x)
  if x == 0
    return $memo[x] = 0
  elsif x == 1
    return $memo[x] = 1
  end

  if $memo[x].nil?.! && $memo[x] != -1
    return $memo[x]
  end

  $memo[x] = func(x - 1) + func(x - 2)
  return $memo[x]
end

p(func(N))
