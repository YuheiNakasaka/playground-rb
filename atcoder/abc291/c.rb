N = gets.to_i
S = gets.chomp
his = {
  "0_0" => 1
}
o = [0, 0]
ans = "No"
N.times do |i|
  if S[i] == "R"
    o[0] += 1
  elsif S[i] == "L"
    o[0] -= 1
  elsif S[i] == "U"
    o[1] += 1
  elsif S[i] == "D"
    o[1] -= 1
  end

  if his["#{o[0]}_#{o[1]}"] == 1
    ans = "Yes"
    break
  else
    his["#{o[0]}_#{o[1]}"] = 1
  end
end

puts(ans)
