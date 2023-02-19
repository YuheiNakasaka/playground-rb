N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

ans = 0
M.times do |i|
  ans += A[B[i] - 1]
end

puts(ans)
