# https://atcoder.jp/contests/abc319/tasks/abc319_c
#
# ■考えたこと
#
# ■解説
#
g = Array.new(3)
g[0] = gets.split.map(&:to_i)
g[1] = gets.split.map(&:to_i)
g[2] = gets.split.map(&:to_i)

h = {
  0 => [0, 0],
  1 => [0, 1],
  2 => [0, 2],
  3 => [1, 0],
  4 => [1, 1],
  5 => [1, 2],
  6 => [2, 0],
  7 => [2, 1],
  8 => [2, 2]
}
all = 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1
cnt = 0
perm = (0..8).to_a.permutation(9).to_a
perm.each do |pm|
  y1 = []
  y2 = []
  y3 = []
  x1 = []
  x2 = []
  x3 = []
  xy1 = []
  xy2 = []
  9.times do |i|
    a = h[pm[i]]
    case a
    when [0, 0]
      y1 << g[0][0]
      x1 << g[0][0]
      xy1 << g[0][0]
    when [0, 1]
      y2 << g[0][1]
      x1 << g[0][1]
    when [0, 2]
      y3 << g[0][2]
      x1 << g[0][2]
      xy2 << g[0][2]
    when [1, 0]
      y1 << g[1][0]
      x2 << g[1][0]
    when [1, 1]
      y2 << g[1][1]
      x2 << g[1][1]
      xy1 << g[1][1]
      xy2 << g[1][1]
    when [1, 2]
      y3 << g[1][2]
      x2 << g[1][2]
    when [2, 0]
      y1 << g[2][0]
      x3 << g[2][0]
      xy2 << g[2][0]
    when [2, 1]
      y2 << g[2][1]
      x3 << g[2][1]
    when [2, 2]
      y3 << g[2][2]
      x3 << g[2][2]
      xy1 << g[2][2]
    end

    next unless (y1[0] == y1[1] && y1[1].nil?.! && y1[1] != y1[2]) ||
                (y2[0] == y2[1] && y2[1].nil?.! && y2[1] != y2[2]) ||
                (y3[0] == y3[1] && y3[1].nil?.! && y3[1] != y3[2]) ||
                (x1[0] == x1[1] && x1[1].nil?.! && x1[1] != x1[2]) ||
                (x2[0] == x2[1] && x2[1].nil?.! && x2[1] != x2[2]) ||
                (x3[0] == x3[1] && x3[1].nil?.! && x3[1] != x3[2]) ||
                (xy1[0] == xy1[1] && xy1[1].nil?.! && xy1[1] != xy1[2]) ||
                (xy2[0] == xy2[1] && xy2[1].nil?.! && xy2[1] != xy2[2])

    cnt += 1
    break
  end
end

puts((all - cnt) / all.to_f)
