# frozen_string_literal: true

# https://atcoder.jp/contests/abc341/tasks/abc341_c
#
# ■考えたこと
#
# ■解説
#
h, w, n = gets.split.map(&:to_i)
t = gets.chomp.chars
g = Array.new(h) { Array.new(w) }
h.times do |i|
  g[i] = gets.chomp.split('')
end

ans = 0
h.times do |i|
  w.times do |j|
    next if g[i][j] == '#'

    ok = true
    now = [i, j]
    t.each do |c|
      now = case c
            when 'L'
              [now[0], now[1] - 1]
            when 'R'
              [now[0], now[1] + 1]
            when 'U'
              [now[0] - 1, now[1]]
            else
              [now[0] + 1, now[1]]
            end
      if now[0].negative? || now[0] >= h || now[1].negative? || now[1] >= w || g[now[0]][now[1]] == '#'
        ok = false
        break
      end
    end

    ans += 1 if ok
  end
end

puts ans
