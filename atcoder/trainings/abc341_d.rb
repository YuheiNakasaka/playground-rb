# frozen_string_literal: true

# https://atcoder.jp/contests/abc341/tasks/abc341_d
#
# ■考えたこと
#
# ■解説

n, m, k = gets.split.map(&:to_i)

def gcd(x, y)
  if x > y
    tmp = y
    y = x
    x = tmp
  end

  return x if (y % x).zero?

  gcd(y % x, x)
end

x = (n * m) / gcd(n, m)
l = 0
r = 10**18

while (l + 1) < r
  mid = (l + r) / 2
  y = (mid / n) + (mid / m) - 2 * (mid / x)
  if y < k
    l = mid
  else
    r = mid
  end
end

puts r
