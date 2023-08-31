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
@g = Array.new(@h)
@hh = {"." => 0, "<" => 1, ">" => 2, "v" => 3, "^" => 4, "!" => 5, "#" => 6, "S" => 7, "G" => 8}
@h.times do |i|
  @g[i] = gets.chomp.chars.map { |c| @hh[c] }
end

# >
@h.times do |i|
  blocking = false
  @w.times do |j|
    if @g[i][j] == 2
      blocking = true
    elsif !(@g[i][j] == 0 || @g[i][j] == 5)
      blocking = false
    end

    if blocking && @g[i][j] == 0
      @g[i][j] = 5
    end
  end
end

# <
@h.times do |i|
  blocking = false
  (@w - 1).downto(0) do |j|
    if @g[i][j] == 1
      blocking = true
    elsif !(@g[i][j] == 0 || @g[i][j] == 5)
      blocking = false
    end

    if blocking && @g[i][j] == 0
      @g[i][j] = 5
    end
  end
end
# v
@w.times do |j|
  blocking = false
  @h.times do |i|
    if @g[i][j] == 3
      blocking = true
    elsif !(@g[i][j] == 0 || @g[i][j] == 5)
      blocking = false
    end

    if blocking && @g[i][j] == 0
      @g[i][j] = 5
    end
  end
end
# ^
(@w - 1).downto(0) do |j|
  blocking = false
  (@h - 1).downto(0) do |i|
    if @g[i][j] == 4
      blocking = true
    elsif !(@g[i][j] == 0 || @g[i][j] == 5)
      blocking = false
    end

    if blocking && @g[i][j] == 0
      @g[i][j] = 5
    end
  end
end

@start = []
@h.times do |i|
  @w.times do |j|
    if 1 <= @g[i][j] && @g[i][j] <= 5
      @g[i][j] = 6
    elsif @g[i][j] == 7
      @start = [i, j]
    end
  end
end

@q = [@start]
@score = 0
while @q != []
  z = []
  @q.each do |i, j|
    if i > 0 && @g[i - 1][j] == 8
      puts(@score + 1)
      exit
    end

    if j > 0 && @g[i][j - 1] == 8
      puts(@score + 1)
      exit
    end

    if i < @h - 1 && @g[i + 1][j] == 8
      puts(@score + 1)
      exit
    end

    if j < @w - 1 && @g[i][j + 1] == 8
      puts(@score + 1)
      exit
    end

    if i > 0 && @g[i - 1][j] == 0
      @g[i - 1][j] = nil
      z << [i - 1, j]
    end

    if j > 0 && @g[i][j - 1] == 0
      @g[i][j - 1] = nil
      z << [i, j - 1]
    end

    if i < @h - 1 && @g[i + 1][j] == 0
      @g[i + 1][j] = nil
      z << [i + 1, j]
    end

    if j < @w - 1 && @g[i][j + 1] == 0
      @g[i][j + 1] = nil
      z << [i, j + 1]
    end
  end

  @q = z.dup
  @score += 1
end

puts(-1)
