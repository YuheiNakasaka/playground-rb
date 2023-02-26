# https://atcoder.jp/contests/typical90/tasks/typical90_aa
N = gets.to_i
h = {}
ans = []
N.times do |i|
  s = gets.chomp
  if h[s].nil?
    h[s] = 1
    ans << i + 1
  end
end

ans.each do |a|
  puts(a)
end
