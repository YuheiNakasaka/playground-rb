# https://atcoder.jp/contests/typical90/tasks/typical90_j
# 単純な累積和

N = gets.to_i
c1 = Array.new(N, 0)
c2 = Array.new(N, 0)
N.times do |i|
  c, s = gets.split.map(&:to_i)
  if c == 1
    c1[i] = s
  else
    c2[i] = s
  end
end

sc1 = Array.new(N + 1, 0)
sc2 = Array.new(N + 1, 0)
1.upto(N) do |i|
  sc1[i] = sc1[i - 1] + c1[i - 1]
end

1.upto(N) do |i|
  sc2[i] = sc2[i - 1] + c2[i - 1]
end

ans = []
Q = gets.to_i
Q.times do |i|
  l, r = gets.split.map(&:to_i)
  res = (sc1[r] - sc1[l - 1]).to_s
  res += " "
  res += (sc2[r] - sc2[l - 1]).to_s
  ans << res
end

ans.each do |a|
  puts(a)
end
