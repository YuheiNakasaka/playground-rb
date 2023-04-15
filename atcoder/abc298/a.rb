N = gets.to_i
S = gets.chomp

is_not = false
is_ok = false
S.each_char.with_index do |c, i|
  if c == "o"
    is_ok = true
  elsif c == "x"
    is_not = true
  end
end

if is_ok && !is_not
  puts("Yes")
else
  puts("No")
end
