# frozen_string_literal: true

# https://atcoder.jp/contests/abc328/tasks/abc328_d
#
# ■考えたこと
# stack に文字を積んでいくだけ
# ■解説
#
s = gets.chomp.chars
stack = []
s.each do |c|
  stack.push(c)
  stack.pop(3) if stack.size >= 3 && stack[stack.size - 3] == 'A' && stack[stack.size - 2] == 'B' && stack[stack.size - 1] == 'C'
end

puts stack.join('')
