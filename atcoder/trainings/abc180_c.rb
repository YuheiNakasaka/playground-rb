# https://atcoder.jp/contests/abc180/tasks/abc180_c
#
# ■考えたこと
# Nの約数を列挙するだけ
# ■解説
#
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

set = enum_div(N)
set.each do |i|
  puts(i)
end
