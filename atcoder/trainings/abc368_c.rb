# frozen_string_literal: true

# https://atcoder.jp/contests/abc368/tasks/abc368_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
a = gets.split.map(&:to_i)
t = 0
a.each do |ai|
  num = ai / 5
  t += num * 3
  ai -= num * 5
  while ai > 0
    t += 1
    ai -= if t % 3 == 0
            3
          else
            1
          end
  end
end
p t
