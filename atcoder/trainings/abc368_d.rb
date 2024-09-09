# frozen_string_literal: true

# https://atcoder.jp/contests/abc368/tasks/abc368_d
#
# ■考えたこと
#
# ■解説
#
N, K = gets.split.map(&:to_i)
$g = Array.new(N) { [] }
(N - 1).times do
  a, b = gets.split.map(&:to_i)
  $g[a - 1] << b - 1
  $g[b - 1] << a - 1
end
vs = gets.split.map { |o| o.to_i - 1 }
$vs = {}
vs.each do |v|
  $vs[v] = true
end
$visited = Array.new(N, false)
$checked = Array.new(N, false)

def dfs(v)
  flag = false
  $visited[v] = true
  $g[v].each do |nv|
    next if $visited[nv]

    res = dfs(nv)
    flag = true if res
  end

  $checked[v] = true if flag || $vs[v]
  $checked[v]
end

dfs(vs[0])

ans = 0
$checked.each do |c|
  ans += 1 if c
end

puts ans
