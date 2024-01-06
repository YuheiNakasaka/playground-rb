# frozen_string_literal: true

# https://atcoder.jp/contests/abc333/tasks/abc333_e
#
# ■考えたこと
#
# ■解説
#
n = gets.to_i
tx = []
n.times do
  t, x = gets.split.map(&:to_i)
  tx << [t, x - 1]
end

h = Hash.new(0)
now = 0
ans = 0
potion = Array.new(n, nil)
(n - 1).downto(0) do |i|
  t, x = tx[i]
  if t == 1
    if h[x].positive?
      h[x] -= 1
      now -= 1
      potion[i] = 1
    else
      potion[i] = 0
    end
  else
    h[x] += 1
    now += 1
    ans = [ans, now].max
  end
end

if h.values.sum.zero?
  puts ans
  puts potion.reject(&:nil?).join(' ')
else
  puts -1
end
