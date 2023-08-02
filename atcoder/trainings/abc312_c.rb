# https://atcoder.jp/contests/abc312/tasks/abc312_c
#
# ■考えたこと
# a,bで二分探索して売り手と買い手の数が一致する(0人も含む)ところを探す感じだと思う。
# ■解説
# 答えがaiかbi+1にしかならないということに気づければかなり簡単だ...
# https://atcoder.jp/contests/abc312/tasks/abc312_c/editorial
n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i).sort
b = gets.split.map(&:to_i).sort
b1 = b.map { |bi| bi + 1 }
ab = (a + b1).sort
ans = 10 ** 18
ab.each do |m|
  a_idx = a.bsearch_index { |x| x > m } || a.size
  b_idx = b.bsearch_index { |x| x >= m } || b.size
  a_cnt = a_idx
  b_cnt = b.size - b_idx

  if a_cnt >= b_cnt
    ans = [ans, m].min
  end
end

puts(ans)
