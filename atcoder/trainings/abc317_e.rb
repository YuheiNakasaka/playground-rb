# https://atcoder.jp/contests/abc317/tasks/abc317_e
#
# ■考えたこと
# ポケモンでトレーナーに見つからないように移動してゴールに向かうみたいな問題だ。
# 通れない道を一通り全て計算しておく
# スタートからdfsでゴールまでの距離の最短を求める。一度通った道を2度通る場合は最短ではないはずなのでその点も考慮。
# 最悪4^4000くらいにになりそうのでdfsの部分でTLEになるのでは。
# ■解説
# グリッドの最短経路はDFSじゃなくてBFS使え。
# Rubyだと通らないのでPyPyで通した

@h, @w = gets.split.map(&:to_i)
@g = Array.new(@h) { Array.new(@w) }
@start = []
@end = []
@h.times do |i|
  hw = gets.chomp.split("")
  @w.times do |j|
    if hw[j] == "S"
      @start = [i, j]
    elsif hw[j] == "G"
      @end = [i, j]
    end

    @g[i][j] = hw[j]
  end
end

@block = Array.new(@h) { Array.new(@w, false) }
@dir = [">", "<", "v", "^"]
@dird = [
  [0, 1],
  [0, -1],
  [1, 0],
  [-1, 0]
]
4.times do |k|
  @h.times do |h|
    @w.times do |w|
      next if @g[h][w] != @dir[k]
      while true
        h += @dird[k][0]
        w += @dird[k][1]
        break if !(0 <= h && h < @h && 0 <= w && w < @w) || @g[h][w] == "#" || @dir.include?(@g[h][w])
        @block[h][w] = true
      end
    end
  end
end

@scores = Array.new(@h) { Array.new(@w, -1) }
@scores[@start[0]][@start[1]] = 0
q = [@start]
while q.empty?.!
  i, j = q.shift
  [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1]
  ].each do |di, dj|
    y = i + di
    x = j + dj
    next if !(0 <= y && 0 <= x && y < @h && x < @w) || @g[y][x] == "#" || @dir.include?(@g[y][x])
    next if @block[y][x]
    if @scores[y][x] == -1
      q.push([y, x])
      @scores[y][x] = @scores[i][j] + 1
    end
  end
end

puts(@scores[@end[0]][@end[1]])
