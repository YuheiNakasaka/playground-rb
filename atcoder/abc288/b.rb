N, K = gets.split.map(&:to_i)
s = []
N.times do
  s << gets.chomp
end

ss = s[0...K]
ss.sort!

ss.each do |c|
  puts(c)
end
