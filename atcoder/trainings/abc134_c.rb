# https://atcoder.jp/contests/abc134/tasks/abc134_c

# 累積maxの典型問題
N = gets.to_i
A = [].tap do |a|
  N.times do |i|
    a << gets.to_i
  end
end

left = Array.new(N + 1, 0)
right = Array.new(N + 1, 0)
N.times do |i|
  left[i + 1] = [left[i], A[i]].max
  right[i + 1] = [right[i], A[N - i - 1]].max
end

p(left)
p(right)

N.times do |i|
  puts([left[i], right[N - i - 1]].max)
end

# 普通にこれでも解けるが...
# require "set"
# N = gets.to_i
# A = [].tap do |a|
#   N.times do |i|
#     a << gets.to_i
#   end
# end
# sa = A.sort
# is_all_same = Set.new(A).size == 1
# A.each do |a|
#   if is_all_same
#     puts(a)
#   else
#     if a < sa[-1]
#       puts(sa[-1])
#     else
#       puts(sa[-2])
#     end
#   end
# end
