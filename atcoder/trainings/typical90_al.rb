# https://atcoder.jp/contests/typical90/tasks/typical90_al
A, B = gets.split.map(&:to_i)
lcm = A.lcm(B)
puts(lcm > 10 ** 18 ? "Large" : lcm)
