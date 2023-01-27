# しゃくとり法
# 条件を満たすような区間をすべて求めることができる方法
#
# 典型問題: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=DSL_3_C&lang=jp
n = 6
x = 12
a = [5, 3, 8, 6, 1, 4]

res = 0
sum = 0
right = 0
n.times do |left|
  while right < n && sum + a[right] <= x
    sum += a[right]
    right += 1
  end

  res += (right - left)

  if right == left
    right += 1
  else
    sum -= a[left]
  end
end

puts(res)
