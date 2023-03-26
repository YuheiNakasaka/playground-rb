# https://atcoder.jp/contests/abc182/tasks/abc182_d
#
# ■考えたこと
# 1動作時に前回の地点から移動する量はA[0..i]の和である。
# 1動作中の最大値となり得る動きiはMAX(S(A[0]), S(A[0..1]), S(A[0..2]),...,S(A[0..i]))で得られる。
# 前回の地点と前回の地点+1動作中の最大値がその動作における最大値なのでこれを全ての動作iで求めて一番大きいものを答えとすればよい。
# ■解説
# https://atcoder.jp/contests/abc182/editorial/291

N = gets.to_i
A = gets.split.map(&:to_i)
acc = Array.new(N + 1, 0)
accc = Array.new(N + 1, 0)
N.times do |i|
  acc[i + 1] = acc[i] + A[i]
end

# accc[0] = -10 ** 18
N.times do |i|
  accc[i + 1] = [accc[i], acc[i + 1]].max
end

# p(acc)
# p(accc)

prev = 0
ans = 10 ** 18 * -1
1.upto(N) do |i|
  # p("prev: #{prev}, ans: #{ans}, accc[i]: #{accc[i]}")
  ans = [ans, prev + accc[i]].max
  prev = prev + acc[i]
end

puts(ans)
