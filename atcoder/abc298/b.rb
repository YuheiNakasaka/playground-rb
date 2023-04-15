N = gets.to_i
a = Array.new(N) { Array.new(N) }
B = Array.new(N) { Array.new(N) }
N.times do |i|
  a[i] = gets.split.map(&:to_i)
end

N.times do |i|
  B[i] = gets.split.map(&:to_i)
end

4.times do
  is_ok = true
  m = Array.new(N) { Array.new(N) }
  N.times do |i|
    N.times do |j|
      m[N + 1 - (j + 1) - 1][i] = a[i][j]
    end
  end

  N.times do |i|
    N.times do |j|
      if m[i][j] == 1 && B[i][j] != m[i][j]
        is_ok = false
        break
      end
    end
  end

  if is_ok
    puts("Yes")
    exit
  end

  a = m.clone
end

puts("No")
