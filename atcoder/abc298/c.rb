require "set"

N = gets.to_i
Q = gets.to_i
f2 = Array.new(N + 1) { [] }
f3 = Array.new(2 * 10 ** 5 + 1) { SortedSet.new }
Q.times do
  q = gets.split.map(&:to_i)
  if q[0] == 1
    i = q[1] - 1
    j = q[2] - 1
    f2[j].push(i)
    f3[i].add(j)
  elsif q[0] == 2
    i = q[1] - 1
    ans = []
    arr = f2[i].sort
    arr.each do |x|
      ans << x + 1
    end

    puts(ans.join(" "))
  else
    i = q[1] - 1
    ans = []
    f3[i].each do |x|
      ans << x + 1
    end

    puts(ans.join(" "))
  end
end
