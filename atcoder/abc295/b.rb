R, C = gets.split.map(&:to_i)
g = Array.new(R)
R.times do |i|
  g[i] = gets.chomp.split("")
end

R.times do |i|
  C.times do |j|
    m = g[i][j]
    if 1 <= m.to_i && m.to_i <= 9
      power = m.to_i
      R.times do |k|
        C.times do |l|
          b = g[k][l]
          if (i - k).abs + (j - l).abs <= power && [".", "#"].include?(b)
            g[k][l] = "."
          end
        end
      end

      g[i][j] = "."
    end
  end
end

R.times do |i|
  puts(g[i].join)
end
