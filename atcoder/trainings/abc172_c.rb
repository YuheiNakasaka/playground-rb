# https://atcoder.jp/contests/abc172/tasks/abc172_c
#
# ■考えたこと
# ナップザックっぽい。普通にDPかな。貪欲かな。
# 貪欲だとこういうA,Bの時どうするんだろ
# A: 80 1000 1000 1000
# B: 80 10 10 10
# 一個先読みまでしてコストが低いものを選ぶで十分だったりするか？
# 累積和とかも使う？解けそうで解けない。。。
# ■解説
# 尺取り法か...どういうこっちゃ
# https://blog.hamayanhamayan.com/entry/2020/06/27/230511
#
# Aを何冊目まで読むか決めると、Bを何冊読めるか、自動的に決まる
# 山を選んだ順番は関係なく「最終的にAとB、それぞれ上から何冊目まで読んだか」だけわかれば、『読んだ本の数』と『かかった時間』が決まります。
# https://qiita.com/u2dayo/items/d83ef1c642302abaf89e#c%E5%95%8F%E9%A1%8Ctsundoku
N, M, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

a_sum = Array.new(N + 1, 0)
b_sum = Array.new(M + 1, 0)
1.upto(N) do |i|
  a_sum[i] = a_sum[i - 1] + A[i - 1]
end

1.upto(M) do |i|
  b_sum[i] = b_sum[i - 1] + B[i - 1]
end

ans = 0
0.upto(N) do |i|
  rem = K - a_sum[i]

  if rem < 0
    break
  end

  j = b_sum.bsearch_index { |x| x > rem }
  j = j.nil? ? M : j - 1
  # p("i: #{i}, j: #{j}, rem: #{rem}, a_sum[i]: #{a_sum[i]}, b_sum[j]: #{b_sum[j]}")
  ans = [ans, i + j].max
end

puts(ans)
