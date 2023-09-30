# https://atcoder.jp/contests/abc279/tasks/abc279_d
#
# ■考えたこと
# 単調に増加するか下に凸のグラフになる。底になる部分は1回しかないからそれを二分探索で探す
# ■解説
# 微分すればよかった。あと三分探索とは...
@a, @b = gets.split.map(&:to_i)

def f(i)
  @a / Math.sqrt(i + 1) + @b * i
end

l = 0
r = @a / @b
while r - l > 2
  m1 = (l * 2 + r) / 3
  m2 = (l + r * 2) / 3
  if f(m1) > f(m2)
    l = m1
  else
    r = m2
  end
end

ans = @a
l.upto(r) do |i|
  ans = [ans, f(i)].min
end

puts ans
