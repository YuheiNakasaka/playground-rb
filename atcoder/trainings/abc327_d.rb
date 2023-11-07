# frozen_string_literal: true

# https://atcoder.jp/contests/abc327/tasks/abc327_d
#
# ■考えたこと
# 二部グラフを作るとわかりやすそう
# ■解説
#
require 'set'
n, m = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)
g = Array.new(n) { Set.new }
m.times do |i|
  g[A[i] - 1] << B[i] - 1
  g[B[i] - 1] << A[i] - 1
end

colored = Array.new(n)

ans = 'Yes'
A.each do |a|
  a -= 1
  break if ans == 'No'
  next unless colored[a].nil?

  q = [[a, 0]]
  until q.empty?
    v, color = q.pop
    colored[v] = color
    g[v].each do |u|
      ans = 'No' if color == colored[u]
      next unless colored[u].nil?

      q.push([u, 1 - color])
    end
  end
end

puts ans
