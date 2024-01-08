# frozen_string_literal: true

# https://atcoder.jp/contests/abc335/tasks/abc335_c
#
# ■考えたこと
#
# ■解説
#
n, q = gets.split.map(&:to_i)
dots = (1..n).map { |i| [i, 0] }
ans = []
q.times do
  i, c = gets.split
  i = i.to_i
  if i == 1
    case c
    when 'U'
      dots.unshift([dots[0][0], dots[0][1] + 1])
    when 'D'
      dots.unshift([dots[0][0], dots[0][1] - 1])
    when 'L'
      dots.unshift([dots[0][0] - 1, dots[0][1]])
    when 'R'
      dots.unshift([dots[0][0] + 1, dots[0][1]])
    end
  else
    ans << dots[c.to_i - 1]
  end
end

ans.each do |x, y|
  puts "#{x} #{y}"
end
