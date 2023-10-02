# https://atcoder.jp/contests/abc278/tasks/abc278_d
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
a = gets.split.map(&:to_i)
q = gets.to_i
ans = []
b = Array.new(n + 1) { {} }
n.times do |i|
  b[i + 1][1] = a[i]
end
stage = 1
init = -1
q.times do
  m = gets.split.map(&:to_i)
  if m[0] == 1
    stage += 1
    init = m[1]
  elsif m[0] == 2
    b[m[1]][stage] = init if b[m[1]][stage].nil?
    b[m[1]][stage] += m[2]
  else
    ans << if b[m[1]][stage].nil?
             init
           else
             b[m[1]][stage]
           end
  end
end

ans.each do |an|
  puts an
end
