# https://atcoder.jp/contests/abc307/tasks/abc307_c
#
# ■考えたこと
# 頑張って実装する系か？なんかめちゃくちゃ実装だるいだけっぽいな...
# ■解説
#
ha, wa = gets.split.map(&:to_i)
a = Array.new(ha)
ha.times do |i|
  a[i] = gets.chomp.split("")
end

hb, wb = gets.split.map(&:to_i)
b = Array.new(hb)
hb.times do |i|
  b[i] = gets.chomp.split("")
end

hx, wx = gets.split.map(&:to_i)
x = Array.new(hx)
hx.times do |i|
  x[i] = gets.chomp.split("")
end

ha.times do |aj|
  wa.times do |ai|
    hb.times do |bj|
      wb.times do |bi|
      end
    end
  end
end

a.each do |t|
  p(t)
end

b.each do |t|
  p(t)
end

x.each do |t|
  p(t)
end
