# frozen_string_literal: true

# https://atcoder.jp/contests/abc275/tasks/abc275_d
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
@memo = {}
def f(n)
  @memo[n] ||= begin
    return 1 if n.zero?

    f(n / 2) + f(n / 3)
  end
end

puts f(n)
