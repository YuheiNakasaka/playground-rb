# frozen_string_literal: true

# https://atcoder.jp/contests/abc329/tasks/abc329_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
s = gets.chomp
h = {}
c = ''
cnt = 0
n.times do |i|
  if s[i] == c
    cnt += 1
  else
    cnt = 0
  end
  c = s[i]
  h["#{c}_#{cnt}"] = 1
end

puts h.keys.size
