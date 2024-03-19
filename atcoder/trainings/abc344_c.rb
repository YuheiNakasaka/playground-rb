# frozen_string_literal: true

# https://atcoder.jp/contests/abc344/tasks/abc344_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
a = gets.split.map(&:to_i)
m = gets.to_i
b = gets.split.map(&:to_i)
l = gets.to_i
c = gets.split.map(&:to_i)
q = gets.to_i
x = gets.split.map(&:to_i)

abc = []
a.each do |i|
  b.each do |j|
    c.each do |k|
      abc << i + j + k
    end
  end
end

abc.sort!

ans = []
x.each do |i|
  res = abc.bsearch_index { |x| x >= i }
  ans << if res.nil? || abc[res] != i
           'No'
         else
           'Yes'
         end
end

ans.each { |a| puts a }
