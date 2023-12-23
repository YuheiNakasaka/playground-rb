# frozen_string_literal: true

# https://atcoder.jp/contests/abc270/tasks/abc270_c
#
# ■考えたこと
#
# ■解説
#
@n, @x, @y = gets.split.map(&:to_i)
@g = Array.new(@n) { [] }
(@n - 1).times do |i|
  u, v = gets.split.map(&:to_i)
  @g[u - 1] << v - 1
  @g[v - 1] << u - 1
end

@ans = []
@visited = Array.new(@n, false)
def dfs(v)
  return true if v == @y - 1

  @visited[v] = true
  @g[v].each do |nv|
    next if @visited[nv]

    @visited[nv] = true

    resp = dfs(nv)
    if resp
      @ans << nv
      return resp
    end
  end
  nil
end

dfs(@x - 1)
@ans << @x - 1
puts @ans.reverse.map { |a| a + 1 }.join(' ')
