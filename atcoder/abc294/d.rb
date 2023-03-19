require "set"

N, Q = gets.split.map(&:to_i)
event = Array.new(N)
Q.times do |i|
  event[i] = gets.split.map(&:to_i)
end

called = Set.new
last = -1
ans = []
Q.times do |i|
  q, x = event[i]
  if q == 1
    last += 1
    called.add(last)
  elsif q == 2
    called.delete(x - 1)
  elsif q == 3
    ans << called.first
  end
end

ans.each do |i|
  puts(i + 1)
end
