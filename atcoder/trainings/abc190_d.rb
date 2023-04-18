# https://atcoder.jp/contests/abc190/tasks/abc190_d
#
# ■考えたこと
# 数列Xの要素xとする
# a. x <= N
# b. x <= [N/2]
# c. sum(xi..xi+m) = Nが存在する場合は-xi-1..xi-1,xi+xi+mも存在する
# ■解説
# 等差数列の和 -> 式変形 -> 全探索
# https://yamakasa.net/atcoder-abc-190-d/
#
# 等差数列の和を考えて、一部の変数を固定した時に場合分けして、約数列挙した中から全探索
# 2N=n(2a+n−1)
# https://atcoder.jp/contests/abc190/editorial/643

require "set"

def enum_div(n)
  return SortedSet.new.add(1) if n == 1

  set = SortedSet.new
  i = 1
  while i * i <= n
    i += 1
    if n % i == 0
      set.add(i)
      set.add(n / i) if n / i != i
    end
  end

  set.add(1)
  set.add(n)
end

N = gets.to_i
d = enum_div(N * 2)
ans = 0
d.each do |n|
  m = (2 * N) / n
  if (n - m) % 2 == 1
    ans += 1
  end
end

puts(ans)
