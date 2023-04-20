# https://atcoder.jp/contests/abc191/tasks/abc191_d
#
# ■考えたこと
# 円の中心から左上右下方向に1ずつずらしてて直角方向にある点が円周内かどうかを判定していく？
# ■解説
# 考え方はわかったが、小数点の扱いや負の場合の考慮などが難しかった...
# https://atcoder.jp/contests/abc191/editorial/611
# https://yamakasa.net/atcoder-abc-191-d/
x, y, r = gets.split.map { |x| (x.to_r * 10000).to_i }
sx = (x - r + 9999) / 10000
ex = (x + r) / 10000
ans = 0
# p("sx: #{sx} #{x - r}, ex: #{ex} #{x + r}")
sx.upto(ex) do |i|
  m = r * r - (i * 10000 - x) * (i * 10000 - x)
  k = Integer.sqrt(m)
  sy = (y - k + 9999) / 10000
  ey = (y + k) / 10000
  ans += ey - sy + 1
end

puts(ans)
