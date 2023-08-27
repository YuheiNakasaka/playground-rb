# https://atcoder.jp/contests/abc317/tasks/abc317_c
#
# ■考えたこと
#
# ■解説
#
n, m = gets.split.map(&:to_i)
@cs = {}
@g = Array.new(n) { [] }
m.times do |i|
  a, b, c = gets.split.map(&:to_i)
  @g[a - 1] << b - 1
  @g[b - 1] << a - 1
  @cs["#{b - 1}_#{a - 1}"] = c
  @cs["#{a - 1}_#{b - 1}"] = c
end

@max = -1
def dfs(idx, routes, sum)
  routes[idx] = true
  @g[idx].each do |i|
    if routes[i]
      if @max <= sum
        @max = sum
      end

      next
    end

    dfs(i, routes.clone, sum + @cs["#{idx}_#{i}"])
  end
end

n.times do |i|
  dfs(i, Array.new(n, false), 0)
end

puts(@max)
