# 幅優先探索
# https://atcoder.jp/contests/tessoku-book/tasks/math_and_algorithm_an
#
class Solver
  def initialize
  end

  def solve
    n, m = gets.split.map(&:to_i)
    g = Array.new(n + 1) { [] }
    m.times do |i|
      a, b = gets.split.map(&:to_i)
      g[a] << b
      g[b] << a
    end

    visited = Array.new(n + 1, -1)
    visited[1] = 0
    q = [1]
    while q.empty?.!
      v = q.shift
      g[v].each do |i|
        next if visited[i] != -1
        visited[i] = visited[v] + 1
        q << i
      end
    end

    1.upto(n) do |i|
      puts(visited[i])
    end
  end
end

Solver.new.solve
