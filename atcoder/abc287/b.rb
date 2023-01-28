# https://atcoder.jp/contests/abc287/tasks/abc287_b
N, M = gets.chomp.split(" ").map(&:to_i)
s = []
t = []
N.times do |i|
  s[i] = gets.chomp
end

M.times do |i|
  t[i] = gets.chomp
end

t = t.uniq

cnt = 0
N.times do |i|
  t.length.times do |j|
    if s[i][3] == t[j][0] && s[i][4] == t[j][1] && s[i][5] == t[j][2]
      cnt += 1
    end
  end
end

puts(cnt)
