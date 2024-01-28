# frozen_string_literal: true

# https://atcoder.jp/contests/abc337/tasks/abc337_d
#
# ■考えたこと
#
# ■解説
#
h, w, k = gets.split.map(&:to_i)
g = Array.new(h) { Array.new(w) }
h.times do |i|
  g[i] = gets.chomp.split('')
end

yoko = Array.new(h) { Array.new(w, 0) }
h.times do |i|
  case g[i][0]
  when '.'
    yoko[i][0] = 1
  end

  1.upto(w - 1) do |j|
    case g[i][j]
    when '.'
      yoko[i][j] = yoko[i][j - 1] + 1
    when 'o'
      yoko[i][j] = yoko[i][j - 1]
    when 'x'
      yoko[i][j] = 0
    end
  end
end

tate = Array.new(h) { Array.new(w, 0) }
w.times do |j|
  case g[0][j]
  when '.'
    tate[0][j] = 1
  end

  1.upto(h - 1) do |i|
    case g[i][j]
    when '.'
      tate[i][j] = tate[i - 1][j] + 1
    when 'o'
      tate[i][j] = tate[i - 1][j]
    when 'x'
      tate[i][j] = 0
    end
  end
end

ans = 10**18
pass = 0
h.times do |i|
  pass = 0
  w.times do |j|
    if g[i][j] == '.' || g[i][j] == 'o'
      pass += 1
    else
      pass = 0
    end

    if pass >= k
      jj = (j - k).negative? ? 0 : yoko[i][j - k]
      ans = [ans, yoko[i][j] - jj].min
    end
  end
end

w.times do |j|
  pass = 0
  h.times do |i|
    if g[i][j] == '.' || g[i][j] == 'o'
      pass += 1
    else
      pass = 0
    end

    if pass >= k
      jj = (i - k).negative? ? 0 : tate[i - k][j]
      ans = [ans, tate[i][j] - jj].min
    end
  end
end

puts ans == 10**18 ? -1 : ans
