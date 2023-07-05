# https://atcoder.jp/contests/abc308/tasks/abc308_d
#
# ■考えたこと
#
# ■解説
#
h, w = gets.split.map(&:to_i)
g = Array.new(h) { Array.new(w) }
visited = Array.new(h) { Array.new(w) { [false, false, false, false] } }
h.times do |i|
  s = gets.chomp.split("")
  w.times do |j|
    g[i][j] = s[j]
  end
end

ans = "No"
q = [[0, 0, "s"]]
while q.empty?.!
  ij = q.shift
  if ij[0] == h - 1 && ij[1] == w - 1
    ans = "Yes"
    break
  elsif g[ij[0]][ij[1]] == ij[2]
    next_snuke = case ij[2]
    when "s"
      "n"
    when "n"
      "u"
    when "u"
      "k"
    when "k"
      "e"
    when "e"
      "s"
    end

    if ij[0] + 1 < h && g[ij[0] + 1][ij[1]] == next_snuke && visited[ij[0] + 1][ij[1]][0].!
      visited[ij[0] + 1][ij[1]][0] = true
      q << [ij[0] + 1, ij[1], next_snuke]
    end

    if ij[0] - 1 >= 0 && g[ij[0] - 1][ij[1]] == next_snuke && visited[ij[0] - 1][ij[1]][1].!
      visited[ij[0] - 1][ij[1]][1] = true
      q << [ij[0] - 1, ij[1], next_snuke]
    end

    if ij[1] + 1 < w && g[ij[0]][ij[1] + 1] == next_snuke && visited[ij[0]][ij[1] + 1][2].!
      visited[ij[0]][ij[1] + 1][2] = true
      q << [ij[0], ij[1] + 1, next_snuke]
    end

    if ij[1] - 1 >= 0 && g[ij[0]][ij[1] - 1] == next_snuke && visited[ij[0]][ij[1] - 1][3].!
      visited[ij[0]][ij[1] - 1][3] = true
      q << [ij[0], ij[1] - 1, next_snuke]
    end
  end
end

puts(ans)
