# https://atcoder.jp/contests/abc282/tasks/abc282_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
s = gets.chomp.chars
m = true
s.each.with_index do |c, i|
  if c == "," && m
    s[i] = "."
  end

  if c == "\""
    m = m.!
  end
end

puts(s.join(""))
