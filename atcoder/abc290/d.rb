T = gets.to_i
ans = []
T.times do |i|
  n, d, k = gets.split.map(&:to_i)
  mark = Array.new(n - 1, false)
  init = 0
  kcnt = 0

  while kcnt < k
    x = (init + d) % n
    if !mark[x]
      mark[x] = true
      kcnt += 1
    end

    if kcnt == k
      ans << x
      mark = Array.new(n - 1, false)
    end
  end
end

ans.each do |a|
  puts(a)
end
