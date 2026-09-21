# frozen_string_literal: true
# https://atcoder.jp/contests/abc155/tasks/abc155_b
#
# ■考えたこと
#
# ■解説
#
_ = gets.chomp.to_i
nums = gets.split(' ').map(&:to_i)
result = 'APPROVED'
nums.each do |num|
  next if num.odd?

  if num % 3 != 0 && num % 5 != 0
    result = 'DENIED'
    break
  end
end

puts result
