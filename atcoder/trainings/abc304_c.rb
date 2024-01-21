# frozen_string_literal: true

# https://atcoder.jp/contests/abc304/tasks/abc304_c
#
# ■考えたこと
#
# ■解説
#
n, d = gets.split.map(&:to_i)
xy = []
n.times do
  x, y = gets.split.map(&:to_i)
  xy << [x, y]
end

ans = Array.new(n, nil)
infected = [0]
ans[0] = true
until infected.empty?
  i = infected.shift

  next unless ans[i]

  x1, y1 = xy[i]
  xy.each_with_index do |o, j|
    next if i == j || ans[j].nil?.!

    x2, y2 = o
    if Math.sqrt((x1 - x2)**2 + (y1 - y2)**2) <= d
      ans[j] = true
      infected << j
    end
  end
end

ans.each do |a|
  if a
    puts 'Yes'
  else
    puts 'No'
  end
end
