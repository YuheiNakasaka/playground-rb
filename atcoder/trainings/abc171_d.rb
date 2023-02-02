# https://atcoder.jp/contests/abc171/tasks/abc171_d
#
# aのヒストグラムの数列を作る
# aの合計を求める
# aのヒストグラムからbとcの頻度を入れ替える
# aの合計からその入れ替え分を足し引きする
#
# 普通に解けた。わいわい。
# 解説も自分の考え方と同じだった。
# https://drken1215.hatenablog.com/entry/2020/06/21/224900

N = gets.to_i
a = gets.split.map(&:to_i)
Q = gets.to_i

h = Array.new(10 ** 5 + 1, 0)
a.each do |i|
  h[i] += 1
end

a_sum = a.sum

Q.times do |i|
  b, c = gets.split.map(&:to_i)
  b_cnt = h[b]
  if b_cnt == 0
    puts(a_sum)
    next
  end

  diff = c * b_cnt - b * b_cnt
  a_sum += diff
  h[b] = 0
  h[c] += b_cnt
  puts(a_sum)
end
