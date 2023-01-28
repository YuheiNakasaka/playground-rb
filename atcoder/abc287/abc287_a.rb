N = gets.chomp.to_i
cnt = 0
N.times do
  a = gets.chomp
  if a == "For"
    cnt += 1
  end
end

if (N / 2) < cnt
  puts("Yes")
else
  puts("No")
end
