H, W = gets.split.map(&:to_i)
S = Array.new(H)
H.times do |i|
  S[i] = gets.chomp.split("")
end

H.times do |i|
  (W - 1).times do |j|
    if S[i][j] == "T" && S[i][j + 1] == "T"
      S[i][j] = "P"
      S[i][j + 1] = "C"
    end
  end
end

S.each do |s|
  puts(s.join)
end
