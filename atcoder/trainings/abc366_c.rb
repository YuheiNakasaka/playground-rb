# frozen_string_literal: true

# https://atcoder.jp/contests/abc366/tasks/abc366_c
#
# ■考えたこと
#
# ■解説
#
q = gets.to_i
ans = []
kind = 0
h = Hash.new(0)
q.times do
  query = gets.split
  case query[0]
  when '1'
    kind += 1 if h[query[1]].zero?
    h[query[1]] += 1
  when '2'
    h[query[1]] -= 1
    kind -= 1 if h[query[1]].zero?
  when '3'
    ans << kind
  end
end

ans.each do |a|
  puts a
end
