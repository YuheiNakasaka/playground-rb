# frozen_string_literal: true

# https://atcoder.jp/contests/abc334/tasks/abc334_c
#
# ■考えたこと
#
# ■解説
#
n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

if k.even?
  ans = 0
  (1..a.size).step(2) do |i|
    ans += a[i] - a[i - 1]
  end

  puts ans
else
  presum = Array.new(k + 1, 0)
  sufsum = Array.new(k + 1, 0)

  1.upto(k) do |i|
    presum[i] = presum[i - 1]
    presum[i] += a[i - 1] - a[i - 2] if i.even?
  end
  (k - 1).downto(0) do |i|
    sufsum[i] = sufsum[i + 1]
    sufsum[i] += a[i + 1] - a[i] if (k - i).even?
  end

  ans = 10**9
  (0..k).step(2) do |i|
    ans = [ans, presum[i] + sufsum[i]].min
  end

  puts ans
end
