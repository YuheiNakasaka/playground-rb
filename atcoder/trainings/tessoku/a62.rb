# 深さ優先探索
class Solver
  def initialize
    @g = []
    @used = []
  end

  def dfs(i)
    @g[i].each do |j|
      next if @used[j] != -1
      @used[j] = 1
      dfs(j)
    end

    return
  end

  def solve
    n, m = gets.split.map(&:to_i)
    @g = Array.new(n) { [] }
    @used = Array.new(n, -1)
    m.times do |i|
      a, b = gets.split.map(&:to_i)
      a -= 1
      b -= 1
      @g[a] << b
      @g[b] << a
    end

    dfs(0)
    if @g.size == 1
      puts("The graph is connected.")
    else
      @used.count(-1).zero? ? puts("The graph is connected.") : puts("The graph is not connected.")
    end
  end
end

Solver.new.solve
