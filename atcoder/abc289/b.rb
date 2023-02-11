N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

i = 0
ans = []
b = []
1.upto(N) do |n|
  if n == A[i]
    b << n
    i += 1
  else
    if !b.empty?
      b << b[-1] + 1
      ans += b.sort_by { |x| -x }
      b = []
    else
      ans << n
    end
  end
end

p(ans)
