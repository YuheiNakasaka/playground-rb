# https://atcoder.jp/contests/abc276/tasks/abc276_d
#
# ■考えたこと
#
# ■解説
#
require 'prime'

n = gets.to_i
a = gets.split.map(&:to_i)

prev = nil
two = Array.new(n, [2, 0])
three = Array.new(n, [3, 0])
other = Array.new(n, 1)
n.times do |i|
  a[i].prime_division.each do |e|
    if e[0] == 2
      two[i] = e
    elsif e[0] == 3
      three[i] = e
    else
      other[i] += e[0] * e[1]
    end
  end
end

other.each do |e|
  if other[0] != e
    puts -1
    exit
  end
end

two.sort! { |a, b| a[1] <=> b[1] }
three.sort! { |a, b| a[1] <=> b[1] }

cnt = 0
min_two = two[0][1]
min_three = three[0][1]
two.each do |e|
  cnt += e[1] - min_two
end
three.each do |e|
  cnt += e[1] - min_three
end

puts cnt
