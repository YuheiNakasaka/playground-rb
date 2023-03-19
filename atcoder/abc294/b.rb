H, W = gets.split.map(&:to_i)
A = Array.new(H) { Array.new(W, 0) }
alp = ("A".."Z").to_a
H.times do |i|
  a = gets.split.map(&:to_i)
  W.times do |j|
    if a[j] == 0
      A[i][j] = "."
    else
      A[i][j] = alp[a[j] - 1]
    end
  end
end

H.times do |i|
  puts(A[i].join(""))
end
