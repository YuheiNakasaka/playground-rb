N = gets.to_i
W = gets.split

ans = "No"
N.times do |i|
  if ["and", "not", "that", "the", "you"].include?(W[i])
    ans = "Yes"
    break
  end
end

puts(ans)
