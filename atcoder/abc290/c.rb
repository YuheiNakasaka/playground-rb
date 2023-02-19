N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
a = A.sort
c = []
nex = 0
N.times do |i|
  if a[i] == nex
    c << a[i]
    nex += 1
  end
end

if c.empty?
  puts(0)
elsif c.size <= K
  puts(c.last + 1)
else
  puts(c[K - 1] + 1)
end
