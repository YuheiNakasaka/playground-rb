N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)
c = []

prev = -1
aa = A.clone
bb = B.clone
while c.size <= (N + M)
  a = aa[0] || 10 ** 10
  b = bb[0] || 10 ** 10

  break if a == 10 ** 10 && b == 10 ** 10

  if a < b
    c << aa.shift
  else
    c << bb.shift
  end
end

a_o = []
b_o = []
a_i = 0
b_i = 0
c.size.times do |i|
  if c[i] == A[a_i]
    a_o << i + 1
    a_i += 1
  elsif c[i] == B[b_i]
    b_o << i + 1
    b_i += 1
  end
end

puts(a_o.join(" "))
puts(b_o.join(" "))
