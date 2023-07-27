# https://atcoder.jp/contests/abc284/tasks/abc284_d
#
# ■考えたこと
# (10**6)個くらいの素数を求めて割っていけばいけるか？
# 最大でも 9 * 10**18なら 10**6 * 10**6 * 10**6 だし。3secあればいけそう？
# ■解説
#
require "prime"

max = 664580
gen = Prime::EratosthenesGenerator.new
primes = []
max.times { primes << gen.next }

ans = []
n = gets.to_i
n.times do
  t = gets.to_i
  primes.each do |x|
    next if t % x != 0
    p2 = x.pow(2)
    if t % p2 == 0
      ans << "#{x} #{t / p2}"
    else
      ans << "#{Math.sqrt(t / x).to_i} #{x}"
    end

    break
  end
end

ans.each do |a|
  puts(a)
end
