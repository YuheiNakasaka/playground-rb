# https://atcoder.jp/contests/abc304/tasks/abc304_d
#
# ■考えたこと
# イチゴを中心に考えて、イチゴを含む切れ込みan,bnで最もいちごに近いものを二分探索で選ぶ。
# これを繰り返すといちごがどの長方形に含まれるかはわかる。あとは長方形ごとにイチゴの数を集計していく。
# イチゴの数分だけ二分探索するのでO(nloga + nlogb)で最大最小値の集計でnなので大体O(nloga + nlogb + nlogn)。
# ■解説
#
w, h = gets.split.map(&:to_i)
n = gets.to_i
pq = []
n.times do |i|
  x, y = gets.split.map(&:to_i)
  pq[i] = [x, y]
end

a = gets.to_i
xx = gets.split.map(&:to_i)
b = gets.to_i
yy = gets.split.map(&:to_i)

xx.unshift(0)
xx.push(w)
yy.unshift(0)
yy.push(h)

ans = {}
n.times do |i|
  x, y = pq[i]
  xi = xx.bsearch_index { |c| c >= x }
  yi = yy.bsearch_index { |c| c >= y }
  key = "#{xx[xi - 1]}_#{xx[xi]}_#{yy[yi - 1]}_#{yy[yi]}"
  ans[key] ||= 0
  ans[key] += 1
end

max = 0
min = 10 ** 18
ans.each do |k, v|
  if v > max
    max = v
  end

  if v < min
    min = v
  end
end

if ans.length < (a + 1) * (b + 1)
  min = 0
end

puts("#{min} #{max}")
