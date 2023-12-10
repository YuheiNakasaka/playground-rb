# frozen_string_literal: true

# https://atcoder.jp/contests/abc274/tasks/abc274_d
#
# ■考えたこと
#
# ■解説
# 縦横に分けてそれぞれ独立でDPする
require 'set'
n, x, y = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
arx = []
ary = []

n.times do |i|
  i.even? ? arx << a[i] : ary << a[i]
end

nx = arx.size
ny = ary.size
dpx = Array.new(nx) { Set.new }
dpy = Array.new(ny + 1) { Set.new }
dpx[0].add(a[0])
dpy[0].add(0)

0.upto(nx - 2) do |i|
  dpx[i].each do |d|
    dpx[i + 1].add(d + arx[i + 1])
    dpx[i + 1].add(d - arx[i + 1])
  end
end

0.upto(ny - 1) do |i|
  dpy[i].each do |d|
    dpy[i + 1].add(d + ary[i])
    dpy[i + 1].add(d - ary[i])
  end
end

puts dpx[nx - 1].include?(x) && dpy[ny].include?(y) ? 'Yes' : 'No'
