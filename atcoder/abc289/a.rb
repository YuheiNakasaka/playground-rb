s = gets.chomp

ans = ""
s.each_char do |c|
  if c == "0"
    ans += "1"
  else
    ans += "0"
  end
end

puts(ans)
