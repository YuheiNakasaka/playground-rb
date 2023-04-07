# https://atcoder.jp/contests/abc187/tasks/abc187_d
#
# ■考えたこと
# sumしてソートして貪欲
# うまくいかない。DPとかか？
# ■解説
# 差はA+Bではなく、2A+Bであることに注意。
# https://atcoder.jp/contests/abc187/editorial/486
# https://drken1215.hatenablog.com/entry/2021/01/03/182300
N = gets.to_i
AB = []
na = 0
ans = 0
N.times do |i|
  a, b = gets.split.map(&:to_i)
  na -= a
  AB << 2 * a + b
end

AB.sort!.reverse!

AB.each do |ab|
  na += ab
  ans += 1
  if na > 0
    break
  end
end

puts(ans)
