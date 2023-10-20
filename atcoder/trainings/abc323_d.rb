# https://atcoder.jp/contests/abc323/tasks/abc323_d
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
h = {}
n.times do |i|
  s, c = gets.split.map(&:to_i)
  h[s] = c
end

q = h.keys.sort
ans = 0
until q.empty?
  s = q.shift
  c = h.delete(s).to_i
  while c.positive?
    s *= 2
    b = c / 2
    ans += c % 2
    c = b + h.delete(s).to_i
  end
end

puts ans
