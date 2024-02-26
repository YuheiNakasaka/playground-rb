# frozen_string_literal: true

# https://atcoder.jp/contests/abc342/tasks/abc342_c
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
s = gets.chomp.chars
q = gets.to_i

alphabets = {}
atoz = ('a'..'z').to_a
atoz.each do |char|
  alphabets[char] ||= Array.new(q + 1, nil)
  alphabets[char][0] = char
end

q.times do |i|
  src, dst = gets.split(' ')
  atoz.each do |x|
    alphabets[x][i + 1] = if alphabets[x][i] == src
                            dst
                          else
                            alphabets[x][i]
                          end
  end
end

n.times do |i|
  s[i] = alphabets[s[i]].last
end

puts s.join('')
