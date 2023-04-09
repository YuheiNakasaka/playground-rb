K = gets.chomp

b_i = nil
b_j = nil
K.each_char.with_index do |c, i|
  if c == "B" && b_i.nil?
    b_i = i
  elsif c == "B" && b_j.nil?
    b_j = i
  end
end

r_i = nil
r_j = nil
k_i = nil
K.each_char.with_index do |c, i|
  if c == "R" && r_i.nil?
    r_i = i
  elsif c == "R" && r_j.nil?
    r_j = i
  elsif c == "K" && k_i.nil?
    k_i = i
  end
end

if b_i % 2 != b_j % 2 && r_i < k_i && k_i < r_j
  puts("Yes")
else
  puts("No")
end
