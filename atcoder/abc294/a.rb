N = gets.to_i
A = gets.split.map(&:to_i)

ans = []
N.times do |i|
  if A[i] % 2 == 0
    ans << A[i]
  end
end

puts(ans.join(" "))
