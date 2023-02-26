S = gets.chomp

ans = -1
l = 1
S.chars.each do |c|
  if /[[:upper:]]/.match(c)
    ans = l
    break
  end

  l += 1
end

puts(ans)
