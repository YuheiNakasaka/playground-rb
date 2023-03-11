N = gets.to_i
A = gets.split.map(&:to_i)

called = Array.new(N, false)

N.times do |i|
  if !called[i]
    called[A[i] - 1] = true
  end
end

ans = []
N.times do |i|
  if !called[i]
    ans << i + 1
  end
end

puts(ans.length)
puts(ans.join(" "))
