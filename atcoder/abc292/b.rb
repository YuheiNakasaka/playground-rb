N, Q = gets.split.map(&:to_i)
arr = Array.new(N, 0)
q = []
Q.times do |i|
  q << gets.split.map(&:to_i)
end

Q.times do |i|
  c, x = q[i]
  if c == 1
    arr[x - 1] += 1
  elsif c == 2
    arr[x - 1] += 2
  else
    if arr[x - 1] >= 2
      puts("Yes")
    else
      puts("No")
    end
  end
end
