N, k = gets.split.map(&:to_i)
S = gets.chomp

ans = ""
N.times do |i|
  if S[i] == "o" && k > 0
    k -= 1
    ans += "o"
  else
    ans += "x"
  end
end

puts(ans)
