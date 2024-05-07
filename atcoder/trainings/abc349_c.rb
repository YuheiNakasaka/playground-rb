# frozen_string_literal: true

# https://atcoder.jp/contests/abc349/tasks/abc349_c
#
# ■考えたこと
#
# ■解説
# 正規表現だともっと楽だ。計算量は正規表現エンジンによって異なりそうだけど。
s = gets.chomp.chars
t = gets.chomp.chars.map(&:downcase)
f = false
is_two = t[2] == 'x'
i = 0
s.each do |c|
  i += 1 if c == t[i]
  if is_two && i == 2
    f = true
    break
  elsif !is_two && i == 3
    f = true
    break
  end
end

puts f ? 'Yes' : 'No'
