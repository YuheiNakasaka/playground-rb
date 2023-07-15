# https://atcoder.jp/contests/abc305/tasks/abc305_d
#
# ■考えたこと
# 累積和と二分探索かな〜
# ■解説
#
n = gets.to_i
a = gets.split.map(&:to_i)
q = gets.to_i
l = []
r = []
q.times do |i|
  x, y = gets.split.map(&:to_i)
  l << x
  r << y
end

acc = Array.new(n, 0)
(n - 1).times do |i|
  acc[i + 1] = acc[i]
  if i % 2 == 1
    acc[i + 1] = acc[i + 1] + a[i + 1] - a[i]
  end
end

ans = []
q.times do |i|
  x = l[i]
  y = r[i]
  x_idx = a.bsearch_index { |e| e >= x }
  y_idx = a.bsearch_index { |e| e >= y }
  is_same_idx = x_idx == y_idx

  if is_same_idx
    if x_idx % 2 == 0
      ans << y - x
    else
      ans << 0
    end
  else
    sum = 0
    if x_idx % 2 == 0
      sum += a[x_idx] - x
    end

    if y_idx % 2 == 0
      sum += y - a[y_idx - 1] if y_idx - 1 >= 0
    end

    ans << acc[y_idx - 1] - acc[x_idx] + sum
  end
end

ans.each { |a| puts(a) }
