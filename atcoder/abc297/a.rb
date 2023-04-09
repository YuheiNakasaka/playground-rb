N, D = gets.split.map(&:to_i)
T = gets.split.map(&:to_i)
ans = -1
(N - 1).times do |i|
  if T[i + 1] - T[i] <= D
    ans = T[i + 1]
    break
  end
end

puts(ans)
