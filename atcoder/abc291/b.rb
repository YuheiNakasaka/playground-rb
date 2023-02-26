N = gets.to_i
x = gets.split.map(&:to_i)
x = x.sort

N.times do
  x.shift
end

N.times do
  x.pop
end

puts(x.sum / (5 * N - 2.0 * N))
