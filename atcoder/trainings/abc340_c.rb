# frozen_string_literal: true

# https://atcoder.jp/contests/abc340/tasks/abc340_c
#
# ■考えたこと
#
# ■解説
#
@n = gets.to_i
@memo = {}
def solve(n)
  return @memo[n] unless @memo[n].nil?

  @memo[n] = n == 1 ? 0 : solve(n / 2) + solve((n + 1) / 2) + n
  @memo[n]
end

puts solve(@n)
