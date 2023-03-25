N = gets.to_i
A = gets.split.map(&:to_i)
h = {}

N.times do |i|
  h[A[i]] ||= 0
  h[A[i]] += 1
end

ans = 0
h.keys.each do |k|
  ans += h[k] / 2
end

puts(ans)
