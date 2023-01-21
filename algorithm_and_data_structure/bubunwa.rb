# 部分和問題のメモ化再帰
# 例題
# 4
# 14
# 3 2 6 5
N = gets.to_s.to_i
W = gets.to_s.to_i
a = gets.to_s.split.map { |e| e.to_i }

$MEMO = []
N.times do
  $MEMO << Array.new(W, -1)
end

def run(i, w, a)
  # ベースケース
  if w == 0
    return true
  elsif i == 0 && w != 0
    return false
  end

  # メモ化。MEMO[i][w]がすでに計算済み(true or false)ならそれを早期リターンする。
  if $MEMO[i - 1][w - a[i - 1]].nil?.! && $MEMO[i - 1][w - a[i - 1]] != -1
    return $MEMO[i - 1][w - a[i - 1]]
  end

  if $MEMO[i - 1][w].nil?.! && $MEMO[i - 1][w] != -1
    return $MEMO[i - 1][w]
  end

  # aを選ぶ場合
  $MEMO[i - 1][w - a[i - 1]] = run(i - 1, w - a[i - 1], a)
  if $MEMO[i - 1][w - a[i - 1]]
    return true
  end

  # aを選ばない場合
  $MEMO[i - 1][w] = run(i - 1, w, a)
  if $MEMO[i - 1][w]
    return true
  end

  return false
end

p($MEMO)
