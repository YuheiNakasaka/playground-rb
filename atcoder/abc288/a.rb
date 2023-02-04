N = gets.to_i
N.times do
  a, b = gets.split.map(&:to_i)
  puts(a + b)
end
