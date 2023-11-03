# frozen_string_literal: true

# https://atcoder.jp/contests/abc324/tasks/abc324_e
#
# ■考えたこと
#
# ■解説
#
def calc(s, t)
  g = 0
  s.chars.each do |c|
    break if g >= t.size

    g += 1 if c == t[g]
  end
  g
end

n, t = gets.split
n = n.to_i
t.chomp!
si = Array.new(500_001)
a = Array.new(500_001, 0)
b = Array.new(500_001, 0)
c = Array.new(500_001, 0)
1.upto(n) do |i|
  si[i] = gets.chomp
  a[i] = calc(si[i], t)
end
t = t.split('').reverse.join('')
1.upto(n) do |i|
  si[i] = si[i].split('').reverse.join('')
  b[i] = calc(si[i], t)
  c[b[i]] += 1
end

ans = 0
1.upto(n) do |i|
  l = t.size - a[i]
  l.upto(t.size) do |j|
    ans += c[j]
  end
end

puts ans
