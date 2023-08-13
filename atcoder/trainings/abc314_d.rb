# https://atcoder.jp/contests/abc314/tasks/abc314_d
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
s = gets.chomp.split("")
q = gets.to_i
a = Array.new(n, -1)
last_case_q = 0
upper_case = nil
q.times do |i|
  t, x, c = gets.chomp.split
  if t == "1"
    x = x.to_i - 1
    s[x] = c
    a[x] = i
  elsif t == "2"
    upper_case = false
    last_case_q = i
  else
    upper_case = true
    last_case_q = i
  end
end

n.times do |i|
  next if upper_case.nil?
  if a[i] <= last_case_q
    upper_case ? s[i].upcase! : s[i].downcase!
  end
end

puts(s.join(""))
