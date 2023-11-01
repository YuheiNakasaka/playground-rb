# frozen_string_literal: true

# https://atcoder.jp/contests/abc325/tasks/abc325_e
#
# ■考えたこと
# どう考えてもDP
# ■解説
# ダイクストラだった
# 完全グラフというのもミソ
@n, @a, @b, @c = gets.split.map(&:to_i)
@d = Array.new(@n) { [] }
@n.times do |i|
  @d[i] = gets.split.map(&:to_i)
end

@inf = 1_000_000_000_000_000_000

def dijk(start, b, c)
  dist = Array.new(@n, @inf)
  dist[start] = 0
  done = Array.new(@n, false)
  @n.times do |ni|
    best = [@inf, 0]
    @n.times do |i|
      best = [dist[i], i] if done[i].! && best[0] > dist[i]
    end
    v = best[1]
    done[v] = true
    @n.times do |i|
      dist[i] = [dist[i], dist[v] + @d[v][i] * b + c].min
    end
  end
  dist
end

d1 = dijk(0, @a, 0)
d2 = dijk(@n - 1, @b, @c)
ans = @inf
@n.times do |i|
  ans = [ans, d1[i] + d2[i]].min
end

puts ans
