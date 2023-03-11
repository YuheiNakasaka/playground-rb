H, W = gets.split.map(&:to_i)
grid = Array.new(H)
H.times do |i|
  grid[i] = gets.chomp.split.map(&:to_i)
end

start_x, start_y = 0, 0
$end_x, $end_y = W - 1, H - 1
def dfs(h, w, grid, ans, rec)
  ans += ","
  ans += grid[h][w].to_s
  if h == $end_y && w == $end_x
    rec << ans
    return
  end

  if h < $end_y
    dfs(h + 1, w, grid, ans, rec)
  end

  if w < $end_x
    dfs(h, w + 1, grid, ans, rec)
  end
end

rec = []
dfs(start_y, start_x, grid, "", rec)

sum = 0
rec.each do |r|
  if r.split(",").uniq.size == H + W
    sum += 1
  end
end

puts(sum)
