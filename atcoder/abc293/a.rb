S = gets.chomp
ans = ""
1.upto(S.length / 2) do |i|
  ans += S[2 * i - 1] + S[2 * i - 1 - 1]
end

puts(ans)
