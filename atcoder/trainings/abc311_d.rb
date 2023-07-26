# https://atcoder.jp/contests/abc311/tasks/abc311_d
#
# ■考えたこと
# 基本は探索できる方向に向かってDFS。ただし一度通ったことのある場所は通らない。
# 一度通ったことのある場所は通らないだけだと、下記のような場合に正しく探索できない。
# ##########
# #xxxxx#xx#
# ####xxxxx#
# #xxxxxxx##
# #xxx.xxxx#
# ##########
# 上記の.はマスの周囲のvisitedだけ見ていると辿り着けない。
# なので、マスと探索方向の情報ごとにvisitedを持つ必要がある。
# それでACになる。
# ■解説
# 止まったマスベース(壁にぶつかった時)で考えると、もっと簡単だったっぽい。
# https://atcoder.jp/contests/abc311/editorial/6834
def print_g(x, y)
  @visited.each.with_index do |row, i|
    a = []
    row.each.with_index do |v, j|
      if v && @g[i][j] == "." && x == j && y == i
        a << "X"
      elsif v && @g[i][j] == "."
        a << "x"
      elsif v && @g[i][j] == "#"
        a << "#"
      else
        a << "."
      end
    end

    puts(a.join(""))
  end

  puts("---------")
  sleep(0.4)
end

def dir_idx(x, y, dx, dy)
  "#{x}_#{y}_#{dx}_#{dy}"
end

def dfs(x, y, dx, dy)
  if @g[y][x] == "#" && @visited[y][x]
    return
  end

  if @dir_visited[dir_idx(x, y, dx, dy)]
    return
  end

  if @g[y][x] == "." && @visited[y][x].!
    @sum += 1
  end

  @visited[y][x] = true
  @dir_visited[dir_idx(x, y, dx, dy)] = true
  @dir_visited[dir_idx(x, y, dx * -1, dy * -1)] = true

  # print_g(x, y)

  nx = x + dx
  ny = y + dy
  if @g[ny][nx] == "#"
    dfs(x + 1, y, 1, 0) if @dir_visited[dir_idx(x, y, 1, 0)].!
    dfs(x, y + 1, 0, 1) if @dir_visited[dir_idx(x, y, 0, 1)].!
    dfs(x - 1, y, -1, 0) if @dir_visited[dir_idx(x, y, -1, 0)].!
    dfs(x, y - 1, 0, -1) if @dir_visited[dir_idx(x, y, 0, -1)].!
  else
    dfs(nx, ny, dx, dy)
  end

  return
end

n, m = gets.split.map(&:to_i)
@g = Array.new(n)
@visited = Array.new(n) { Array.new(m, false) }
@sum = 0
@dir_visited = {}
n.times do |i|
  @g[i] = gets.chomp.split("")
  @g[i].size.times do |j|
    @visited[i][j] = true if @g[i][j] == "#"
  end
end

dfs(1, 1, 1, 0)
dfs(1, 1, 0, 1)

puts(@sum)
