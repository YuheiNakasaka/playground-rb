N = gets.to_i
S = gets.chomp
s = S[0]
ans = "Yes"
1.upto(N - 1) do |i|
  if s == S[i]
    ans = "No"
    break
  end

  s = S[i]
end

puts(ans)
