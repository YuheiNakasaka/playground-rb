# https://atcoder.jp/contests/abc183/tasks/abc183_d
#
# ■考えたこと
# 全お湯の1分ごとにN人の必要なお湯の量の和を求めておく。そこからNのS~T範囲の数を...いや、これだとO(N^2)になる。
# いもす法で1分ごとにどれだけお湯が必要か求めて置いて(O(max(t)))、毎分Wを超えないかチェックすれば良さそう。O(max(t) + N)で解けるはず。
# ■解説
# https://atcoder.jp/contests/abc183/editorial/284
N, W = gets.split.map(&:to_i)
stp = Array.new(N)
max = -1
N.times do |i|
  arr = gets.split.map(&:to_i)
  max = [max, arr[1]].max
  stp[i] = arr
end

acc = Array.new(max + 1, 0)
stp.each do |x|
  s, t, pa = x
  acc[s] += pa
  acc[t] -= pa
end

1.upto(acc.length - 1) do |i|
  acc[i] += acc[i - 1]
end

ans = "Yes"
acc.each do |a|
  sum = W - a
  if sum < 0
    ans = "No"
    break
  end
end

puts(ans)
