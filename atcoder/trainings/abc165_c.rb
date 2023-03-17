# https://atcoder.jp/contests/abc165/tasks/abc165_c
#
# ■考えたこと
# 条件が色々とあるが、とりあえずは数列Aが分かればAb - Aa = cを満たすか調べて、満たせばdを足していけば良い。
# じゃあAをどう探すかという話。制約としては1<=A1<=A2..<=An<=MでN<=10,M<=10
# 普通に全探索だと10^10か？と思ったがAnの条件をみるとそんなに多くないか？
# 再帰で条件を満たす場合だけの数列を作るか
# ■解説
# 考え方が合っている。深さ優先探索で数列を全探索するのも合っていた。OK。計算量の求め方はなるほどだ。
# https://img.atcoder.jp/abc165/editorial.pdf

N, M, Q = gets.split.map(&:to_i)
q = Array.new(Q)
Q.times do |i|
  q[i] = gets.split.map(&:to_i)
end

$A = []

def dfs(an, list)
  if N <= list.size
    $A << list
    return
  end

  if list.empty?.! && an < list.last
    return
  end

  an.upto(M) do |a|
    dfs(a, list + [a])
  end
end

dfs(1, [])

ans = 0
$A.size.times do |i|
  sum = 0
  Q.times do |j|
    a = q[j][0] - 1
    b = q[j][1] - 1
    c = q[j][2]
    d = q[j][3]
    if c == $A[i][b] - $A[i][a]
      sum += d
    end
  end

  ans = [ans, sum].max
end

puts(ans)
