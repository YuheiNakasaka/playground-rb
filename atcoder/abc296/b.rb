grid = []
8.times do |i|
  grid << gets.chomp.split("")
end

cols = (1..8).to_a.reverse
rows = ("a".."h").to_a
ans = ""
8.times do |i|
  8.times do |j|
    if grid[i][j] == "*"
      ans = "#{rows[j]}#{cols[i]}"
      break
    end
  end
end

puts(ans)
