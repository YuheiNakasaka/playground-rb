# frozen_string_literal: true

# https://atcoder.jp/contests/abc357/tasks/abc357_c
#
# ■考えたこと
#
# ■解説
#
N = gets.to_i
K = 3**N
$carpet = Array.new(3**N) { Array.new(3**N, '.') }

def dfs(size, block, points)
  return if block == 4

  if size == 1
    $carpet[points[1]][points[0]] = '#'
    return
  end

  9.times do |i|
    half = size / 3
    pnts = [points[0] + half * (i % 3), points[1] + half * (i / 3)]
    dfs(half, i, pnts)
  end
end

dfs(K, 0, [0, 0])
$carpet.each do |c|
  puts c.join('')
end
