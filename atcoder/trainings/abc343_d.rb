# frozen_string_literal: true
# https://atcoder.jp/contests/abc343/tasks/abc343_d
#
# ■考えたこと
#
# ■解説
#
n, t = gets.split.map(&:to_i)
ab = []
t.times do
  ab << gets.split.map(&:to_i)
end

scores = Array.new(n, 0)
h = {}
h[0] = n
now = 1
anses = []
ab.each do |a, b|
  a -= 1
  if h[scores[a] + b].nil? || h[scores[a] + b].zero?.!
    if h[scores[a] + b].nil?
      now += 1
    end

    h[scores[a] + b] ||= 0
    h[scores[a] + b] += 1
  end

  h[scores[a]] -= 1

  if h[scores[a]].zero?
    now -= 1
    h[scores[a]] = nil
  end

  scores[a] += b

  anses << now
end

anses.each do |ans|
  puts ans
end
